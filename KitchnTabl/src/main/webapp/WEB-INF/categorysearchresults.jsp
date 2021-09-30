<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Category Search Results</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>
<div id="headerDiv">
<ul>
  <li><a target="_self" class="active" href="home.do"><img
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
 <div>
		<c:if test ="${not empty categories}">
		<h2>Results:</h2>
		<table id="table-div">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
			</tr>
			<c:forEach var="category" items="${categories}">
				<tr>
					<td>${category.id}</td>
					<td>${category.name}</td>
					<td>${category.description}</td>
				</tr>

			</c:forEach>
		</table>
		
        </c:if>
	<c:if test ="${ empty categories}">
   	<h2>Search Results Empty</h2>
        </c:if>
	</div>
	<hr />
</body>
</html>