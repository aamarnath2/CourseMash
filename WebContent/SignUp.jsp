<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>CourseMash Sign Up</title>
		</head>
	<body>
		<h1>CourseMash</h1>
		<h2>Sign Up</h2>
		<form id="SignUp" method="POST" action="validNewUser">
			<div id="textfields">
				<div>
					<label for="fname">First Name</label>
					<input type="text" name="fname" id="fname" value =${param.fname!=null? param.fname : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${fname_err!=null? fname_err : ''}</span>
				</div>
				<div>
					<label for="lname">Last Name</label>
					<input type="text" name="lname" id="lname" value =${param.lname!=null? param.lname : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${lname_err!=null? lname_err : ''}</span>
				</div>
				<div>
					<label for="email">Email</label>
					<input type="email" id="email" name="email" value =${param.email!=null? param.email : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${email_err!=null? email_err : ''}</span>
				</div>
				<div>
					<label for="pasword">Password</label>
					<input type="password" name="password" id="password" value =${param.password!=null? param.password : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${pass_err!=null? pass_err : ''}</span>
				</div>
			</div>
			<button type="Submit" id="SignUpButton">Sign Up</button>
		</form>
	</body>
</html>
