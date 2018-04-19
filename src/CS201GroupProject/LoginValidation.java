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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//get email address and password
		String email = request.getParameter("emailAddress"); // get parameters from form
		String pword = request.getParameter("pword");
		//default values
		boolean validLogin = true;
		String pageToForward = null;
		
		//if the user did not enter an email to login, return error
		if (email == null || email.length() == 0) {
			request.setAttribute("emailAddresss", email);
			request.setAttribute("email_err", "Please enter an email");
			pageToForward = "/home.jsp";
			validLogin = false;
		}
		//if the user did not enter a password to login, return error
		if (pword == null || pword.length() == 0) {
			request.setAttribute("pass_err", "Please enter a password");
			pageToForward = "/home.jsp";
			validLogin = false;
		}
		//will only execute if the user filled the text fields
		if (validLogin) {
			//check if the email exists. Else, return error
			if (JDBCQuery.doesUserExist(email)) {
				
				//now, validate if the email password combo is valid in the database. Else return error
				if (JDBCQuery.validate(email, pword)) {
					request.getSession().setAttribute("currUser", JDBCQuery.getUserByEmail(email));
					request.getSession().setAttribute("signedIn", true);
					pageToForward = "/UserClassList.jsp";
				} 
				else {
					request.setAttribute("pass_err", "Incorrect password");
					pageToForward = "/home.jsp";
				}	
				
			} 
			//user email doesn't exist
			else {
				request.setAttribute("email_err", "No user with this email exits");
				pageToForward = "/home.jsp";
			}
		}
		//else, just go back to home.jsp
		else {
			pageToForward = "/home.jsp";
		}
		
		//send servlet dispatch
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
		dispatch.forward(request, response);
	}

}
