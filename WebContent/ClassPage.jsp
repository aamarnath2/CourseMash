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
			String currClass = request.getParameter("classid"); //whatever gets passed through
			int classid = ((int)Integer.parseInt(currClass));
			//Vector<Post> posts = JDBCQuery.getPostsByCourseID(classid); //vector of posts
			
			//TEST FOR POSTS
			Vector<Post> posts = new Vector<Post>();
			Post testPost = new Post(1,3,"Title", "Body Test");
			Post testPost2 = new Post(2,3,"Second Post", "Body Post");
			posts.add(testPost);
			posts.add(testPost2);
		
		%>
		<script>
			function getPost(postID){
				//DISPLAY POST
				//XHML REQUEST
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "validate.jsp?classid=" + postID, false);
				xhttp.send();
				if (xhttp.responseText.trim().length > 0) {
					document.getElementById("postDetails").innerHTML = xhttp.responseText;
					return false;
				}
			}
			
			function createPost(){
				
			}
		</script>
	</head>
	<body>
		<h1> <a href="UserClassList.jsp"> CourseMash </a> </h1>
		
		
		<div id="scrollable-content">
			<div id="content"></div>
		</div>
		<script>
			var CourseInfo = '';
			var CourseProf = '';

			var table = '<table class="courseTable"><tr>';
			var newLine = '</tr><tr>';


			<% for (int i = 0; i < posts.size(); i++) { %>

				var postTitle = "<%= posts.get(i).getTitle() %>";
				var postID = "<%= posts.get(i).getPostID() %>";
				
				var startButton = '<button onclick="getPost("' + postID + '")">';
				var endButton = '</button>';
				var startInput = '<i';

				table += (startButton + postTitle + endButton + newLine + '<br>');
	<%		} %>
			table += '</table>';
			document.getElementById("content").innerHTML = table; //display table
		</script>
		
		<div id="postDetails"></div>
	</body>
</html>
