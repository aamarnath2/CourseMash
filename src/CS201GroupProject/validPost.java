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
 * Servlet implementation class validPost
 */
@WebServlet("/validPost")
public class validPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//title and body
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		//course info
		String courseNum = request.getParameter("courseID");
		Integer courseID = Integer.parseInt(courseNum);
		User currUser = ((User)request.getSession().getAttribute("currUser"));
		String pageToForward = "/ClassPage.jsp?classid=" + courseID;
		
		boolean validPost = true;
		
		//if there is no title
		if(title.equals("") || title.equals(null)) {
			request.setAttribute("title_err", "Please enter a title");
			validPost = false;
		}
		//if there is not body
		if(body.equals("") || body.equals(null)) {
			request.setAttribute("body_err", "Please enter a body");
			validPost = false;
		}
		 //if there is a title and body for the post 
		if(validPost) {
			JDBCQuery.addPost(courseID, currUser.getUserID(), title, body);
			response.setContentType("text");
			PrintWriter out = response.getWriter();
			response.getWriter().write("valid");
		}
		//redisplay info provided
		else {
			response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    response.getWriter().write("<form id='newPostForm' method='GET' action='validPost'>");
		    response.getWriter().write("<input type=\"text\" name=\"title\" id=\"title\" placeholder=\"title\" value =\"" + title + "\"><br>");
		    response.getWriter().write("<textarea name=\"body\" id=\"body\" placeholder = \"body\" value=\"" + body + "\"></textarea><br>");
		    response.getWriter().write("<input type=\"button\" id=\"button\" onclick=\"postValidate()\" value=\"Submit\" >");
		    response.getWriter().write("<input type=\"hidden\" name=\"courseID\" value=\"" + courseNum + "\">");
		    response.getWriter().write("</form>");
		    response.getWriter().write("<h1 id=\"testmessage\"> ERROR: Please enter a title AND body </h1>");
		}
	}
}