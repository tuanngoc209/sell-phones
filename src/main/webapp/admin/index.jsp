<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="..\css\Assignment.css">
</head>
<body class="loggedinpage">
	<div class="welcome" id="disappear">
		<p>
			Welcome
			<%=session.getAttribute("user")%></p>
	</div> 

	<div class="info" style="float: right;">
		<form name="logoutform" action="/PRJ321x_Project_2_ngocntFX17334/LogoutController" method="post">
			<span>Welcome <%=session.getAttribute("user")%></span> 
			<input
				class="greenbutton" type="submit" value="Logout">
		</form>
	</div>
	

	<div class="loggedinleft">
		<h2>1849 team</h2>
		<p>Dashboard</p>
		<p>Staff Manager</p>
	</div>

	<div class="loggedinright">
	
		<img src="..\img\duthuyen.png" width="100%">
		<table>
			<caption>Member of the team</caption>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>StudentID</th>
				<th>Class</th>
			</tr>
			<tr>
				<td>1</td>
				<td>Member 1</td>
				<td>Member Code 1</td>
				<td>Class 1</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Member 2</td>
				<td>Member Code 2</td>
				<td>Class 2</td>
			</tr>
		</table>
	</div>

<script>
window.onload=function(){
	var hide=document.getElementById('disappear');
	document.onclick=function(e){
		if(e.target.id!=='disappear'){
			hide.style.display='none';
		};
	};
};
</script>
</body>
</html>