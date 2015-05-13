package controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		UserBean user = (UserBean) request.getSession(false).getAttribute("user");
		if (user == null) {
			return "employee_login.do";
		}
		try {

			List<String> errors = new ArrayList<String>();
			request.setAttribute("errors", errors);

			RegisterForm form = (RegisterForm) formBeanFactory.create(request);

			if (!form.isPresent()) return "register.jsp";

			errors.addAll(form.getValidationErrors());

			if (errors.size() != 0) {
				return "register.jsp";
			}

			UserBean[] cb = userDAO.match(MatchArg.equals("userName", form.getUserName()));
			if (cb.length != 0) {
				errors.add("Email already exists.");
				return "register.jsp";
			}

			UserBean customer = new UserBean();
			customer.setUserName(form.getUserName());
			customer.setFirstName(form.getFirstName());
			customer.setLastName(form.getLastName());
			customer.setPassword(form.getPassword());
			request.setAttribute("msg", "Account for " + customer.getFirstName() + " " + customer.getLastName() + " has been created");
			
			userDAO.create(customer);
		} catch (RollbackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FormBeanException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "index.jsp";

	}
}

