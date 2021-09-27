<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST</title>
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

	<div>
	<table id="table-div">
		<tr>
        <th>ID</th>
        <th>Name</th>
        <th>Description</th>
		</tr>
	<c:forEach var="category" items="${categories}">
			<tr>
			<td>${category.id}</td>
			 <td>${category.name}}</td>
            <td>${category.description}</td>
			</tr>
			
		</c:forEach>
	</table>
	</div>
	<hr />
	<a href="home.do">Back to Home</a>

</body>
</html>