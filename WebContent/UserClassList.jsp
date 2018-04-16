<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>CourseMash</title>
		<%@ page import="java.util.*" %>
		<%@ page import="java.io.*" %>
		<%@ page import="CS201GroupProject.JDBCQuery"%>
		<%@ page import="CS201GroupProject.Course"%>
		<%@ page import="CS201GroupProject.User"%>
		<%@ page import= "javax.servlet.http.HttpSession" %>
		<%!  %>
		<%
			//private static Vector<Integer> getUserEnrollments2(int userID) {
			//this returns a vector of classIDs that are associated with the userID
			//iterate through the vector and get the class objects associated with each course
			//String name, string course prefix, professor, etc.
			//HttpSession session = request.getSession();
			//Users data = (Users)session.getAttribute("newData");
			
			User currentUser = ((User)request.getSession().getAttribute("currUser"));
			Vector<Integer> userCourses = JDBCQuery.getCoursesByUserID(currentUser.getUserID());
		%>
		
	
	</head>
	<body>
		<!-- Title -->
		<h1>CourseMash</h1>
	
		<!-- Logout button -->
		<form action="home.jsp" method="POST">
			<input type="submit" id="logoutButton" value="Logout"/>
		</form>
		<!-- Content is for the list of classes -->
		<!-- Have a form created with a list of submit buttons that redirects to a servlet to the CoursePage.jsp -->
		<div id="dialog-window">
			<div id="scrollable-content">
				<div id="content"></div>
					<script>
						var CourseInfo = '';
						var CourseProf = '';
			
						var table = '<table class="courseTable"><tr>';
						var newLine = '</tr><tr>';
			
			
						<% for (int i = 0; i < userCourses.size(); i++) { %>
							
							var courseName = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getFullName() %>";
							var courseID = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getCourseID() %>";
							var professors = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getProfessor() %>";
							var start = '<a href="ClassPage.jsp?classID=' + courseID +  '">';
							var end = '</a>';
							CourseInfo = courseName + '<br>' + professors + '<br>';
							table += (start + CourseInfo + end + newLine + '<br>');
						<%		} %>
						table += '</table>';
						document.getElementById("content").innerHTML = table; //display table
					</script>
			</div>
		</div>
		
		<!-- Form to add classes that has a button. This button will be the same size/look like a class -->
		<form action="ClassSearch.jsp">
    		<input type="submit" id="addClassButton" value="+Add Class" />
		</form>
	</body>
</html>
