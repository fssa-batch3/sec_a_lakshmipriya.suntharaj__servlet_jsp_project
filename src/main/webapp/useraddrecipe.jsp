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
</head>
<body>


	</a>
	<a href="./index.jsp">
		<button class="non-veg">Home</button>
	</a>
	<div class="header">
		<img class="logo" src="./asset/image/yellow logo.png" height="50px"
			width="50px" alt="logo">
		<h1>RECIPE APP</h1>
	</div>



	<div class="contact-form">



		<span class="heading">Add new Recipe</span>


		<%
		String errorMessage = request.getParameter("error");
		if (errorMessage != null) {
		%>

		<div class="styledbutton" id="styledbuttonlogin">
			<%=errorMessage%>
		</div>
		<br /> <br />
		<%
		}
		%>

		<form id="addrecipe" action="createrecipe" method="post">
			<label for="image">Image Url</label> <input type="url" required
				id="imgurl" name="imageUrl"
				>
			<label for="head">Recipe Name</label> <input type="text" required
				id="recipename" name="name"> <label
				for="head">Description</label> <input type="text" id="About"
				name="description"
				>
			<label for="head">Ingredient</label>
			<textarea id="Ingredient" name="ingredients"> </textarea>

			<label for="step1">Step</label>
			<textarea type="text" id="Step" required id="Step1"
				name="instructions"> </textarea>


			<label for="Category">Category</label> <select id="category"
				name="category" style="width: 760px;">
				<option value="Veg">Veg</option>
				<option value="NonVeg">Nonveg</option>
				<option value="Snacks">Snacks</option>

			</select>
			<button type="submit">Submit</button>
		</form>

	</div>

	<script>
		var simplemdeIngredient = new SimpleMDE({
			element : document.getElementById("Ingredient")

		});

		var simplemdeInstructions = new SimpleMDE({
			element : document.getElementById("Step")
		});
	</script>
</body>
</html>
