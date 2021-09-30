<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- <nav class="navbar navbar-expand-lg navbar-dark bg-primary"> -->

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
      <a class="navbar-brand" href="home.do"><img
		src="https://cdn-icons-png.flaticon.com/512/184/184514.png"
		class="home-small"
		alt="Home"></a>
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="getUserPage.do">Profile</a>
        </li>
        <li class="nav-item">         
          <c:if test ="${ empty loggedInUser}">
  <li style="float:right"><a class="nav-link" href="loginHead.do">Login</a></li>
  <li style= "float:right"><a class="nav-link" href="createUserSlotHead.do">Sign Up</a></li>
  </c:if>
  <c:if test ="${ not empty loggedInUser}">
    <li style="float:right"><a class="nav-link" href="logout.do">Logout</a></li>
  </c:if>
        </li>
      </ul>
      <form action="search.do" class="d-flex">
      <select name="searchType">
      <option value="cookbook">Cookbook</option>
      <option value="recipe">Recipe</option>
      <option value="category">Category</option>
      </select>
        <input name="searchTerm" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>