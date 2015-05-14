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
import model.Model;

public class TripPlanAction extends Action {

	public TripPlanAction(Model model) {
	}

	public String getName() {
		return "TripPlan.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);

		
		return "TripPlan.jsp";
	}
}