<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe Search Results</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<style>

</style>
</head>
<body>

	<div>
	<c:if test ="${not empty recipes}">
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
			<c:forEach var="recipe" items="${recipes}">
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
		</c:if>
			<c:if test ="${empty recipes}">
		   	<h2>Search Results Empty</h2>
		</c:if>
	</div>
	<hr />
	<a href="home.do">Back to Home</a>

</body>
</html>