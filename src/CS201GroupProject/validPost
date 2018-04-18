package CS201GroupProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validPost
 */
@WebServlet("/validPost")
public class validPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		String courseNum = request.getParameter("courseID");
		Integer courseID = Integer.parseInt(courseNum);
		User currUser = ((User)request.getSession().getAttribute("currUser"));
		
		String pageToForward = "/ClassPage.jsp?classid=" + courseID;
		
		boolean validPost = true;
		
		
		if(title.equals("") || title.equals(null)) {
			validPost = false;
		}
		
		if(body.equals("") || body.equals(null)) {
			validPost = false;
		}
		  
		if(validPost) {
			JDBCQuery.addPost(courseID, currUser.getUserID(), title, body);
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request,response);
	}
}
