package CS201GroupProject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddClass
 */
@WebServlet("/AddClass")
public class AddClass extends HttpServlet {
	

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		User currUser = (User) (request.getSession().getAttribute("currUser"));
		int userID = currUser.getUserID();
		String courseNum = request.getParameter("courseID");
		int courseID = Integer.parseInt(courseNum);
		
		JDBCQuery.addCourseToUser(courseID, userID);
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher("/UserClassList.jsp");
		dispatch.forward(request,  response);

	}


}
