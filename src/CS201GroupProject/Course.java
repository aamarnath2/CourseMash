package CS201GroupProject;

import java.util.Vector;

public class Course {
    private int courseID;
    private String prefix;
    private String name;
    private String prof;

    public Course( int n, String pre, String s, String p ){
	courseID = n;
	prefix = pre;
	name = s;
	prof = p;
    }
    
    
    public int getCourseID() {
    		return courseID;
    }
    
    public String getFullName() {
    		return name;
    }

    public String getProfessor() {
    		return prof;
    }
}
