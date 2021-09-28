<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Update Users Info</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>

<!-- 	<!-- 	User Name: <input type="text" name="username" /> <br>
		<br> Password: <input type="text" name="password" />
		User Profile Picture: (Right Click, Open Image In New Tab, Copy
		And Then Paste The address) <input type="text" name="imageUrl" />
		<br> Email: <input type="text" name="email" /> <br>
		First Name: <input type="text" name="firstName" /> <br>
		Last Name: <input type="text" name="lastName" /> <br> 
		Biography: <input type="text" name="biography" /> <br> <input
			type="submit" value="Join Now" /> --> -->
	<h2>Current Details:</h2>
	<div>
		<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Profile Picture</h3>
		<p>
			<img class="profile-picture" src="${user.imageUrl}"
				style="float: left; margin-right: 15px;" width="200" height="200"></img>
		</p>
		
		<p>User Name: ${user.username}</p>
		<p>Password: ${user.password}</p>
		<p>Email: ${user.email}</p>
		<p>First Name: ${user.firstName}</p>
		<p>Last Name: ${user.lastName}</p>
		<p>Biography: ${user.biography}</p>

		<form action="updateUser.do" method="POST">
			<input type="hidden" name="uid" value="${user.id}" />
			User Name: <input type="text" value="${user.username}" name="username" /> <br>
			 Password: <input type="text" value="${user.password}" name="password" /> <br>
			Profile Picture: (open an image in a new tab then pasted the link here): 
			<input type="text" value="${user.imageUrl}" name="imageUrl" /> <br>
			Email: <input type="text" value="${user.email}" name="email" /> <br> 
			First Name: <input type="text" value="${user.firstName}" name="firstName" /> <br>
			Last Name: <input type="text" value="${user.lastName}" name="lastName" /> <br>
			Biography: <input type="text" value="${reseller.profitsMade}" name="profitsMade" /> <br>
			<input type="submit" value="Update Profile" /> <a
				href="home.do"> <input type="submit" value="Return Home" />
			</a>
		</form>
	</div>
</body>
</html>