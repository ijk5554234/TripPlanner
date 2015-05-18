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

public class RegisterForm extends FormBean {
	private String userName;
	private String firstName;
	private String lastName;
	private String password;
	private String rePass;
	private String action;
	
	public void setUserName(String s)  { userName   = trimAndConvert(s,"<>\""); }
	public void setFirstName(String s) { firstName  = trimAndConvert(s,"<>\""); }
	public void setLastName(String s)  { lastName   = trimAndConvert(s,"<>\""); }	
	public void setAction(String s)    { action     = trimAndConvert(s,"<>\"");	}
	public void setPassword(String s)  { password   = trimAndConvert(s,"<>\"");	}
	public void setRePass(String s)    { rePass     = trimAndConvert(s,"<>\"");	}
	
	public String getUserName()  { return userName;	 }
	public String getFirstName() { return firstName; }
    public String getLastName()  { return lastName;  }
	public String getPassword()  { return password;  }
	public String getRePass()    { return rePass;    }
	public String getAction()    { return action;    }


	public List<String> getValidationErrors() {
		ArrayList<String> errors = new ArrayList<String>();

		if (userName == null || userName.length() == 0)
			errors.add("Username is required");
		if (password == null || password.trim().length() == 0)
			errors.add("Password is required and cannot be blank");
		if (lastName == null || lastName.trim().length() == 0)
			errors.add("Last Name is required");
		if (firstName == null || firstName.trim().length() == 0)
			errors.add("First Name is required");
		if (!password.equals(rePass)) {
			errors.add("Password and rePass are different.");
		}
			return errors;

	}
}