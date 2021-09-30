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
<div id="headerDiv">
<ul>
  <li><a target="_blank" class="active" href="home.do"><img
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
			<input type="hidden" name="uid" value="${user.id}" />
			User Name: <input type="text" value="${loggedInUser.username}" name="username" /> <br>
			<!-- <input type="password"
	placeholder="Password"
	id="password"
	name="password"> -->
			Password: <input type="password" placeholder="*********" value="${loggedInUser.password}" name="password" /> <br>
			Profile Picture: (open an image in a new tab then pasted the link here): 
			<input type="text" value="${loggedInUser.imageUrl}" name="imageUrl" /> <br>
			Email: <input type="text" value="${loggedInUser.email}" name="email" /> <br> 
			First Name: <input type="text" value="${loggedInUser.firstName}" name="firstName" /> <br>
			Last Name: <input type="text" value="${loggedInUser.lastName}" name="lastName" /> <br>
			Biography: <input type="text" value="${loggedInUser.biography}" name="biography" /> <br>
			<input type="submit" value="Update Profile" /> <a
				href="home.do"> <input type="submit" value="Return Home" />
			</a>
		</form>
	</div>
</body>
</html>