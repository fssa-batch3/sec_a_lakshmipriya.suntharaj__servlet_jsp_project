<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.recipe.service.exception.ServiceException"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.RecipeService, java.util.List"%>
<%@ page import="com.fssa.recipe.service.CommentService, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recipe List</title>
<link rel="stylesheet" href="./asset/css/card.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.likeButton {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

.likeButton.liked {
	background-color: #e74c3c;
}
</style>
</head>
<body>


	<script
		src="https://cdn.jsdelivr.net/npm/showdown@1.9.0/dist/showdown.min.js"></script>
</head>
<body>




	<form action="FilterRecipeServlet" method="GET">

		<select id="category" name="category">
			<option value="Veg">Veg</option>
			<option value="Nonveg">Nonveg</option>
			<option value="Snacks">Snacks</option>
		</select> <input type="submit" id="flitter" value="Filter">
	</form>

	<a href="./index.jsp">
		<button class="non-veg">Home</button>
	</a>

	<a href="MyRecipeSCardervlet">
		<button class="Veg-Recipe">My Recipes</button>
	</a>
	<a href="./useraddrecipe.jsp">
		<button class="non-veg">Add New</button>
	</a>

	<div class="header">
		<img class="logo" src="./asset/image/yellow logo.png" height="50px"
			width="50px" alt="logo">
		<h1>RECIPE APP</h1>
	</div>

	<form id="form" action="SearchRecipeByNameServlet">
		<input type="search" id="query" name="search" placeholder="Search...">
		<button type="submit" id="serchvalue" style="display:none">Search</button>
	</form>


	<div class="all-recipe">
		<%
		List<Recipe> listRecipes = (List<Recipe>) request.getAttribute("recipes");

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

				<a
					href="ViewDetailsServlet?recipeId=<%=recipe.getRecipeId()%>&ListCommentServlet?recipeId=<%=recipe.getRecipeId()%>"
					class="get-details">Get Details</a>
				<div class="new">
					<button class="likeButton" id="likeButton<%=recipe.getRecipeId()%>"
						onclick="toggleLike(<%=recipe.getRecipeId()%>)">Like</button>

				</div>

				<%
				CommentService commentService = new CommentService(); 
				double averageRating = commentService.getAverageRatingForRecipe(recipe.getRecipeId()); // Call the method
				%>

				<span class="rat">Rating: <%=averageRating%></span>

			</div>



		</div>
		<%
		}
		}
		%>



		<script>
    
    var likeButtons = document.querySelectorAll(".likeButton");

    likeButtons.forEach(function(likeButton) {
        likeButton.addEventListener("click", function() {
            var recipeId = this.getAttribute("data-recipeid");
            toggleLike(recipeId);
        });
    });

    function toggleLike(recipeId) {
        var likeButton = document.querySelector(".likeButton[data-recipeid='" + recipeId + "']");
        var likeCount = document.getElementById("likeCount" + recipeId);

        fetch("CreateLikeServlet", {
            method: "POST",
            body: "recipeId=" + recipeId,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        })
        .then(function(response) {
            if (response.ok) {
                return response.text();
            } else {
                throw new Error("Failed to like");
            }
        })
        .then(function(responseText) {
            if (responseText === "Liked") {
                likeButton.classList.add("liked");
                likeButton.textContent = "Liked";
               
            } else if (responseText === "Failed to like") {
                console.log("Failed to like");
            } else {
                console.log("Unknown response: " + responseText);
            }
        })
        .catch(function(error) {
            console.error("Error: " + error);
        });
    }
    </script>

	</div>

</body>
</html>