/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import model.PAAC;
import model.Model;
import databeans.BusStop;


import org.json.JSONException;


public class GetTimeAction extends Action {

	public GetTimeAction(Model model) {
		
	}

	public String getName() {
		return "getTime.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);
		PAAC paac = new PAAC();
		String route = request.getParameter("route");
		if (route == null)
			return "predict.jsp";
		route = route.toUpperCase();
		request.setAttribute("route", route);
		String stopId = request.getParameter("stopId");
		boolean inbound = request.getParameter("inbound") == null;
		ArrayList<BusStop> stops = paac.getBusStops(route, inbound);
		request.setAttribute("stops", stops);
		if (stopId == null) {
			return "predict.jsp";
		}
		
		try {
			String time = paac.getPrediction(route, stopId);
			if(time.equals("N/A")) {
				time = "Sorry, no available bus now.";
				return "predict.jsp";
			}
			request.setAttribute("time",  "Next " + route + " will arrive in " + time + " mins");
			return "predict.jsp";
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "predict.jsp";
	}
}
