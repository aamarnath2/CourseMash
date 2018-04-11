<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="UserClassList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<title>CourseMash</title>
		<%@ page import="java.util.*" %>
		<%@ page import="java.io.*" %>
		<%! Vector<Integer> courseIDlist = getUserEnrollment2(userID); %>
		<%!  %>
		<%
			//private static Vector<Integer> getUserEnrollments2(int userID) {
			//this returns a vector of classIDs that are associated with the userID
			//iterate through the vector and get the class objects associated with each course
			//String name, string course prefix, professor, etc.
		%>
	</head>
	<body>
		<!-- Title -->
		<h1>CourseMash</h1>
	
		<!-- Logout buttona -->
		<form action="home.jsp">
			<input type="submit" id="logoutButton" value="Logout"/>
		</form>
		<!-- Content is for the list of classes -->
		<!-- Have a form created with a list of submit buttons that redirects to a servlet to the CoursePage.jsp -->
		<div id="content"></div>
		
		<!-- Form to add classes that has a button. This button will be the same size/look like a class -->
		<form action="ClassSearch.jsp">
    		<input type="submit" id="addClassButton" value="+Add Class" />
		</form>
	</body>
</html>
