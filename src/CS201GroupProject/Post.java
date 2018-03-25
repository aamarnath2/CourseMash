import java.util.List;

public class Post {
	private int postID; // unique under course
	private String title;
	private String body;
	private List<Reply> replies;
	private List<User> followers;
}
