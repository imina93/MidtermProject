<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Recipe Search Results</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../navbar.jsp"></jsp:include>
<br>
<br>
<br>
<h2>Results:</h2>
	<div>
		<table id="table-div">
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
	<hr />
	<jsp:include page="../bootstrapfoot.jsp"></jsp:include>
</body>
</html>