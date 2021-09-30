<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Cookbook Search Results</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<style>
</style>
</head>
<body>
<jsp:include page="navbar.jsp"></jsp:include>
<br>
<br>
<br>
<div>
	<c:if test ="${not empty cookbooks}">
   		<h2>Results:</h2>
		<table id="table-div">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Description</th>
			</tr>
		<c:forEach var="cookbook" items="${cookbooks}">
				<tr>
					<td>${cookbook.id}</td>
					<td>${cookbook.name}</td>
					<td>${cookbook.description}</td>
				</tr>

		</c:forEach>
		</table>
	 </c:if>
	<c:if test ="${ empty cookbooks}">
   		<h2>Search Results Empty</h2>
    </c:if>
</div>
	<hr />
	<jsp:include page="bootstrapfoot.jsp"></jsp:include>
</body>
</html>