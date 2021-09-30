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
	<a href="home.do"> <input type="submit" value="Return Home" /></a>
</body>
</html>