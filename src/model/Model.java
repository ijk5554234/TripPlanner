/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package model;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.RollbackException;

import databeans.UserBean;

public class Model {
	private UserDAO  userDAO;

	

	public Model(ServletConfig config) throws ServletException {
		try {
			String jdbcDriver = config.getInitParameter("jdbcDriverName");
			String jdbcURL    = config.getInitParameter("jdbcURL");
		
			ConnectionPool pool = new ConnectionPool(jdbcDriver, jdbcURL);
			userDAO = new UserDAO("user", pool);
			
		} catch (DAOException e) {
			throw new ServletException(e);
		}
		
		try {
			if (userDAO.read("admin") == null) {
				UserBean admin = new UserBean();
				admin.setFirstName("John");
				admin.setLastName("Smith");
				admin.setPassword("123");
				admin.setUserName("admin");
				userDAO.create(admin);
			}
		} catch (RollbackException e) {
			e.printStackTrace();
		}
	}
	
	public UserDAO getUserDAO() { return userDAO; }
}
