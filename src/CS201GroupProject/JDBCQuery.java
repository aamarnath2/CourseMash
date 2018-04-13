public class JDBCQuery {

    private static Connection conn = null;
    private static ResultSet rs = null;
    private static PreparedStatement ps = null;

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost/CourseMash";

    static final String USER = "root";
    static final String PASS = "password";

    public static void connect() {
	try {
	    Class.forName("com.mysql.jdbc.Driver");
	    conn = DriverManager.getConnection(DB_URL, USER, PASS);
	} catch (ClassNotFoundException e) {
	    e.printStackTrace();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
    }

    public static void close() {
	try {
	    if (rs != null) {
		rs.close();
		rs = null;
	    }
	    if (conn != null) {
		conn.close();
		conn = null;
	    }
	    if (ps != null) {
		ps = null;
	    }
	} catch (SQLException sqle) {
	    System.out.println("connection close error");
	    sqle.printStackTrace();
	}
    }
    
    private final static String selectAllCourses = "SELECT * FROM Courses";

    public static Vector<Course> getallCourses() {
	connect();
	Vector<Course> courses = new Vector<Course>();
	try {
	    PreparedStatement ps = conn.preparedStatement(selectAllCourses);
	    ResultSet result = ps.executeQuery();
	    while(result.next()){
		courses.add(new Course(result.getInt("courseID"), result.getString("prefix"), result.getString("courseName"), result.getString("professor")));
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    close();
	}
	return courses;
    }

    private final static String selectTitlesByCourse = "SELECT title FROM Posts p, Courses c WHERE p.courseID=c.courseID AND c.courseID=?";

    public static Vector<String> getTitlesByCourseID( int courseID ) {
	connect();
	Vector<String> titles = new Vector<String>();
	try {
	    PreparedStatement ps = conn.preparedStatement(selectTitlesByCourse);
	    ps.setInt(1, courseID);
	    ResultSet result = ps.executeQuery();
	    while(result.next()){
		titles.add(result.getString("title"));
	    }
	} catch( SQLException e ){
	    e.printStackTrace();
	} finally {
	    close();
	}
	return titles;
    }

    private final static String selectCoursesByUser = "SELEECT courseID, prefix, courseName, proffesor FROM Courses c, Users u, CourseUsers cu WHERE c.courseID=cu.courseID AND u.userID=cu.userID AND u.userID=?";

    public static Vector<Course> getCoursesByUserID( int userID ){
	connect();
	Vector<Course> courses = new Vector<Course>();
	try {
	    PreparedStatement ps = conn.preparedStatement(selectCoursesByUser);
	    ps.setInt(1, userID);
	    ResultSet result = ps.executeQuery();
	    while(result.next()){
		courses.add(new Course(result.getInt("courseID"), result.getString("prefix"), result.getString("courseName"), result.getString("professor")));
	    }
	} catch( SQLException e ){
	    e.printStackTrace();
	} finally {
	    close();
	}
	return courses;
    }

    private final static String selectPostsByCourse = "SELECT postID, userID, title, body FROM Posts p, Courses c WHERE p.courseID=c.courseID AND c.courseID=?";

    public static Vector<Post> getPostsByCourseID( int courseID ) {
	connect();
	Vector<Post> posts = new Vector<Post>();
	try {
	    PreparedStatement ps = conn.preparedStatement(selectPostsByCourse);
	    ps.setInt(1, courseID);
	    ResultSet result = ps.executeQuery();
	    while(result.next()){
		posts.add(new Post(result.getInt("postID"), result.getInt("userID"), result.getString("title"), result.getString("body")));
	    }
	} catch( SQLException e ){
	    e.printStackTrace();
	} finally {
	    close();
	}
	return posts;
    }

    private final static String selectRepliesByPost = "SELECT userID, reply FROM Users u, Posts p, Replies r WHERE u.userID=r.userID AND p.postID=r.postID AND p.postID=?";

    public static Vector<Post> getRepliesByPostID( int postID ) {
	connect();
	Vector<Reply> replies = new Vector<Reply>();
	try {
	    PreparedStatement ps = conn.preparedStatement(selectRepliesByPost);
	    ps.setInt(1, postID);
	    ResultSet result = ps.executeQuery();
	    while(result.next()){
		posts.add(new Reply(result.getInt("userID"), result.getString("reply")));
	    }
	} catch( SQLException e ){
	    e.printStackTrace();
	} finally {
	    close();
	}
	return replies;
    }

    /*
    private final static String selectPassword = "SELECT password FROM Users u WHERE u.email=?";
    
    public static boolean validate(String email, String password) {
	connect();
	try {
	    PreparedStatement ps = conn.prepareStatement(selectPassword);
	    ps.setString(1, email);
	    ResultSet result = ps.executeQuery();
	    if (rs.next()) {
		if (password.equals(result.getString("password"))) {
		    return true;
		}
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	} finally {
	    close();
	}
	return false;
    }
    */

    
