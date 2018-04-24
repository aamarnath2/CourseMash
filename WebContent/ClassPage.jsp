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
			Integer classid = (Integer.parseInt(currClass));
			Vector<Post> posts = JDBCQuery.getPostsByCourseID(classid); //vector of posts
			
			/* 
			VARIABLES FOR CSS:
				id=title [courseMash title]
				id=postInfo [button for each course]
				id="scrollable-content" [window of courses]
				id=content [all course buttons]
				id=postDetails [content of post]
				id=postTitle [post title]
				id=postCreator [creator of post]
				id=postBody [post body]
				id=createPost [button to make a post for users]
				
				!!This is for when someone wants to create a post!!
				id=title [title box for making post]
				id=body [body comment box for making a post]
				id=button [button to validate creating a post]
				id=errorMessage [message to display an error]
		*/
		
		%>
		<script>
			//Function to validate if the user put in both a title and body for a post
			function postValidate() {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				       // Typical action to be performed when the document is ready:
				    	   if(xhttp.responseText === "valid") {
				    		   location.reload();
				    	   }
				    	   else {
				    		   document.getElementById("postDetails").innerHTML = xhttp.responseText;
				    	   }
				    }
				};
				var title = document.getElementById("title").value;
				var body = document.getElementById("body").value;
				xhttp.open('GET', 'validPost?title=' + title + '&body=' + body + '&courseID=' + <%= currClass %>, true);
				xhttp.send();
			}
		</script>
		<script>
			function replyValidate() {
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				       // Typical action to be performed when the document is ready:
				    	   if(xhttp.responseText === "valid") {
				    		   location.reload();
				    	   }
				    	   else {
				    		   document.getElementById("postDetails").innerHTML = xhttp.responseText;
				    	   }
				    }
				};
				var reply = document.getElementById("postReply").value;
				console.log(reply);
				var postID = document.getElementById("replyPostId").value;
				xhttp.open('GET', 'validReply?reply=' + reply + '&postid=' + postID + '&courseID=' + <%= currClass %>, true);
				xhttp.send();
			}
		</script>
		<script>
			//Function for creating a post. This displays all the text boxes and such
			function createPost(){
				if(<%= currUser == null %>) {
					return;
				}
				
				var courseID = <%= classid %>;
				var newLine = '<br>';
				var code = '';
				var startForm = '<form name="newPostForm" id="newPostForm" method="GET" action="validPost">';
				//title, body
				var endForm = '</form>';
				//title code
				var title = '<input type="text" name="title" id="title" placeholder="title">';
				//var titleError = '<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${title_err!=null? title_err : ''}</span>';
				//body
				//var body = '<input type="text" name="body" id="body" placeholder = "body">';
				var body = '<textarea name="comment" id ="body" placeholder="body" form="newPostForm"></textarea>';
				//var bodyError = '<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${body_err!=null? body_err : ''}</span>';
				//submit
				var submit = '<input type="button" id="button" onclick="postValidate()" value="Submit">';
				
				var classid = '<input type="hidden" name="courseID" value="' + courseID + '">';
				
				code += startForm;
				code += (title + newLine);
				code += (body + newLine);
				code += submit;
				code += classid;
				code += endForm;
				
				document.getElementById("postDetails").innerHTML = code;
				//need to send classid as a hidden
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
			<% for (int i = posts.size()-1; i >= 0; i--) { %>
				var postTitle = "<%= posts.get(i).getTitle() %>";
				var postID = "<%= posts.get(i).getPostID() %>";
				
				var startButton = '<button onclick="getPost(' + postID + ')">';
				var endButton = '</button>';
				var startInput = '<i';
				table += (startButton + postTitle + endButton + newLine + '<br>');
	<%		} %>
			table += '</table>';
			
			if(<%= currUser != null %>) {
				table += '<button id="createPost" onclick="createPost()">Create New Post</button>';
			}
			document.getElementById("content").innerHTML = table; //display table
		</script>
		
		<div id="postDetails"></div>
		<script>
			function getPost(postID) {
				if(<%= currUser == null %>) {
					return;
				}
				var xhttp = new XMLHttpRequest();
				xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				       // Typical action to be performed when the document is ready:
				       document.getElementById("postDetails").innerHTML = xhttp.responseText;
				    }
				};
				xhttp.open('GET', 'GetPost?postid=' + postID, true);
				xhttp.send();
			}
		</script>
	</body>
</html>
