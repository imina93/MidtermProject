<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kitchn Tabl!</title>
<style> 
body {
color:white;
  background-image: url("https://st3.depositphotos.com/4590583/i/600/depositphotos_348227200-stock-photo-black-cooking-background-vegetables-spices.jpg");
   
  background-repeat: no-repeat; 
  background-size: cover;
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
<form action="searchpage.do" method="get">
	<label>Search Phrase: <input type="text" name="keyword"  /></label><br/>
	<input type="submit" value="Search Categories" /><br/>
	</form>
</div>




	${DEBUG }
</body>
</html>