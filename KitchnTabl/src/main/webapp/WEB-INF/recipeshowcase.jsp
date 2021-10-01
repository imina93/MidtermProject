<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var= "recipe" items="${randomRecipes}">

<div class="flip-card">
  <div class="flip-card-inner">
    <div class="flip-card-front">
      <img src="${recipe.image}" alt="Avatar" style="width:250px;height:250px;">
    </div>
    <div class="flip-card-back">
      <h1>${recipe.name}</h1>
      <p>${recipe.description}</p>
    </div>
  </div>
</div>
</c:forEach>