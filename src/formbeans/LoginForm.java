/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package formbeans;

import java.util.ArrayList;
import java.util.List;

import org.mybeans.form.FormBean;

public class LoginForm extends FormBean{
	private String userName;
	private String password;
	private String action;
	
	public void setUserName(String s) { userName = trimAndConvert(s,"<>\""); }
	public void setAction(String s)   { action   = trimAndConvert(s,"<>\""); }
	public void setPassword(String s) { password = trimAndConvert(s,"<>\""); }
	public String getUserName() { return userName; }
	public String getPassword() { return password; }
	public String getAction()   { return action;   }


	public List<String> getValidationErrors() {
		List<String> errors = new ArrayList<String>();

		if (userName == null || userName.length() == 0)
			errors.add("UserName is required");
		if (password == null || password.length() == 0)
			errors.add("Password is required");

		if (errors.size() > 0)
			return errors;

		return errors;
	}
}
