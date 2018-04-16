
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
	Vector<Course> allCourses = new Vector<Course>();
	allCourses = JDBCQuery.getallCourses();
%>

</head>

<body onload="return addClasses();">
	<div>
		<h1>CourseMash</h1>
	</div>
	<div></div>

	<div id="dialog-window">

		<div id="scrollable-content">
			<div id="content"></div>
		</div>
		<script>
			var CourseInfo = '';
			var CourseProf = '';

			var table = '<table class="courseTable"><tr>';
			var newLine = '</tr><tr>';

			<% for (int i = 0; i < allCourses.size(); i++) { %>

				var courseName = "<%= allCourses.get(i).getFullName() %>";
				var courseID = "<%= allCourses.get(i).getCourseID() %>";
				var professors = " <%= allCourses.get(i).getProfessor() %> ";
				var startForm = '<a href="ClassPage.jsp?classID=' + courseID +  '">';
				var endForm = '</a>';
				CourseInfo = courseName + '<br>' + professors + '<br>';
				table += (startForm + CourseInfo + endForm + newLine + '<br>');
	<%		} %>
			table += '</table>';
			document.getElementById("content").innerHTML = table; //display table
		</script>
</body>
</html>
