<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Users Details</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
<!--show.jsp is in a folder so for page= i used ../ to get it out and read bootstrapHead.jsp   -->

</head>
<body>
	<div>
		<h3>${user.username}'sStats:</h3>
		<br>

		<!-- 	User Name: <input type="text" name="username" /> <br>
		<br> Password: <input type="text" name="password" />
		User Profile Picture: (Right Click, Open Image In New Tab, Copy
		And Then Paste The address) <input type="text" name="imageUrl" />
		<br> Email: <input type="text" name="email" /> <br>
		First Name: <input type="text" name="firstName" /> <br>
		Last Name: <input type="text" name="lastName" /> <br> 
		Biography: <input type="text" name="biography" /> <br> <input
			type="submit" value="Join Now" /> -->
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
	<form action="updateUserSlot.do" method="POST">
		<input type="hidden" name="uid" value="${user.id}" /> <input
			type="submit" value="Update Info" />
	</form>
	<br>
	<form action="deleteUser.do" method="POST">
		<input type="hidden" name="uid" value="${user.id}" /> <br> <input
			type="submit" value="Delete Account" />
	</form>
	<br>
	<br>	
	<div>
		<table id="table-div">
		<h3>User Recipe List:</h3>
			<tr>
				<th>Name</th>
				<th>Description</th>
				<th>Prep Time</th>
				<th>Cook Time</th>
				<th>Serving Size</th>
				<th>Chef Rating</th>
				<th>Category</th>
				  
			</tr>
			<c:forEach var="recipe" items="${loggedInUser.recipe}">
				<tr>
					<td>${recipe.name}</td>
					<td>${recipe.description}</td>
					<td>${recipe.prepTime}</td>
					<td>${recipe.cookTime}</td>
					<td>${recipe.servingSize}</td>
					<td>${recipe.chefRating}</td>
					<td>${recipe.category}</td>
				</tr>

			</c:forEach>
		</table>
	</div>

	<br>
	<br>
	<br>
	<form action="addRecipe.do" method="POST">
		
		Recipe Name: <input type="text" name="name" /> <br>
		Recipe Instructions: <input type="text" name="instructions" /> <br>
		Calories: <input type="text" name="calories" /> <br>
		Chef Rating: <input type="text" name="chefRating" /> <br>
		Category: <input type="text" name="category" /> <br>
		Serving Size: <input type="text" name="servingSize" /> <br>
		Cook Time: <input type="text" name="cookTime" /> <br>
		Prep Time: <input type="text" name="prepTime" /> <br>
		Add An Image: <input type="text" name="imageUrl" /> <br>
		Description: <input type="text" name="description" /> <br>
		
			 <br> 
			<input type="submit"
			value="Add Recipe" />
	</form>
	
	
	
	<!-- create go home button here -->
	<a href="home.do"> <input type="submit" value="Return Home" />
	</a>

</body>
</html>