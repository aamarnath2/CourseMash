<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style/home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CourseMash</title>

<% session.setAttribute("currUser",  null); %>

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
        <i class="fa fa-pencil" style="font-size:48px;color:red"></i>
	<form id="homeForm" name="homeForm" method="POST" action="LoginValidation" > 
		<div id="textfields" style="font-size: 20px;">
			<div>
				<label for="emailAddress"">Email</label> <br>
				<input type="email" name="emailAddress" id="emailAddress"  style = "width:300px;" value =${param.emailAddress!=null? param.emailAddress : ''}>
				<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${email_err!=null? email_err : ''}</span>
			</div>
			
			<div id = "password" style = "margin-top: 20px;">
				<label for="pword">Password</label> <br>
				<input type="password" name="pword" id="pword" style = "width:300px;" value =${param.pword!=null? param.pword : ''}>
				<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${pass_err!=null? pass_err : ''}</span><br>
			</div>
		</div>
		<div id="optionButtons">
			<div style="margin-top: 10px;"><button type="submit" style="background-color: black;color: white;">LOGIN</button> </div>
			<div style="margin-top: 10px;"><button type="button" style="background-color: black;color: white;" onclick="signup()">SIGN UP</button></div>
			<div style="margin-top: 10px;"><button type="button" style="background-color: black;color: white;" onclick="guest()">GUEST</button></div>
		</div>
	</form>
</body>
</html>