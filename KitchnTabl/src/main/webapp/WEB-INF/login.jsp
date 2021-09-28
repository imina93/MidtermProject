<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
<jsp:include page="bootstrapHead.jsp"></jsp:include>
</head>
<body>
<h2>Log In</h2>
<form action="login.do" method="POST">
	<%-- Error messages --%>
	<input type="text" name="username">
	<input type="password" name="password"/>
  <c:if test ="${not empty loginError}">
           ${loginError}
        </c:if>
	<input type="submit" value="Log In" > 
	
	
</form>
</body>
</html>