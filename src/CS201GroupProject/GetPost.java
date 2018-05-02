package CS201GroupProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetPost
 */
@WebServlet("/GetPost")
public class GetPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postNum = request.getParameter("postid");
		int postID = Integer.parseInt(postNum);	
		Post thisPost = JDBCQuery.getPostByPostID(postID);
		Vector<Reply> replies = JDBCQuery.getRepliesByPostID(postID); //replies
		
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    //get post information
	    response.getWriter().write("<h2 id=\"postTitle\">" + thisPost.getTitle() + "</h2>");
	    response.getWriter().write("<h3 id=\"postCreator\">" + (JDBCQuery.getUserByUserID(thisPost.getUserID())).getName() + "</h3>");
	    response.getWriter().write("<p id=\"postBody\">" + thisPost.getBody() + "</p>");
	    if(replies != null) {
	    	//post replies
		    for(int i = 0; i < replies.size(); i++) {
		    	String currReply = replies.get(i).getReply();
		    	response.getWriter().write("<h4 class=\"reply\">" + currReply + "</h4>");
		    }
	    }
	    response.getWriter().write("<form id=\"newReply\" method=\"GET\" action=\"validReply\">"
	    							+ "<input type=\"text\" id=\"postReply\" name=\"reply\" placeholder=\"reply\"><br>"
	    							+ "<input type=\"button\" id=\"replyButton\" onclick=\"replyValidate()\" value=\"Post Reply\">" 
	    							+ "<input type=\"hidden\" name=\"replyPostId\" id=\"replyPostId\" value= " + postID + ">"
	    							+ "</form>");
	   
	}

}