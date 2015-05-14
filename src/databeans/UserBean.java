/*
 * Team 4
 * Task 13
 * Date: May 214, 2015
 * Only for educational use
 */
package databeans;

//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.util.Random;

import org.genericdao.PrimaryKey;

@PrimaryKey("userName")
public class UserBean {
	
	private String userName;
	private String firstName;
	private String lastName;
	private String password;
	private String home;
	private String work;
	
//	private String  hashedPassword = "*";
//	private int     salt           = 0;
	
	public String getUserName()     { return userName;  }
	public String getFirstName()    { return firstName; }
	public String getLastName()     { return lastName;  }
	public String getPassword()     { return password;  }
	public String getHome()         { return home;      }
	public String getWork()			{ return work;		}

	public void setUserName(String s)     { userName   = s; }
    public void setFirstName(String s) 	  {	firstName  = s; }
	public void setLastName(String s)     {	lastName   = s; }
	public void setPassword(String s)     {	password   = s; }
	public void setHome(String s)     	  {	home 	   = s; }
	public void setWork(String s)     	  {	work       = s; }
	
//	public String  getHashedPassword() { return hashedPassword; }
//	public int     getSalt()           { return salt;           }
//	
//	public void setSalt(int x)               { salt = x;           }
//	public void setHashedPassword(String x)  { hashedPassword = x; }
//	
//	private String hash(String clearPassword) {
//		if (salt == 0) return null;
//
//		MessageDigest md = null;
//		try {
//		  md = MessageDigest.getInstance("SHA1");
//		} catch (NoSuchAlgorithmException e) {
//		  throw new AssertionError("Can't find the SHA1 algorithm in the java.security package");
//		}
//
//		String saltString = String.valueOf(salt);
//		
//		md.update(saltString.getBytes());
//		md.update(clearPassword.getBytes());
//		byte[] digestBytes = md.digest();
//
//		// Format the digest as a String
//		StringBuffer digestSB = new StringBuffer();
//		for (int i=0; i<digestBytes.length; i++) {
//		  int lowNibble = digestBytes[i] & 0x0f;
//		  int highNibble = (digestBytes[i]>>4) & 0x0f;
//		  digestSB.append(Integer.toHexString(highNibble));
//		  digestSB.append(Integer.toHexString(lowNibble));
//		}
//		String digestStr = digestSB.toString();
//
//		return digestStr;
//	}
//
//	private int newSalt() {
//		Random random = new Random();
//		return random.nextInt(8192)+1;  // salt cannot be zero
//	}
//	
}
