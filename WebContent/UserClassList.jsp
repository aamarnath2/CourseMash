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
		<%
			//get the current user and a vector of the class ids that the user is enrolled in
			User currentUser = ((User)request.getSession().getAttribute("currUser"));
			Vector<Integer> userCourses = JDBCQuery.getCoursesByUserID(currentUser.getUserID());
			
			/*
				VARIABLES FOR CSS:
					id=courses [all course buttons]
					id="title" [courseMash title]
					id=scrollable-content [scrollable course list]\
					id=content [contains all buttons]	
					id=addClassButton [add class button]
			*/
		%>	
	</head>
	<body>
		<!-- Title -->
		<h1 id="title">CourseMash</h1>
	
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
			
						//iterate through to display all currently enrolled classes													
						<% for (int i = 0; i < userCourses.size(); i++) { %>
							
							var courseName = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getFullName() %>";
							var courseID = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getCourseID() %>";
							var professors = "<%= JDBCQuery.getCourseByCourseID(userCourses.get(i)).getProfessor() %>";
							var start = '<a id="courses" href="ClassPage.jsp?classid=' + courseID +  '">';
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
