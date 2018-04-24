package CS201GroupProject;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validReply
 */
@WebServlet("/validReply")
public class validReply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String message = request.getParameter("reply");
		System.out.println(message + "here");
		String postNum = request.getParameter("postid");
		System.out.println(postNum);
		int postID = Integer.parseInt(postNum);
		String courseNum = request.getParameter("courseID");
		System.out.println(courseNum);
		Integer courseID = Integer.parseInt(courseNum);
		User currUser = ((User)request.getSession().getAttribute("currUser"));
		String pageToForward = "/ClassPage.jsp?classid=" + courseID;
		
		boolean validReply = true;
		
		if(message.equals("") || message.equals(null)) {
			validReply = false;
		}
		
		if(validReply) {
			JDBCQuery.addReply(currUser.getUserID(), postID, message);
			response.setContentType("text");
			PrintWriter out = response.getWriter();
			response.getWriter().write("valid");
		}
	}

}
