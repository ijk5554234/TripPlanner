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
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.Model;
import databeans.UserBean;
import org.genericdao.RollbackException;

public class SetAddr extends Action {
	private UserDAO userDAO;

	public SetAddr(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "setAddr.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);

		try {

			if (errors.size() != 0) {
				request.setAttribute("errors", errors);
				return "manage.do";
			}
			HttpSession session = request.getSession();
			
			UserBean user = (UserBean) session.getAttribute("user");
			
			
			String home = request.getParameter("home");
			if (home != null && home.length() != 0) {
				userDAO.setHome(user.getUserName(), home);
			}
			
			String work = request.getParameter("work");
			if (work != null && home.length() != 0) {
				userDAO.setWork(user.getUserName(), work);
			}			

			session.setAttribute("user", user);
			return "manage.do";

		} catch (RollbackException e) {
			e.printStackTrace();
		}
		
		return "manage.do";
	}
}