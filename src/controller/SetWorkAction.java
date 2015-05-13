package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.Model;
import databeans.UserBean;

import org.genericdao.RollbackException;

public class SetWorkAction extends Action {
	private UserDAO userDAO;

	public SetWorkAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "setwork.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);

		try {

			if (errors.size() != 0) {
				request.setAttribute("errors", errors);
				return "login.jsp";
			}
			HttpSession session = request.getSession();
			
			UserBean user = (UserBean) session.getAttribute("user");
			
			
			String work = request.getParameter("work");
			
			
			userDAO.setHome(user.getUserName(), work);
						

			session.setAttribute("user", user);


		} catch (RollbackException e) {
			e.printStackTrace();
		}
		
		return "manage.do";
	}
}
