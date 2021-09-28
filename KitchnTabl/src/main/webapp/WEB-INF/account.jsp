<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Page</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>
<div>
		<table id="table-div">
			<tr>
				<th>Name</th>
				<th>User Name</th>
				<th>Email</th>
				<th>Biography</th>
				
				<!-- Add Recipe List and Cookbook List -->
				  
			</tr>
			<c:forEach var="user" items="${user}">
				<tr>
					<td>${user.firstName}${user.lastName}</td>
					<td>${user.userName}</td>
					<td>${user.email}</td>
					<td>${user.biography}</td>
					
				</tr>

			</c:forEach>
		</table>
	</div>
	<hr />
	<a href="home.do">Back to Home</a>





</body>
</html>