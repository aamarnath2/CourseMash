
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="CS201GroupProject.JDBCQuery, CS201GroupProject.Course, java.util.Vector" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="style/guestClassList.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Class Search Page</title>


<%
	Vector<Course> temp = JDBCQuery.getallCourses();
%>



<script>
	function addClasses() {
		var size = <%= temp.size() %>;
		var list = document.getElementById('classList');
		
	<%	for(int i = 0; i < temp.size(); i++) { %>
			var listElem = document.createElement("li");
			var div = document.createElement("div");
			div.setAttribute("class", "classItem");
			listElem.appendChild(div);
			var className = document.createElement("h3");
			className.innerText = "<%= temp.get(i).getFullName() %>";
			div.appendChild(className);
			var professor = document.createElement("h3");
			professor.innerText = "<%= temp.get(i).getProfessor() %>";
			div.appendChild(professor);
			list.appendChild(listElem);
			var form = document.createElement("form");
			form.name = "addForm";
			form.method = "POST";
			form.action = "AddClass";
			div.appendChild(form);
			var button = document.createElement("button");
			button.type = "submit";
			button.innerText= "Add";
			form.appendChild(button);
			
			var span = document.createElement("span");
			form.appendChild(span);
			span.style = "color: red;font-weight:bold; position:fixed; margin-top: 2px; margin-left: 2px;";
			
			span.innerHTML = "${add_err!=null? add_err : ''}";
			var hidden = document.createElement("input");
			hidden.type = "hidden";
			hidden.name = "courseID";
			hidden.value = "<%= temp.get(i).getCourseID() %>";
			form.appendChild(hidden);
			
			
			

			
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
