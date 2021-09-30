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
</style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
	<h1>Welcome To The Kitchn Tabl</h1>
		<div class="container-fluid">
		<form action="getUser.do?id=${user.id}" method="GET"> <!-- idea -->
			User Id: <input type="text" name="uid" /> <input type="submit" value="Show User Info By Id" />
		</form>
		<br>
		
	<h2>Please enter phrase to search by:</h2>
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
   		 
 <!--   		   <li><a href="searchcategories.do">Categories</a></li>
  <li><a href="searchrecipe.do">Recipes</a></li>
  <li><a href="searchcookbooks.do">Cookbooks</a></li> -->
   		 
   		 
   		  
    
</table>
 </div>
<jsp:include page="bootstrapfoot.jsp"></jsp:include>
</body>
</html>