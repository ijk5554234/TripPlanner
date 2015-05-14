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
import formbeans.LoginForm;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

public class LoginAction extends Action {
	private FormBeanFactory<LoginForm> formBeanFactory = FormBeanFactory.getInstance(LoginForm.class);

	private UserDAO userDAO;

	public LoginAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "login.do";
	}

	public String perform(HttpServletRequest request) {
		List<String> errors = new ArrayList<String>();
		request.setAttribute("errors", errors);

		try {
			LoginForm form = formBeanFactory.create(request);

			if (!form.isPresent()) {
				return "manage.do";
			}
			System.out.println("11");
			errors.addAll(form.getValidationErrors());
			if (errors.size() != 0) {
				request.setAttribute("errors", errors);
				return "manage.do";
			}

			// Look up the user
			UserBean userBean = userDAO.read(form.getUserName());
			System.out.println("2");

			if (userBean == null) {
				errors.add("UserName not found");
				return "manage.do";
			}

			// Check the password
			if (!(userBean.getPassword().equals(form.getPassword()))) {
				errors.add("Incorrect password");
				return "manage.do";
			}
			
			
			// Attach (this copy of) the user bean to the session
			HttpSession session = request.getSession();
			session.setAttribute("user", userBean);


		} catch (FormBeanException e) {
			errors.add(e.getMessage());
			return "manage.do";
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "manage.do";
	}
}