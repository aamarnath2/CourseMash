<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>CourseMash Sign Up</title>
		</head>
		<link rel="stylesheet" type="text/css" href="style/SignUp.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>
		h1 {
		font-size: 50px;
		}
	</style>
	<body>
		<h1>CourseMash</h1>
		<i class="fa fa-pencil" style="font-size:48px;color:red"></i> 
		<h2>Sign Up</h2>
		<form id="SignUp" method="POST" action="validNewUser">
			<div id="textfields">
				<div>
					<label for="fname">First Name</label> <br>
					<input type="text" name="fname" id="fname" style = "margin-top: 20px;width:300px;" value =${param.fname!=null? param.fname : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${fname_err!=null? fname_err : ''}</span>
				</div>
				<div>
					<label for="lname">Last Name</label> <br>
					<input type="text" name="lname" id="lname" style = "margin-top: 20px;width:300px;" value =${param.lname!=null? param.lname : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${lname_err!=null? lname_err : ''}</span>
				</div>
				<div>
					<label for="email">Email</label> <br>
					<input type="email" id="email" name="email" style = "margin-top: 20px;width:300px;" value =${param.email!=null? param.email : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${email_err!=null? email_err : ''}</span>
				</div>
				<div>
					<label for="pasword">Password</label> <br>
					<input type="password" name="password" id="password" style = "margin-top: 20px;width:300px;" value =${param.password!=null? param.password : ''}>
					<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${pass_err!=null? pass_err : ''}</span>
				</div>
			</div>
			<button type="Submit" style="margin-top: 10px; font-size: 20px;background-color: black;color: white;" id="SignUpButton">Sign Up</button>
		</form>
	</body>
</html>