<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Recipe</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>

<form action="addRecipe.do" method="GET">
		Recipe ID: <input type="text" name="id" /> <br> <br>
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
			value="Join Now" />
	</form>
	<a href="home.do"> <input type="submit" value="Return Home" /></a>




</body>
</html>