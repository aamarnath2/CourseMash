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
			Vector<Course> courseList = JDBCQuery.getallCourses();
		
		%>
		
	
	</head>
	<body>
		<!-- Title -->
		<h1>CourseMash</h1>

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
			
			
						<% for (int i = 0; i < courseList.size(); i++) { %>
							
							var courseName = "<%= courseList.get(i).getFullName() %>";
							var courseID = "<%= courseList.get(i).getCourseID() %>";
							var professors = "<%= courseList.get(i).getProfessor() %>";
							var button = '<a href="AddClass?courseID=' + courseID + '" style="display:block;">Add Class </a>';
							CourseInfo = courseName + '<br>' + professors + '<br>';
							table += (CourseInfo + button + newLine + '<br><br>');
						<%		} %>
						table += '</table>';
						document.getElementById("content").innerHTML = table; //display table
					</script>
			</div>
		</div>
		
		<!-- Form to add classes that has a button. This button will be the same size/look like a class -->
	</body>
</html>

