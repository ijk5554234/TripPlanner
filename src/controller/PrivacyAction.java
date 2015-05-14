/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import model.Model;

public class PrivacyAction extends Action {

	public PrivacyAction(Model model) {

	}

	public String getName() {
		return "PrivacyAction.do";
	}

	public String perform(HttpServletRequest request) {
		
		return "privacypolicy.jsp";
	}
}
