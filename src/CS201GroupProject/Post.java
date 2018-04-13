import java.util.Vector;

public class Post {
    private int postID; // unique under course
    private int userID;
    private String title;
    private String body;
    private Vector<Reply> replies;
    private Vector<User> followers;

    public Post( int n, int u, String t, String b ){
	postID = n;
	userID = u;
	title = t;
	body = b;
	replies = new Vector<Reply>();
	followers = new Vector<User>();
    }

    public String getCreatorName() {
	return creator.getName();
    }

    public String getCourse() {
	return courseName();
    }

    public String getTitle() {
	return title;
    }

    public String getBodY() {
	return body;
    }

    public Vector<Reply> getReplies() {
	return replies;
    }

    public Vector<User> getFollowers() {
	return followers;
    }

    public void addReply( Reply r ) {
	replies.add(r);
    }

    public void addFollower( User u ){
	followers.add(u);
    }
}
