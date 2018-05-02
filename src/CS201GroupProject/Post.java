package CS201GroupProject;

import java.util.Vector;

public class Post {
    private int postID; // unique under course
    private int userID;
    private String title;
    private String body;

    public Post( int n, int u, String t, String b ){
	postID = n;
	userID = u;
	title = t;
	body = b;
    }

    public int getPostID() {
    		return postID;
    }
    
    public int getUserID() {
    		return userID;
    }
    
    public String getTitle() {
	return title;
    }

    public String getBody() {
	return body;
    }

}