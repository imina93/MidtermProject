<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RH: Add A New Reseller</title>
</head>
<body>

	<form action="createUser.do" method="POST">
		User Name: <input type="text" name="username" /> <br>
		<br> Password: <input type="text" name="password" />
		User Profile Picture: (Right Click, Open Image In New Tab, Copy
		And Then Paste The address) <input type="text" name="imageUrl" />
		<br> Email: <input type="text" name="email" /> <br>
		First Name: <input type="text" name="firstName" /> <br>
		Last Name: <input type="text" name="lastName" /> <br> 
		Biography: <input type="text" name="biography" /> <br> <input
			type="submit" value="Join Now" />
	</form>
	<a href="home.do"> <input type="submit" value="Return Home" /></a>
</body>
</html>