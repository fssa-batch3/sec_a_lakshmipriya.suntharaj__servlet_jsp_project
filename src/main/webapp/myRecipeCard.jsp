<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.recipe.service.exception.ServiceException"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.RecipeService, java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./asset/css/myrecipecard.css">
<script
	src="https://cdn.jsdelivr.net/npm/showdown@1.9.0/dist/showdown.min.js"></script>
</head>
<body>

	<a href="ListRecipe">
		<button class="myrecipes">Recipes</button>
	</a>

	<a href="ListLikeRecipe">
		<button class="non-veg">Liked Recipe</button>
	</a>


	<a href="./useraddrecipe.jsp">
		<button class="non-veg">Add New</button>
	</a>
	<a href="./index.jsp">
		<button class="non-veg">Home</button>
	</a>

	<div class="header">
		<img class="logo" src="./asset/image/yellow logo.png" height="50px"
			width="50px" alt="logo">
		<h1>RECIPE APP</h1>
	</div>
	</header>


	<div class="all-recipe">
		<%
		List<Recipe> listRecipes = (List<Recipe>) request.getAttribute("recipes");

		System.out.println(listRecipes);

		if (listRecipes != null && !listRecipes.isEmpty()) {

			for (Recipe recipe : listRecipes) {

				System.out.print(recipe.getRecipeId());
		%>

		<div class="recipe">

			<img class="recipe-img" height="300px" width="500px"
				src="<%=recipe.getImageUrl()%>">
			<div class="about">
				<h2 class="recipe-title"><%=recipe.getName()%></h2>
				<p class="recipe-description"><%=recipe.getDescription()%></p>
				<a href="ViewDetailsServlet?recipeId=<%=recipe.getRecipeId()%>"
					class="get-details">Get Details</a>
				<div>
					<a href="user_updaterecipe.jsp?recipeId=<%=recipe.getRecipeId()%>">
						<button>Edit</button>
					</a> <a href="DeleteRecipeServlet?recipeId=<%=recipe.getRecipeId()%>"><button>Delete</button></a>
				</div>
			</div>
		</div>
		<%
		}
		} else {
		%>

		<p style="margin-left: 641px; margin-bottom: 14px; margin-top: 310px;">You
			have not Added any Recipes</p>

		<%
		}
		%>
	</div>


	</div>




</body>
</html>