<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Update Users Info</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../navbar.jsp"></jsp:include>
	<h2>Current Details:</h2>
	<div>
		<h3>&nbsp;Profile Picture</h3>
		<p>
			<img class="profile-picture" src="${user.imageUrl}"
				style="float: left; margin-right: 15px;" width="200" height="200"></img>
		</p>
		
		<p>User Name:  ${user.username}</p>
		<p>Password:   **********</p>
		<p>Email:      ${user.email}</p>
		<p>First Name: ${user.firstName}</p>
		<p>Last Name:  ${user.lastName}</p>
		<p>Biography:  ${user.biography}</p>

		<form action="updateUser.do" method="POST">
		
		<br>
		<br>
		<br>
		<table>
			<tr>
				<td><input type="hidden" name="uid" value="${user.id}" />
			User Name:
				</td>
				<td><input type="text" value="${loggedInUser.username}" name="username" /> <br>
				</td>
			</tr>
			<tr>
				<td>Password: 
				</td>
				<td><input type="password" placeholder="*********" value="${loggedInUser.password}" name="password" />
			</td>
			</tr>
			<tr>
				<td>Profile Picture (URL): 
				</td>
				<td><input type="text" value="${loggedInUser.imageUrl}" name="imageUrl" />
				</td>
			</tr>
			<tr>
				<td>Email:
				</td>
				<td><input type="text" value="${loggedInUser.email}" name="email" />
				</td>
			</tr>
			<tr>
				<td>First Name:
				</td>
				<td><input type="text" value="${loggedInUser.firstName}" name="firstName" />
				</td>
			</tr>
			<tr>
				<td>Last Name:
				</td>
				<td><input type="text" value="${loggedInUser.lastName}" name="lastName" /> 
				</td>
			</tr>
			<tr>
				<td>Biography:
				</td>
				<td><input type="text" value="${loggedInUser.biography}" name="biography" /> <br>
				</td>
			 
			</tr>
		</table>
		
		
		
<%-- 			<input type="hidden" name="uid" value="${user.id}" />
			User Name: <input type="text" value="${loggedInUser.username}" name="username" /> <br>
			<!-- <input type="password"
	placeholder="Password"
	id="password"
	name="password"> -->
			Password: <input type="password" placeholder="*********" value="${loggedInUser.password}" name="password" /> <br> --%>
			
<%-- 			
			Profile Picture: (open an image in a new tab then pasted the link here): 
			<input type="text" value="${loggedInUser.imageUrl}" name="imageUrl" /> <br> --%>
		<%-- 	Email: <input type="text" value="${loggedInUser.email}" name="email" /> <br> 
			First Name: <input type="text" value="${loggedInUser.firstName}" name="firstName" /> <br>
			Last Name: <input type="text" value="${loggedInUser.lastName}" name="lastName" /> <br>
			Biography: <input type="text" value="${loggedInUser.biography}" name="biography" /> <br> --%>
			<input type="submit" value="Update Profile" /> <a
				href="home.do"> <input type="submit" value="Return Home" />
			</a>
		</form>
	</div>
	<jsp:include page="../bootstrapfoot.jsp"></jsp:include>
</body>
</html>