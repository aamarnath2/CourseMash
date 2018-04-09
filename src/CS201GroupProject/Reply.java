import java.sql.Time;
import java.util.Vector;

public class Reply {
    private User replier;
    private String content;
    private long time;

    public Reply( User u, String c ) {
	replier = u;
	content = c;
	//add time
    }

    
}
