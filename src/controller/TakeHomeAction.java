/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.Model;
import databeans.UserBean;

public class TakeHomeAction extends Action {

	public TakeHomeAction(Model model) {
	}

	public String getName() {
		return "takeHome.do";
	}

	public String perform(HttpServletRequest request) {

		HttpSession session = request.getSession();

		UserBean user = (UserBean) session.getAttribute("user");
		request.setAttribute("curr", "Newell Simon Hall Pittsburgh, PA 15213");
		request.setAttribute("dest", user.getHome());
		System.out.println(user.getHome());
		
		return "TripPlan.do";

	}
}
