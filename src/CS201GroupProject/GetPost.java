package CS201GroupProject;

import java.io.IOException;
import java.io.PrintWriter;

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
		System.out.println(postNum);
		int postID = Integer.parseInt(postNum);
		System.out.println(postID);
		Post thisPost = JDBCQuery.getPostByPostID(postID);
		
		
		response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    response.getWriter().write("<h2>" + thisPost.getTitle() + "</h2>");
	    response.getWriter().write("<h3>" + (JDBCQuery.getUserByUserID(thisPost.getUserID())).getName() + "</h3>");
	    response.getWriter().write("<p>" + thisPost.getBody() + "</p>");
	   
	}

}
