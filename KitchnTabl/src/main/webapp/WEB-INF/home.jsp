<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Kitchn Tabl!</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<style>
 .equal-width td {width: 50%; } ;
 .buttons tr td {width: 35%; table-layout: fixed;}
 #button { /* Use a hashtag(#) instead of a dot(.) */
  width: 150px;
 }
</style>
</head>
<body>


	<h1>Welcome To The Kitchn Tabl</h1>
	<h3>Home</h3>
	<a target="_blank" href="home.do"> <img
		src="https://cdn-icons-png.flaticon.com/512/184/184514.png"
		class="profile-small"
		alt="Home">
	</a>
	<c:if test ="${not empty loggedInUser}">
           	<div>
		<form action="logout.do" method="POST">
			<input type="submit" value="Logout" />
		</form>
	</div>
        </c:if>
	<c:if test ="${ empty loggedInUser}">
           	<div>
		<form action="login.do" method="POST">
			<input type="submit" value="Login" />
		</form>
	</div>
        </c:if>
	
	
	
	
		<div class="container-fluid">
		<form action="getUser.do?id=${user.id}" method="GET">
			User Id: <input type="text" name="uid" /> <input type="submit" value="Show User Info By Id" />
		</form>
		<br>
	<h2>Please enter phrase to search by:</h2>
<!-- 	<div>
		<form action="searchcategories.do" method="get">
			<label>Search Category: <input type="text" name="keyword" /></label>
			<input type="submit" value="Search Categories" />
		</form>
 	</div> -->
 	
 	
 	
	<!-- <div> 
		<form action="searchcookbooks.do" method="get">
			<label>Search Cookbook: <input type="text" name="keyword" /></label>
			<input type="submit" value="Search Cookbooks" />
		</form>
	</div> -->
	
<!-- 	<div> 
		<form action="searchrecipe.do" method="get">
			<label>Search Recipe: <input type="text" name="keyword" /></label>
			<input type="submit" value="Search Recipes" />
		</form>
	</div>
	 -->
	 
<!-- 	 <div> 
		<form action="searchrecipebyid.do" method="get">
			<label>Search Recipe By ID: <input type="text" name="rid" /></label>
			<input type="submit" value="Search Recipes" />
		</form>
	</div> -->
	
	<form action="searchcategories.do" method="get" id="searchcategories"></form> 
	<form action="searchcookbooks.do" method="get" id="searchcookbooks"></form>
	<form action="searchrecipe.do" method="get" id="searchrecipe"></form>
	<form action="searchrecipebyid.do" method="get" id="searchrecipebyid"></form>

	<table class="equal-width buttons">
		<tr>
    		<td style="text-align:right"><label>Search Category: <input type="text" name="keyword" form="searchcategories" /></label></td>
			<td><input type="submit" value="Search Categories" form="searchcategories" id="button"/> </td>    
    	</tr>

    	<tr>	
    		<td style="text-align:right"><label>Search Cookbook: <input type="text" name="keyword" form="searchcookbooks" /></label></td>
			<td><input type="submit" value="Search Cookbooks" form="searchcookbooks" id="button"/></td>
    	</tr>
    
     	<tr>   
        	<td style="text-align:right"><label> Search Recipe: <input type="text" name="keyword" form="searchrecipe" /></label></td>
        	<td><input type="submit" value="Search Recipes" form="searchrecipe" id="button"/></td>
    	</tr>
      
      	<tr>   
        	<td style="text-align:right"><label>Search Recipe By ID: <input type="text" name="rid" form="searchrecipebyid"/></label></td>
            <td><input type="submit" value="Search Recipes" form="searchrecipebyid" id="button"/></td>
   		 </tr>
    
    	
		    
    
</table>
	
	
	
	
	
	
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
</body>
</html>