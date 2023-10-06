<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.RecipeService"%>
<%@ page import="com.fssa.recipe.service.exception.ServiceException"%>
<%@ page import="com.fssa.recipe.dao.RecipeDAO"%>
<!DOCTYPE html>
<html>
<head>
<title>All Recipes</title>
<style>
.fundraise-card {
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	max-width: 300px;
	height: 300px;
}

#coverpic {
	max-width: 300px;
	max-height: 200px;
	margin: auto;
}

#fundraiseContainer {
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
</head>
<body>
	<h1>All Fundraise Campaigns</h1>
	<a href="home.html">Go Back to Home</a>

	<div class="fundraise-cards" id="fundraiseContainer">
		<%
		try {
			RecipeDAO dao = new RecipeDAO();
			List<Recipe> recipes = dao.getAllRecipes();
			for (Recipe recipe : recipes) {
		%>
		<div class="fundraise-card">
			<h2><%=recipe.getName()%></h2>
			<p><%=recipe.getDescription()%></p>
			<p><%=recipe.getIngredients()%></p>
			<p><%=recipe.getInstructions()%></p>
			<p><%=recipe.getCategory()%></p>
			<img id="coverpic" height="20px" width="30px"
				src="<%=recipe.getImageUrl()%>">
		</div>

		<%
		}
		} catch (ServiceException e) {
		out.println("Error fetching or displaying fundraise data: " + e.getMessage());
		}
		%>

	</div>
</body>
</html>