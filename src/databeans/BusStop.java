/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package databeans;

public class BusStop {

	private String stopId;
	private String stopName;
	private String lat;
	private String lng;
	
	
	public String getStopId() {
		return stopId;
	}
	public String getStopName() {
		return stopName;
	}
	public String getLat() {
		return lat;
	}
	public String getLng() {
		return lng;
	}
	
	
	public void setStopId(String stopId) {
		this.stopId = stopId;
	}
	public void setStopName(String stopName) {
		this.stopName = stopName;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
}
