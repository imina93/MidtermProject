<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Join Now!</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>
<a target="_blank" href="home.do"> <img
		src="https://cdn-icons-png.flaticon.com/512/184/184514.png"
		class="profile-small"
		alt="Home">
	</a>

<form action="createUser.do" method="POST">
		<table>

			<tr>
				<td>User Name:</td>
				<td><input type="text" name="username" /></td>
			</tr>

			<tr>
				<td>Password:</td>
				<td><input type="text" name="password" /></td>
			</tr>

			<tr>
				<td>Profile Picture:</td>
				<td><input type="text" name="imageUrl" /></td>
				<td>(Right Click, Open Image In New Tab, Copy And Then Paste
					The address)</td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" /></td>
			</tr>

			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName" /></td>
			</tr>
			
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" /></td>
			</tr>

			<tr>
				<td>Biography:</td>
				<td><input type="text" name="biography" /></td>
			</tr>

		</table>
			 <input type="submit" value="Submit" />
	</form>
	<a href="home.do"> <input type="submit" value="Return Home" /></a>
</body>
</html>