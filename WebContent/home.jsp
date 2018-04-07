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
	

	//Got API working
	/*try {
        var xhttp = new XMLHttpRequest();
        const proxyurl = "https://cors-anywhere.herokuapp.com/";
        xhttp.open("GET", proxyurl + "http://web-app.usc.edu/web/soc/api/depts/20181", false);
        xhttp.send();
        var response = JSON.parse(xhttp.response);
        alert(xhttp.response);
        console.log(response);
    }
    catch (error) {
        alert(error.message);
    } */
</script>
</head>
<body>
	<h1>CourseMash</h1>
	<form id="homeForm" name="homeForm" method="POST" action="LoginValidation" > 
		<div id="textfields">
			<div>
				<label for="emailAddress">Email</label>
				<input type="email" name="emailAddress" id="emailAddress"  value =${param.email!=null? param.email : ''}>
				<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${email_err!=null? email_err : ''}</span>
			</div>
			
			<div>
				<label for="pasword">Password</label>
				<input type="password" name="password" id="password" value =${param.password!=null? param.password : ''}>
				<span style="color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;">${pass_err!=null? pass_err : ''}</span><br>
			</div>
		</div>
		<div id="optionButtons">
			<div><button type="submit">LOGIN</button> </div>
			<div><button type="button" onclick="signup()">SIGN UP</button></div>
			<div><button type="button" onclick="guest()">GUEST</button></div>
		</div>
	</form>
</body>
</html>