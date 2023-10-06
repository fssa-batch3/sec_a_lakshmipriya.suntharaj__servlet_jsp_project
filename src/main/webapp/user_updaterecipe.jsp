<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User add newRecipe Form</title>
<link rel="stylesheet" href="./asset/css/addrecipe.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.css">
<script src="https://cdn.jsdelivr.net/simplemde/latest/simplemde.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script>
<%@ page import="com.fssa.recipe.model.Recipe"%>
<%@ page import="com.fssa.recipe.service.RecipeService"%>

</head>
<body>
<% 
String recipeId = request.getParameter("recipeId").trim();
    int recipeid = Integer.parseInt(recipeId);
RecipeService recipeService = new RecipeService();
Recipe recipe = new Recipe();

try {
    recipe = recipeService.findRecipeById(recipeid);
   
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>
	<div class="contact-form">
		<span class="heading">Add new Recipe</span>
		<form id="addrecipe"action="UpdateRecipeServlet" method="post">
		
		
			<label for="image" >Image Url</label> 
			<input type="url" value="<%=recipe.getImageUrl()%>" required id="imgurl" name="imageUrl" > 
			<label for="head">Recipe Id</label> 
			<input type="text" value="<%=recipe.getRecipeId()%>" required id="recipeId" name="recipeId">
			<label for="head">Recipe Name</label> 
			<input type="text"  value = "<%=recipe.getName()%>" required id="recipename" name="name">
		
			<label for="head">Description</label> 
			<input type="text" id="About" value = "<%=recipe.getDescription()%>" name="description"> 
			
			<label for="head">Ingredient</label> 
			<textarea  id="Ingredient"  name="ingredients"> <%=recipe.getIngredients()%> 
			</textarea>
			<label  for="step1">Step</label> 
			<textarea type="text" id ="Step" value="" required id="Step1" name="instructions"> <%=recipe.getInstructions()%>
			</textarea>


			<label for="Ingredient">Catagory</label> 
			<input type="text" id="catagory" value ="<%=recipe.getCategory()%>"name="category">
			
			<button type="submit">Submit</button>
		</form>

	</div>

	<script>
		var simplemdeIngredient = new SimpleMDE({
			element : document.getElementById("Ingredient")
			
		});	
		
		var simplemdeInstructions = new SimpleMDE({
            element: document.getElementById("Step")
        });
	</script>
</body>
</html>
