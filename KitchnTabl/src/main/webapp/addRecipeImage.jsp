<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KT: Add A New Image Url</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>

	<form action="createRecipeImage.do" method="POST">
		Recipe Image URL: <input type="text" name="imageUrl" /> <br> <input
			type="submit" value="Add New Image Url" />
	</form>
	<a href="home.do"> <input type="submit" value="Return Home" /></a>
	<jsp:include page="bootstrapHead.jsp"></jsp:include>
</body>
</html>