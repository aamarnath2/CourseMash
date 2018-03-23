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
		
		String username = request.getParameter("username"); //get parameters from form
		String password = request.getParameter("password");
		
		try {
			String pageToForward;
			Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
		    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/DATABASENAME?user=root&password=root");    //need to edit based on database
		    PreparedStatement ps = conn.prepareStatement("Select user,pass from TABLENAME where username=? and password=?"); //need to edit based on database
		    ps.setString(1, username);
		    ps.setString(2, password);
		   
		    ResultSet rs = ps.executeQuery(); //check if such a user exists
		    if(rs.next()) { //if successful login
		    		pageToForward = "/userProfile.jsp"; 
		    }
		    	else { //failed login
		    		pageToForward = "/home.jsp";
				request.setAttribute("loginError", "Invalid login credentials - please try again or sign up for an account if you don't have one");
		    	}
		    
		    RequestDispatcher dispatch = getServletContext().getRequestDispatcher(pageToForward);
			dispatch.forward(request,  response);
			
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
