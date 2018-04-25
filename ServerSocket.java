
import java.io.IOException;
import java.util.Vector;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.apache.catalina.SessionIdGenerator;

@ServerEndpoint(value = "/ps")
public class ServerSocket {

	private static Vector<Session> sessionVector = new Vector<Session>();
	
	@OnOpen
	public void onOpen(Session session) {
		System.out.println("Connection made! in Server! Default package!");
		sessionVector.add(session);
		System.out.println("sessionVector's size is " + sessionVector.size());
	}
	
	@OnMessage
	public void OnMessage(String message, Session session) {
		System.out.println("got to OnMessage in Server.java");
		System.out.println(message);
//		//parse message
//		String[] splited = message.split("\\s+");
//		for (String s : splited) {
//			System.out.println(s);
//		}
//		int postID = Integer.parseInt(splited[0]);
//		int UserID = Integer.parseInt(splited[1]);
//		String command = splited[2];
//		//parse over
//		//take 
//		Vector<Integer> followers = JDBCQuery.getPostFollowers(postID);
//		try {
//			for(Session s : sessionVector) { 
////				SessionUserID = /*get that session's current userID*/;
//				//check if this person is a follower of postID. If so,
////				SessionUserID
//				if(followers.contains("aafekhwg")) {
//					s.getBasicRemote().sendText(message);
//				}
//			}
//		} catch (IOException ioe) {
//			System.out.println("ioe: " + ioe.getMessage());
//			close(session);
//		}
	}
	
	@OnClose
	public void close(Session session) {
		System.out.println("Disconnecting!");
		sessionVector.remove(session);
	}
	
	@OnError
	public void error(Throwable error) {
		System.out.println("Error!");
	}
}