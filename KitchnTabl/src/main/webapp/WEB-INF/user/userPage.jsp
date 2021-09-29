<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Users Details</title>
<!--show.jsp is in a folder so for page= i used ../ to get it out and read bootstrapHead.jsp   -->
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>
	<div>
	
		<h3>${loggedInUser.username}'s Stats:</h3>
		<br>
		<h3>&nbsp;&nbsp;&nbsp;
			Profile Picture</h3>
		<img class="profile-picture" src="${loggedInUser.imageUrl}"
			style="float: left; margin-right: 15px;" width="200" height="200">

		User Name: ${loggedInUser.username} <br>
		Password: ${loggedInUser.password} <br>
		Email: ${loggedInUser.email} <br>
		First Name: ${loggedInUser.firstName} <br>
		Last Name: ${loggedInUser.lastName} <br>
		Biography: ${loggedInUser.biography} <br>
	</div>
	<br>
	<br>
	<br>
	<br>
	<form action="updateUserSlot.do" method="POST">
		<input type="hidden" name="uid" value="${loggedInUser.id}" /> <input
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