<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> 
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KT: Log In</title>
<jsp:include page="../bootstrapHead.jsp"></jsp:include>
</head>
<body>

<jsp:include page="../navbar.jsp"></jsp:include>
<br>
<br>
<br>

<h2>Log In</h2>
<form action="login.do" method="POST">
	<%-- Error messages --%>
	
	<div class="wrapper">
	<input type="text"
	placeholder="User Name"
	id="username"
	name="username">
	</div> 
	<div class="wrapper">
	<input type="password"
	placeholder="Password"
	id="password"
	name="password">
	<input type="submit" value="Log In" > 
	</div>  
  <c:if test ="${not empty loginError}">
           ${loginError}
        </c:if>
	
	
</form>

<jsp:include page="../bootstrapfoot.jsp"></jsp:include>
</body>
</html>