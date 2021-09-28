<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookbook Search Results</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
<style>
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
			<c:forEach var="cookbook" items="${cookbooks}">
				<tr>
					<td>${cookbook.id}</td>
					<td>${cookbook.name}</td>
					<td>${cookbook.description}</td>
				</tr>

			</c:forEach>
		</table>
	</div>
	<hr />
	<a href="home.do">Back to Home</a>

</body>
</html>