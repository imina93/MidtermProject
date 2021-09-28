<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Users Details</title>
<!--show.jsp is in a folder so for page= i used ../ to get it out and read bootstrapHead.jsp   -->

</head>
<body>
	<div>
	
		<h3>${user.username}'s Stats:</h3>
		<br>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			Profile Picture</h3>
		<img class="profile-picture" src="${user.imageUrl}"
			style="float: left; margin-right: 15px;" width="200" height="200">

		User Name: ${user.username} <br>
		Password: ${user.password} <br>
		Email: ${user.email} <br>
		First Name: ${user.firstName} <br>
		Last Name: ${reseller.lastName} <br>
		Biography: ${user.biography} <br>
	</div>
	<br>
	<br>
	<br>
	<br>
	<form action="updateUserSlot.do" method="POST">
		<input type="hidden" name="uid" value="${user.id}" /> <input
			type="submit" value="Update Info" />
	</form>
	<br>
	<form action="deleteUser.do" method="POST">
		<input type="hidden" name="uid" value="${user.id}" /> <br> <input
			type="submit" value="Delete Account" />
	</form>
	<!-- create go home button here -->
	<a href="home.do"> <input type="submit" value="Return Home" />
	</a>

</body>
</html>