import java.util.Vector;

public class Course {
    private int courseID;
    private String prefix;
    private String name;
    private String prof;
    private Vector<Post> coursePosts;
    private Vector<User> courseUsers;

    public Course( int n, String pre, String s, String p ){
	courseID = n;
	prefix = pre;
	name = s;
	prof = p;
	coursePosts = new Vector<Post>();
	courseUsers = new Vector<User>();
    }

    public String getFullName() {
	return prefix + " " + name;
    }

    public String getProfesso() {
	return prof;
    }

    public Vector<Post> getPosts() {
	return coursePosts;
    }

    public Vector<User> getUsers() {
	return courseUsers;
    }

    public boolean removeUser( User u ) {
	return courseUsers.remove(u);
    }
}
