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
<style>
<style>
 .equal-width td {width: 50%; } ;
 .buttons tr td {width: 35%; table-layout: fixed;}
 #button { /* Use a hashtag(#) instead of a dot(.) */
  width: 250px;
 }
</style>

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
<div>
	
		<h3>${loggedInUser.username}'s Info:</h3>
		<br>
		<h3>&nbsp; Profile Picture</h3>
		<img class="profile-picture" src="${loggedInUser.imageUrl}">
		User Name: ${loggedInUser.username} <br>
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
			type="submit" value="Delete Account" onclick=
							"if (!(confirm('Are you sure you want to delete your profile? '))) return false" style="background-color:red; border-color:black; color:white"/>
	</form>
<br>
	<br>
	<br>	
	<div>
		<h3>User Recipe List:</h3>
		<table id="table-div">
			<tr>
				<th>Preview</th>
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
					<td><a href="searchrecipebyid.do?rid=${recipe.id}">
					<img class="profile-picture" src="${recipe.image}"></img></a></td>
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
	
	<form action="recipe/addRecipe.do" method="POST" id="addrecipe">
	<h2>Add Recipe:</h2>
	<table class="equal-width buttons">
	<!--  | name  | instructions | calories | chef_rating | category| serving_size | cook_time_in_minutes | prep_time_in_minutes | user_id | image| description   -->
		<tr>
    		<td style="text-align:right"><label>Recipe Name: </label></td>
			<td><input type="text" name="name"/> </td>    
    	</tr>
    	<tr>
    		<td style="text-align:right"><label>Recipe Instructions: </label></td>
			<td><input type="text" name="instructions"/> </td>    
    	</tr>
	
	    <tr>
    		<td style="text-align:right"><label>Calories: </label></td>
			<td><input type="text" name="calories"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Chef Rating: </label></td>
			<td><input type="text" name="chefRating"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Category: </label></td>
			<td><input type="text" name="category"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Serving Size: </label></td>
			<td><input type="text" name="servingSize"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Cook Time: </label></td>
			<td><input type="text" name="cookTimeInMinutes"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Prep Time: </label></td>
			<td><input type="text" name="prepTimeInMinutes"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Add a link to an image: </label></td>
			<td><input type="text" name="image"/> </td>    
    	</tr>
    	 <tr>
    		<td style="text-align:right"><label>Description </label></td>
			<td><input type="text" name="description"/></td>    
			<td><input type="submit" value="Add Recipe" form="addrecipe"/></td>
    	</tr>
	</table>
	</form>
</body>
</html>