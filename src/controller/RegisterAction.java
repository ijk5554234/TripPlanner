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

import model.Model;
import model.UserDAO;

import org.genericdao.MatchArg;
import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import databeans.UserBean;
import formbeans.RegisterForm;

public class RegisterAction extends Action {
	private FormBeanFactory<RegisterForm> formBeanFactory = FormBeanFactory.getInstance(RegisterForm.class);
	private UserDAO userDAO;

	public RegisterAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "register.do";
	}

	public String perform(HttpServletRequest request) {
		try {

			List<String> errors = new ArrayList<String>();
			request.setAttribute("errors", errors);

			RegisterForm form = (RegisterForm) formBeanFactory.create(request);

			if (!form.isPresent()) return "manage.do";

			errors.addAll(form.getValidationErrors());

			if (errors.size() != 0) {
				return "manage.do";
			}

			UserBean[] cb = userDAO.match(MatchArg.equals("userName", form.getUserName()));
			if (cb.length != 0) {
				errors.add("Username already exists.");
				return "manage.do";
			}

			UserBean user = new UserBean();
			user.setUserName(form.getUserName());
			user.setFirstName(form.getFirstName());
			user.setLastName(form.getLastName());
			user.setPassword(form.getPassword());
			request.setAttribute("msg", "Account for " + user.getFirstName() + " " + user.getLastName() + " has been created");
			
			userDAO.create(user);
			System.out.println(user.getFirstName());
	        HttpSession session = request.getSession(false);
	        session.setAttribute("user",user);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FormBeanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "manage.do";

	}
}

