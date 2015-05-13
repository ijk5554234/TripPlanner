package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.Model;
import databeans.UserBean;
import formbeans.LoginForm;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

public class SetHomeAction extends Action {
	private UserDAO userDAO;

	public SetHomeAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "sethome.do";
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
			
			
			String home = request.getParameter("home");
			
			
			userDAO.setHome(user.getUserName(), home);
						

			session.setAttribute("user", user);


		} catch (RollbackException e) {
			e.printStackTrace();
		}
		
		return "manage.do";
	}
}