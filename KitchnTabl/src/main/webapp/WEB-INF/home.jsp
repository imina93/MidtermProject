<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kitchn Tabl!</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<style>
</style>
</head>
<body>


	<h1>Welcome To Kitchn Tabl</h1>
	<h3>Home</h3>
	<a target="_blank" href="home.do"> <img
		src="https://cdn-icons-png.flaticon.com/512/184/184514.png"
		alt="Paris" style="width: 60px">
	</a>
		<div class="container-fluid">
		<form action="getUser.do?id=${user.id}" method="GET">
			User Id: <input type="text" name="uid" /> <input type="submit" value="Show User Info By Id" />
		</form>
		<br>
	<h2>Please enter phrase to search by:</h2>
	<div>
		<form action="searchcategories.do" method="get">
			<label>Search Phrase: <input type="text" name="keyword" /></label>
			<input type="submit" value="Search Categories" />
		</form>
 	</div>
	<div> 
		<form action="searchcookbooks.do" method="get">
			<label>Search Phrase: <input type="text" name="keyword" /></label>
			<input type="submit" value="Search Cookbooks" />
		</form>
	</div>
<!--	<div>
		<form action="testpageag.do" method="get">
			<label>Amanda Test Link <input type="text" name="keyword" /></label><br />
			<input type="submit" value="Search Categories" /><br />
		</form>
	</div>
	<div>
		<form action="createRecipeImageForm.do" method="get">
			<label>John Test Link <input type="text" name="keyword" /></label><br />
			<input type="submit" value="Search Categories" /><br />
		</form>
	</div>
	<div>
		<form action="testpageim.do" method="get">
			<label>Isaac Test Link <input type="text" name="keyword" /></label><br />
			<input type="submit" value="Search Cookbooks" /><br />
		</form>
	</div>
	<div>
		<form action="testpagedr.do" method="get">
			<label>Dave Test Link <input type="text" name="keyword" /></label><br />
			<input type="submit" value="Search Categories" /><br />
		</form>
	</div>
 -->
	<div>
		<form action="createUserSlot.do" method="POST">
			<input type="submit" value="Join Now" />
		</form>
	</div>
	
 </div>
	${DEBUG }
</body>
</html>