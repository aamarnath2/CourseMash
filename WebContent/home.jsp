<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/home.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CourseMash</title>
<script>
	function signup() {
		var form = document.getElementById("homeForm");
		form.setAttribute("type", "submit");
		form.setAttribute("action", "SignUp.jsp");
		form.submit();
	}
	
	function guest() {
		var form = document.getElementById("homeForm");
		form.setAttribute("type", "submit");
		form.setAttribute("action", "guestClassList.jsp");
		form.submit();
	}
</script>
</head>
<body>
	<h1>CourseMash</h1>
	<form id="homeForm" name="homeForm" method="POST" action="LoginValidation" > 
		<div>
			Username
			<input type="text" name ="username" id="username"></input>
		</div>
		<div>
			Password
			<input type="text" name="password" password="username"></input>
		</div>
		<div id="optionButtons">
			<div><button type="submit">LOGIN</button></div>
			<div><button type="button" onclick="signup()">SIGN UP</button></div>
			<div><button type="button" onclick="guest()">GUEST</button></div>
		</div>
	</form>
</body>
</html>