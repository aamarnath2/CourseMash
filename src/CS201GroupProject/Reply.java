import java.sql.Time;
import java.util.Vector;

public class Reply {
    private int userID;
    private String reply;

    public Reply( int u, String r ) {
	userID = u;
	reply = r;
    }

    public int getUserID() {
	return userID;
    }

    public String getReply() {
	return reply;
    }
    
}
