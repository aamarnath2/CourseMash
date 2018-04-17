package CS201GroupProject;

import java.util.Vector;

public class User {
    private int userID; //global unique
    private String fname;
    private String lname;
    private String email;
    private String password;
    
    public User( int n, String first, String last, String e, String p ) {
		userID = n;
		fname = first;
		lname = last;
		email = e;
		password = p;
    }

    public int getUserID() {
    		return userID;
    }

    public String getName() {
    		return fname + " " + lname;
    }

    public String getPassword() {
    		return password;
    }

    public String getEmail() {
    		return email;
    }
}
