<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: ${recipe.name}</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>
<jsp:include page="../navbar.jsp"></jsp:include>
<h2>${recipe.name}</h2>
<div>
  <h5>Recipe Name: ${recipe.name} </h5>
  <h5>Description:${recipe.description}  Prep Time: ${recipe.prepTime} </h5>
  <h5>Cook Time: ${recipe.cookTime}  Serving Size:${recipe.servingSize}  Chef Rating: ${recipe.chefRating} </h5>
  <h5>Category: ${recipe.category}</h5>
  <p>Instructions:
  <br> 
  ${recipe.instructions}
  </p>
</div>

<div>
<form action="editRecipe.do" method="POST">
	<h5>Edit Recipe</h5>	
	<br>
	
	<table>
	
	<tr>
	<td>Recipe ID: 	</td>
	<td><input type="text" name="rid" value="${recipe.id}" />	</td>
	</tr>
	
	<tr>
	<td>Recipe Name:</td>
	<td><input type="text" name="name" value="${recipe.name}" /> </td>
	</tr>
	
	<tr>
	<td>Recipe Instructions:</td>
	<td><input type="text" name="instructions" value="${recipe.instructions}"/> </td>
	</tr>
	
	<tr>
	<td>Calories:</td>
	<td> <input type="text" name="calories" value="${recipe.calories}"/></td>
	</tr>
	
	<tr>
	<td>Chef Rating:</td>
	<td><input type="text" name="chefRating" value="${recipe.chefRating}" /> </td>
	</tr>
	
	<tr>
	<td>Category:</td>
	<td><input type="text" name="category" value="${recipe.category}"/> </td>
	</tr>
	
	<tr>
	<td>Serving Size:</td>
	<td><input type="text" name="servingSize" value="${recipe.servingSize}" /> </td>
	</tr>
	
	<tr>
	<td>Cook Time:</td>
	<td><input type="text" name="cookTime" value="${recipe.cookTime}"/></td>
	</tr>
	
	<tr>
	<td>Prep Time:</td>
	<td><input type="text" name="prepTime" value="${recipe.prepTime}"/></td>
	</tr>
		
	<tr>
	<td>Add An Image:</td>
	<td> <input type="text" name="image" /> </td>
	</tr>
	
	<tr>
	<td>Description:</td>
	<td><input type="text" name="description" value="${recipe.description}"/>	</td>
	</tr>
	
	</table>	
			 <br> 
			<input type="submit"
			value="Update Now"/>
	</form>
</div>
			
			<form action="deleteRecipe.do" method="POST">
		<input type="hidden" name="rid" value="${recipe.id}" /> <br> <input
			type="submit" value="Delete Recipe" />
	</form>
	<jsp:include page="../bootstrapfoot.jsp"></jsp:include>
	
</body>
</html>