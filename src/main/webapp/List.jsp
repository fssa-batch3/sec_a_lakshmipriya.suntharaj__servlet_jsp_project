<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import = "com.fssa.recipe.model.Recipe" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Display All accounts</title>
</head>
<body>
	<h1>Display All Recipe</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Recipe Name</th>
				<th>description</th>
				<th>Ingerdients</th>
				<th>Instructions</th>
				<th>ImageUrl</th>
				<th>Category</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="recipe" items="${RecipeList}" varStatus="loop">
			<%
			List<Recipe> res = (List<Recipe>) request.getAttribute("RecipeList");
			
			 %>
			

				<tr>
					<td><c:out value="${recipe.name}" /></td>
					<td><c:out value="${recipe.description}" /></td>
					<td><c:out value="${recipe.ingredients}" /></td>
					<td><c:out value="${recipe.instructions}" /></td>
					<td><c:out value="${recipe.imageUrl}" /></td>
					<td><c:out value="${recipe.category}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>