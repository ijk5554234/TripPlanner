/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import databeans.BusStop;

public class PAAC {
	private final String key = "key=467Ppp3HDj4H7sqeMLuRJatjA&format=json";
	private final String server = "http://realtime.portauthority.org/bustime/api/v2/";		

	// get real-time vehicle for a bus line
	public String getVehicles (String route) {
		String method = "GET";
		String url = server + "getvehicles?" + key + "&rt=" + route;
		HttpUtil hu = new HttpUtil(method, url);
		hu.excute();
		return hu.getDataString();
	}
	
	// get all busstops for a route in one direction
	public HashMap<String, String> getStops (String route, String dir) throws JSONException {
		String method = "GET";
		String url = server + "getstops?" + key + "&rt=" + route + "&dir=" + dir;
		HttpUtil hu = new HttpUtil(method, url);
		hu.excute();
		
		LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();
		JSONArray stops = hu.getData().getJSONObject("bustime-response").getJSONArray("stops");
		
		for (int i = 0; i < stops.length(); ++i) 
			map.put(stops.getJSONObject(i).get("stpnm").toString().toLowerCase(), 
					stops.getJSONObject(i).get("stpid").toString());
		
		return map;
	}
	
	// predict the time for a bus to a stop
	public String getPrediction (String route, String stopid) throws JSONException {
		if (stopid == null) return "N/A";
		
		String method = "GET";
		String url = server + "getpredictions?" + key + "&rt=" + route + "&stpid=" + stopid;
		HttpUtil hu = new HttpUtil(method, url);
		hu.excute();
		
		JSONObject message = hu.getData().getJSONObject("bustime-response");
		
		if (message.has("error")) {
			return "N/A";
		}
		
		JSONArray pred = message.getJSONArray("prd");
		
		String p = "DUE";
		if (pred.length() > 0) {
			for (int i = 0; i < pred.length() && p.equals("DUE"); ++i) {
				p = pred.getJSONObject(0).get("prdctdn").toString();
			}
		}
		
		return p.equals("DUE") ? "N/A" : p;
	}
	
	public ArrayList<BusStop> getBusStops(String route, boolean isInBound) {
		ArrayList<BusStop> res = new ArrayList<BusStop>();
		
		String method = "GET";
		String url = server + "getstops?" + key + "&rt=" + route + "&dir=" + (isInBound ? "INBOUND" : "OUTBOUND");
		
		HttpUtil hu = new HttpUtil(method, url);
		hu.excute();
		try {
			JSONArray stops = hu.getData().getJSONObject("bustime-response").getJSONArray("stops");
			for (int i = 0; i < stops.length(); i++) {
				JSONObject stop = stops.getJSONObject(i);
				BusStop tmp = new BusStop();
				tmp.setStopId(stop.getString("stpid"));
				tmp.setStopName(stop.getString("stpnm"));
				tmp.setLat(stop.get("lat").toString());
				tmp.setLng(stop.get("lon").toString());
				res.add(tmp);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		
		return res;
	}	

}