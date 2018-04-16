package CS201GroupProject;

import java.io.IOException;
import java.util.Vector;

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
		String pageToForward = null;
		User currUser = (User) (request.getSession().getAttribute("currUser"));
		int userID = currUser.getUserID();
		String courseNum = request.getParameter("courseID");
		int courseID = Integer.parseInt(courseNum);
		
		Vector<Integer> usersCourses = JDBCQuery.getCoursesByUserID(currUser.getUserID());
		boolean validAdd = true;
		
		for(int i = 0; i < usersCourses.size(); i++)  {
			if(usersCourses.get(i) == courseID) {
				validAdd = false;
				break;
			}
		}
		
		if(validAdd) {
			JDBCQuery.addCourseToUser(courseID, userID);
			pageToForward = "/UserClassList.jsp";
		}
		
		else {
			request.setAttribute("add_err" + courseID, "This class is already in your course list.");
			pageToForward = "/ClassSearch.jsp";
		}
		
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request,  response);

	}


}
