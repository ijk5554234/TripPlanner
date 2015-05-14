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

import model.UserDAO;
import model.Model;

import org.genericdao.RollbackException;
import org.mybeans.form.FormBeanException;
import org.mybeans.form.FormBeanFactory;

import databeans.UserBean;
import formbeans.ChangePwdForm;

public class ChangePswAction extends Action {
	private FormBeanFactory<ChangePwdForm> formBeanFactory = FormBeanFactory
			.getInstance(ChangePwdForm.class);
	private UserDAO userDAO;

	public ChangePswAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "changepsw.do";
	}

	public String perform(HttpServletRequest request) {
		try {
			UserBean user = (UserBean) request.getSession(false).getAttribute(
					"user");
			if (user == null) {
				return "login.do";
			}
			List<String> errors = new ArrayList<String>();
			request.setAttribute("errors", errors);

			ChangePwdForm form = (ChangePwdForm) formBeanFactory
					.create(request);

			if (!form.isPresent())
				return "changepsw.jsp";

			errors.addAll(form.getValidationErrors());
			if (errors.size() != 0)
				return "changepsw.jsp";

			UserBean employee = (UserBean) request.getSession().getAttribute(
					"user");

			userDAO.setPassword(employee.getUserName(), form.getNewPassword());
			request.setAttribute("msg", "Password of you has been changed");

		} catch (RollbackException e) {
			e.printStackTrace();
		} catch (FormBeanException e) {
			e.printStackTrace();
		}

		return "changepsw.jsp";

	}
}
