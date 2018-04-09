import java.util.Vector;

public class Post {
    private int postID; // unique under course
    private User creator;
    private String courseName;
    private String title;
    private String body;
    private Vector<Reply> replies;
    private Vector<User> followers;

    public Post( User c, String n, String t, String b ){
	creator = c;
	courseName = n;
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
