<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kitchn Tabl!</title>
<style> 


h1 {text-align: center;}
body {
color:white;
  background-image: url("https://image.freepik.com/free-photo/fresh-baby-spinach-leaves-bowl-eggs-wooden-table-top-view-copy-space_127032-2246.jpg");
   
  background-repeat: no-repeat; 
  background-size: cover;
   background-attachment: fixed;
}
</style>
</head>
<body>


	<h1>Welcome To Kitchn Tabl</h1>
<h3>Home</h3>
<a target="_blank" href="home.do">
  <img src="https://cdn-icons-png.flaticon.com/512/184/184514.png" alt="Paris" style="width:60px">
</a>

<h2>Please enter phrase to search by:</h2>
<div>
<form action="searchcategories.do" method="get">
	<label>Search Phrase: <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Categories" /><br/>
	</form>
</div>
<div>
<form action="searchcookbooks.do" method="get">
	<label>Search Phrase: <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Cookbooks" /><br/>
	</form>
</div>
<div>
<form action="testpageag.do" method="get">
	<label>Amanda Test Link <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Categories" /><br/>
	</form>
</div>
<div>
<form action="createRecipeImageForm.do" method="get">
	<label>John Test Link <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Categories" /><br/>
	</form>
</div>
<div>
<form action="testpageim.do" method="get">
	<label>Isaac Test Link <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Cookbooks" /><br/>
	</form>
</div>
<div>
<form action="testpagedr.do" method="get">
	<label>Dave Test Link <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Categories" /><br/>
	</form>
</div>






	${DEBUG }
</body>
</html>