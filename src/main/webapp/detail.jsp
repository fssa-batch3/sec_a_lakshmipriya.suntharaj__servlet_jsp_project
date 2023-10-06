<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recipe Details</title>
<link rel="stylesheet" href="./asset/css/detail.css" />
<script
	src="https://cdn.jsdelivr.net/npm/showdown@1.9.0/dist/showdown.min.js"><
	</script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.exception.ServiceException"%>
<%@ page import="com.fssa.recipe.model.Comment"%>
<%@ page import="com.fssa.recipe.service.CommentService, java.util.List"%>
<%@ page import="com.fssa.recipe.model.User"%>
<%@ page import="com.fssa.recipe.service.UserService, java.util.List"%>
<style>
</style>
</head>
<body>

	<header class="head">


		<a href="MyRecipeSCardervlet">
			<button class="Veg-Recipe">My Recipes</button>
		</a> <a href="ListRecipe">
			<button class="myrecipes">Recipes</button>
		</a>

		<div class="header">
			<img class="logo" src="./asset/image/yellow logo.png" height="50px"
				width="50px" alt="logo">
			<h3>RECIPE APP</h3>
		</div>
	</header>




	<div class="recipe-details-container">
    <div class="recipe-details">
        <c:if test="${recipe != null}">
            <img class="image" src="<c:out value='${recipe.getImageUrl()}' />" />
            <div class="whole-content">
                <div class="Ingredients">
                    <h2 id="food-heading">Ingredients:</h2>
                    <p>
                        <span class="ingredients" data-ingredients="<c:out value='${recipe.getIngredients()}' />" style="display: none;"></span>
                        <div class="ingredients-md"></div>
                    </p>
                </div>
                <div class="steps">
                    <h2 id="steps">Steps:</h2>
                    <p>
                        <span class="instruction" data-instructions="<c:out value='${recipe.getInstructions()}' />"></span>
                        <div class="instruction-md"></div>
                    </p>
                </div>
            </div>
        </c:if>
        <c:if test="${recipe == null}">
            <p>Recipe not found.</p>
        </c:if>
    </div>
</div>

<script>
    const converter = new showdown.Converter();
  
    const ingredientsSpan = document.querySelector(".ingredients");
    const ingredientsDiv = document.querySelector(".ingredients-md");
    const ingredientsText = ingredientsSpan.dataset.ingredients;
    const ingredientsHtml = converter.makeHtml(ingredientsText);
    ingredientsDiv.innerHTML = ingredientsHtml;
    
   
    const instructionsSpan = document.querySelector(".instruction");
    const instructionsDiv = document.querySelector(".instruction-md");
    const instructionsText = instructionsSpan.dataset.instructions;
    const instructionsHtml = converter.makeHtml(instructionsText);
    instructionsDiv.innerHTML = instructionsHtml;
</script>







	<!-- Comment Box -->
	<div class="comment-box">
		<form action="CreateComment" method="post">
			<input type="hidden" id="userid" name="userid"
				value="${user.getUserId}"> </input> <input type="hidden" id="Id"
				name="recipeId" value="${recipe.getRecipeId()}"></input>
			<div>
				<p id="comment-heading">Add Your Comments</p>
				<textarea name="comments" id="comments"></textarea>
			</div>
			<div style="padding-top: 13px; margin-left: 106px;">
				<p>ADD YOUR RATINGS</p>
				<div class="rating">
					<select name="rating" id="ratingDropdown" style="width: 558px">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</div>
			</div>
			<div>
			
				<button type="submit" id="send">Send</button>
				
			</div>
		</form>
	</div>

	<!-- Comment List -->

	<div class="ex1">
		<%
		String recipeIdParam = request.getParameter("recipeId");
		int recipeId = 0;
		if (recipeIdParam != null && !recipeIdParam.isEmpty()) {
			try {
				recipeId = Integer.parseInt(recipeIdParam);
			} catch (NumberFormatException e) {
				out.println("Invalid recipeId format: " + recipeIdParam);
			}
		}

		CommentService commentService = new CommentService();
		List<Comment> comments = commentService.getCommentsForRecipeIdDesc(recipeId);

		for (Comment comment : comments) {
			String userEmail = (String) session.getAttribute("loggedInEmail");
			UserService userService = new UserService();
			User user = userService.findUserByEmail(userEmail);

			if (user != null) {
		%>
		<div id="comment-card">
			<p id="username"><%=user.getUsername()%></p>
			<p id="comment"><%=comment.getComment()%></p>
			<p id="createdtime"><%=comment.getCreatedTime()%></p>







		</div>
		<%
		} else {
		%>
		<div>
			<p>Unknown User</p>
			<p><%=comment.getComment()%></p>
			<p><%=comment.getCreatedTime()%></p>

		</div>
		<%
		}
		}
		%>
	</div>



</body>
</html>
