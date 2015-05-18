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

public class TakeWorkAction extends Action {

	public TakeWorkAction(Model model) {
	}

	public String getName() {
		return "takeWork.do";
	}

	public String perform(HttpServletRequest request) {

		HttpSession session = request.getSession();

		UserBean user = (UserBean) session.getAttribute("user");
		request.setAttribute("curr", "Newell Simon Hall Pittsburgh, PA 15213");
		request.setAttribute("dest", user.getWork());
		
		return "TripPlan.jsp";

	}
}
