<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Liked Recipes</title>
<link rel="stylesheet" href="./asset/css/likedrecipe.css">

<style type="text/css">
.dislikeButton {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
}

.dislikeButton.liked {
	background-color: #e74c3c;
}
</style>
</head>


<body>

	<div class="header">
		<img class="logo" src="./asset/image/yellow logo.png" height="50px"
			width="50px" alt="logo">
		<h1>RECIPE APP</h1>
	</div>

	<a href="MyRecipeSCardervlet">
		<button class="Veg-Recipe">My Recipes</button>
	</a>
	<a href="./index.jsp">
		<button class="non-veg">Home</button>
	</a>

	<div class="all-recipe">
		<%
		List<Recipe> likedRecipes = (List<Recipe>) request.getAttribute("likes");

		if (likedRecipes != null && !likedRecipes.isEmpty()) {
			for (Recipe recipe : likedRecipes) {
		%>

		<div class="recipe">
			<img class="recipe-img" height="300px" width="500px"
				src="<%=recipe.getImageUrl()%>">
			<div class="about">
				<h2 class="recipe-title"><%=recipe.getName()%></h2>
				<p class="recipe-description"><%=recipe.getDescription()%></p>
				<a href="ViewDetailsServlet?recipeId=<%=recipe.getRecipeId()%>"
					class="get-details">Get Details</a>
				<div class="new">
					<button class="dislikeButton"
						data-recipeid="<%=recipe.getRecipeId()%>"
						onclick="toggleDislike(<%=recipe.getRecipeId()%>)">Dislike</button>
				</div>

			</div>
		</div>
		<%
		}
		} else {
		%>
		<p id="no">You haven't Liked Any Recipes Go and Like</p>
		<%
		}
		%>
		<script>
		function toggleDislike(recipeId) {
		    var dislikeButton = document.querySelector(".dislikeButton[data-recipeid='" + recipeId + "']");

		    fetch("DislikeRecipeServlet", {
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
		            throw new Error("Failed to dislike");
		        }
		    })
		    .then(function(responseText) {
		        if (responseText === "Disliked") {
		            dislikeButton.classList.add("disliked");
		            dislikeButton.textContent = "Disliked";
		        } else if (responseText === "Failed to dislike") {
		            console.log("Failed to dislike");
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
