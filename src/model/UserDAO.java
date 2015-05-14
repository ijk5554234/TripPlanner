/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package model;

import org.genericdao.ConnectionPool;
import org.genericdao.DAOException;
import org.genericdao.GenericDAO;
import org.genericdao.RollbackException;
import org.genericdao.Transaction;

import databeans.UserBean;

public class UserDAO extends GenericDAO<UserBean> {

	public UserDAO(String tableName, ConnectionPool pool) throws DAOException {
		super(UserBean.class, tableName, pool);
	}

	public void setPassword(String userName, String password)
			throws RollbackException {
		try {
			Transaction.begin();
			UserBean user = read(userName);

			if (user == null) {
				throw new RollbackException("UserName " + userName
						+ " no longer exists");
			}

			user.setPassword(password);

			update(user);
			Transaction.commit();
		} finally {
			if (Transaction.isActive())
				Transaction.rollback();
		}
	}

	public void setHome(String userName, String home) throws RollbackException {
		try {
			Transaction.begin();
			UserBean user = read(userName);
			if (user == null) {
				throw new RollbackException("UserName " + userName
						+ " no longer exists");
			}

			user.setHome(home);

			update(user);
			Transaction.commit();

		} finally {
			if (Transaction.isActive())
				Transaction.rollback();
		}
	}

	public void setWork(String userName, String work) throws RollbackException {
		try {
			Transaction.begin();
			UserBean user = read(userName);
			if (user == null) {
				throw new RollbackException("UserName " + userName
						+ " no longer exists");
			}

			user.setWork(work);

			update(user);
			Transaction.commit();

		} finally {
			if (Transaction.isActive())
				Transaction.rollback();
		}
	}
}
