package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.UserDAO;
import model.Model;
import databeans.UserBean;

import org.genericdao.RollbackException;

public class CheckFareAction extends Action {
	private UserDAO userDAO;

	public CheckFareAction(Model model) {
		userDAO = model.getUserDAO();
	}

	public String getName() {
		return "checkFare.do";
	}

	public String perform(HttpServletRequest request) {
		
		return "manage.do";
	}
}
