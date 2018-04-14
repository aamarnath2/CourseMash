
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="CS201GroupProject.JDBCQuery, CS201GroupProject.Course, java.util.Vector" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/guestClassList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>List of Classes</title>


<%
	Vector<Course> temp = JDBCQuery.getallCourses();
	Vector<String> tempList = new Vector<String>();
	for(int i = 0; i < temp.size(); i++) {
		tempList.add(temp.get(i).getFullName());
	}
%>



<script>
	function addClasses() {
		var size = <%= tempList.size() %>;
		var list = document.getElementById('classList');
		
	<%	for(int i = 0; i < tempList.size(); i++) { %>
			var elem = document.createElement("li");
			elem.innerText = "<%=tempList.get(i) %>";
			list.appendChild(elem);
	<%	} %>
	}
</script>

</head>

<body onload="addClasses()">
	<div>
		<h1>CourseMash</h1>
		<i class="fa fa-pencil" style="font-size:48px;color:red"></i>
	</div>
	<div>
	</div>
	
	<div id="dialog-window">

		  <div id="scrollable-content">
		    <ul id="classList">
		    </ul>
		  </div>

  <div id="footer">
  </div>

	</div>
</body>
</html>
