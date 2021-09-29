<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Update Recipe</title>
</head>
<body>


<form action="editRecipe.do" method="GET">
		
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
			value="Update Now"/>
	</form>
			
			<form action="deleteRecipe.do" method="POST">
		<input type="hidden" name="rid" value="${recipe.id}" /> <br> <input
			type="submit" value="Delete Recipe" />
	</form>
	<a href="home.do"> <input type="submit" value="Return Home" /></a>
</body>
</html>