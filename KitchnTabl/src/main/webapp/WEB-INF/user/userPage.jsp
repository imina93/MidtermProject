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
	
		<h3>${loggedInUser.username}'s Info:</h3>
		<br>
		<h3>&nbsp;
			Profile Picture</h3>
		<img class="profile-picture" src="${loggedInUser.imageUrl}"
			style="float: left; margin-right: 15px;" width="200" height="200">

		First Name: ${loggedInUser.firstName} <br>
		Last Name: ${loggedInUser.lastName} <br>
		Email: ${loggedInUser.email} <br>
		Biography: ${loggedInUser.biography} <br>




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
					<td><a href="showRecipe.do?rid=${recipe.id}">${recipe.name}</a></td>
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