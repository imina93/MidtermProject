<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Updated Profile</title>
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
	<h2>Successfully Updated Your Information!</h2>
</body>
</html>