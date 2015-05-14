/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package controller;


import javax.servlet.http.HttpServletRequest;

import model.Model;


public class CheckFareAction extends Action {

	public CheckFareAction(Model model) {

	}

	public String getName() {
		return "checkFare.do";
	}

	public String perform(HttpServletRequest request) {
		String bus = request.getParameter("bus");
		if (bus == null)
			return "FareChecker.jsp";
		if (bus.toLowerCase().equals("28x")) {
			request.setAttribute("fare", "Charge of " + bus + " is $3.5");
		} else {
			request.setAttribute("fare", "Charge of " + bus + " is $2.5");
		}
		return "FareChecker.jsp";
	}
}
