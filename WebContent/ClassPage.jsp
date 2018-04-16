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
		<%@ page import= "CS201GroupProject.Post" %>
		
		<% 
			User currUser = ((User)request.getSession().getAttribute("currUser"));
			String currClass = request.getParameter("classID"); //whatever gets passed through
			int classid = Integer.parseInt(currClass);
			Vector<Post> posts = JDBCQuery.getPostsByCourseID(classid); //vector of posts
		%>
		
	</head>
	<body>
		
	</body>
</html>
