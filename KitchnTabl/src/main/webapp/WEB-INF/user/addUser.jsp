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
<div id="headerDiv">
<ul>
  <li><a target="_self" class="active" href="home.do"><img
		src="https://cdn-icons-png.flaticon.com/512/184/184514.png"
		class="home-small"
		alt="Home"></a></li>
  <c:if test ="${ empty loggedInUser}">
    <li><a href="loginViewProfile.do">Profile</a></li>
  </c:if>
  <c:if test ="${ not empty loggedInUser}">
    <li><a href="getUserPage.do">Profile</a></li>
  </c:if>
  <li><a href="searchcategories.do">Categories</a></li>
  <li><a href="searchrecipe.do">Recipes</a></li>
  <li><a href="searchcookbooks.do">Cookbooks</a></li>
  <!-- if user is logged in href= logout if no user href=login -->
  <c:if test ="${ empty loggedInUser}">
  <li style="float:right"><a href="loginHead.do">Login</a></li>
  <li style= "float:right"><a href="createUserSlotHead.do">Sign Up</a></li>
  </c:if>
  <c:if test ="${ not empty loggedInUser}">
    <li style="float:right"><a href="logout.do">Logout</a></li>
  </c:if>
</ul>
</div>
<br>
<br>
<br>
<div>
<form action="createUser.do" method="POST">
<h2>Join Now!</h2>
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
	</div>
</body>
</html>