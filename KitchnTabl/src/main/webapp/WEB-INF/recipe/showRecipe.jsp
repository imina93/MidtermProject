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
<br>
<br>
<br>
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
		Recipe ID: <input type="text" name="rid" value="${recipe.id}" /> <br>
		Recipe Name: <input type="text" name="name" value="${recipe.name}" /> <br>
		Recipe Instructions: <input type="text" name="instructions" value="${recipe.instructions}"/> <br>
		Calories: <input type="text" name="calories" value="${recipe.calories}"/> <br>
		Chef Rating: <input type="text" name="chefRating" value="${recipe.chefRating}" /> <br>
		Category: <input type="text" name="category" value="${recipe.category}"/> <br>
		Serving Size: <input type="text" name="servingSize" value="${recipe.servingSize}" /> <br>
		Cook Time: <input type="text" name="cookTime" value="${recipe.cookTime}"/> <br>
		Prep Time: <input type="text" name="prepTime" value="${recipe.prepTime}"/><br>
		Add An Image: <input type="text" name="image" /> <br>
		Description: <input type="text" name="description" value="${recipe.description}"/>  <br>
		
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