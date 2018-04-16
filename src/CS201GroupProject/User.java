package CS201GroupProject;

import java.util.Vector;

public class User {
    private int userID; //global unique
    private String fname;
    private String lname;
    private String email;
    private String password;
    private Vector<Course> courses;
    private Vector<Post> following;
    
    public User( int n, String first, String last, String e, String p ) {
		userID = n;
		fname = first;
		lname = last;
		email = e;
		password = p;
		courses = new Vector<Course>();
		following = new Vector<Post>();
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

    public Vector<Course> getCourses() {
    		return courses;
    }

    public Vector<Post> getFollowing() {
    		return following;
    }

    public void addCourse( Course c ) {
    		courses.add(c);
    }

    public void addPost( Post p ) {
    		following.add(p);
    }

    public boolean removeCourse( Course c ) {
    		return courses.remove( c );
    }
}
