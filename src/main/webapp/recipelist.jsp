<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.recipe.service.exception.ServiceException"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.RecipeService"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipe List</title>
<script
	src="https://cdn.jsdelivr.net/npm/showdown@1.9.0/dist/showdown.min.js"><
	</script>
	

<style>
.free_img {
	height: 200px;
	width: 300px;
}

.Recipes {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-around;
	align-items: flex-start;
}

.card {
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 10px;
	padding: 10px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	background-color: #fff;
}

.free_img {
	max-width: 100%;
	height: auto;
}

/* Style the recipe title */
h3 {
	font-size: 1.2rem;
	margin: 0;
}

/* Style the recipe details */
.info {
	margin-top: 10px;
}
</style>
</head>
<body>



	<div class="Recipes">
		<%
		List<Recipe> listRecipes = (List<Recipe>) request.getAttribute("recipes");

		//System.out.println(listRecipes);

		if (listRecipes != null && !listRecipes.isEmpty()) {
			for (Recipe recipe : listRecipes) {
		%>
		<div class="card">
			<img class="free_img" src="<%=recipe.getImageUrl()%>"
				alt="Recipe Image">
			<div class="info">
				<h3><%=recipe.getName()%></h3>
				<p>
					Description:
					<%=recipe.getDescription()%></p>

				<p>
					Ingredients: <span class="ingredients"  data-ingredients="<%=recipe.getIngredients()%>" style="display: none;"></span>
				<div class="ingredients-md"></div>
				</p>



				<p>
					Instructions: <span class="instruction" >
						<%=recipe.getInstructions()%>
					</span>
				<div class="instruction-md"></div>
				</p>

			</div>

			<a href="recipe_update.jsp" class="signup" type="submit"
				value="<%=recipe.getRecipeId()%>">Update</a> <a class="signup"
				href="recipe_delete.jsp" type="submit"
				value="<%=recipe.getRecipeId()%>">Delete</a>
			<hr>
			<hr>
			<br>

		</div>
		<%
		}
		} else {
		%>
		<p>No Recipes Avaliable</p>
		<%
		}
		%>
	</div>


	<script>
		const converter = new showdown.Converter();
		const len =	<%=listRecipes.size()%>
		const spanIngredients = document.getElementsByClassName("ingredients");
		const divIngredients = document
				.getElementsByClassName("ingredients-md");

		console.log(len)

		for (i = 0; i < len; i++) {
			//console.log("======================", i)

			var text = spanIngredients[i].dataset.ingredients;
			var html = converter.makeHtml(text);
	
			divIngredients[i].insertAdjacentHTML("afterbegin", html);

			
		}
		
		
		
		
		
		
	</script>

</body>
</html>