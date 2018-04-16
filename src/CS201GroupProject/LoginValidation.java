package CS201GroupProject;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 * Servlet implementation class LoginValidation
 */
@WebServlet("/LoginValidation")
public class LoginValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("emailAddress"); //get parameters from form
		String pword = request.getParameter("pword");
		
		boolean validLogin = true;
		String pageToForward = null;
		
		if(email == null || email.length() == 0) {
			request.setAttribute("emailAddresss", email);
			request.setAttribute("email_err", "Please enter an email");
			pageToForward = "/home.jsp";
			validLogin = false;
		}
		
		if(pword == null || pword.length() == 0) {
			request.setAttribute("pass_err", "Please enter a password");
			pageToForward = "/home.jsp";
			validLogin = false;
		}
		
		if(validLogin) {
			if(JDBCQuery.doesUserExist(email)) {
				if(JDBCQuery.validate(email, pword)) {
					request.getSession().setAttribute("currUser", JDBCQuery.getUserByEmail(email)); //change function name accordingly
					request.getSession().setAttribute("signedIn", true);
					pageToForward = "/UserClassList.jsp";
				}
				else {
					request.setAttribute("pass_err", "Incorrect password");
					pageToForward = "/home.jsp";
				}
			}
			else {
				request.setAttribute("email_err", "No user with this email exits");
				pageToForward = "/home.jsp";
			}
		}
		else { 
			pageToForward = "/home.jsp";
		}
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request,  response);
	}

}
