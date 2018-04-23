
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/guestClassList.css">
<title>List of Classes</title>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="CS201GroupProject.JDBCQuery"%>
<%@ page import="CS201GroupProject.Course"%>
<%
	//vector of all the courses the user is in
	Vector<Course> allCourses = new Vector<Course>();
	allCourses = JDBCQuery.getallCourses();
	
	/*
		VARIABLES FOR CSS:
			id=courses [all course buttons]
			id="title" [courseMash title]
			id=scrollable-content [scrollable course list]\
			id=content [contains all buttons]	
	*/
%>
</head>

<body>
	<div>
		<h1>
			<!-- Title of course that is an href back to the main page -->
			<a id="title" href="home.jsp">CourseMash</a>
		</h1>
	</div>
	<div></div>

	<div id="dialog-window">
		<!-- All classes HTML display -->
		<div id="scrollable-content">
			<div id="content"></div>
		</div>
		<!-- Script to get all course information -->
		<script>
			//get necessary information for all courses
			var CourseInfo = '';
			var CourseProf = '';
			var code = '';
			
			//iterate through to display course info
			<%for (int i = 0; i < allCourses.size(); i++) {%>

				var courseName = "<%=allCourses.get(i).getFullName()%>";
				var courseID = "<%=allCourses.get(i).getCourseID()%>";
				var professors = "<%=allCourses.get(i).getProfessor()%>";
				
			var startForm = '<a id="courses" href="ClassPage.jsp?classid=' + courseID + '">';
			var endForm = '</a>';
			CourseInfo = courseName + '<br>' + professors + '<br>';
			code += (startForm + CourseInfo + endForm + '<br>');
		<%}%>
			document.getElementById("content").innerHTML = code; //display table
		</script>
</body>
</html>
