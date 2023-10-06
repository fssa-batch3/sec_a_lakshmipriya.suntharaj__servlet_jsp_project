<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Recipe</title>
<style>
/* Style the form container */
#form2 {
  max-width: 300px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  background-color: #f9f9f9;
  text-align: center;
}

/* Style the label for Recipe Id */
label {
  display: block;
  font-weight: bold;
  margin-bottom: 10px;
}

/* Style the input field for Recipe Id */
input[type="number"] {
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* Style the button */
button.signup {
  background-color: #007bff;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

/* Add hover effect to the button */
button.signup:hover {
  background-color: #0056b3;
}

</style>
</head>
<body>


	<form action="DeleteServletRecipe" method="post" id="form2"
		class="onlyreg">
		<label for="recipeId">Recipe Id:</label> <input type="number"
			name="recipeId"/><br />
		<br />
		<div>
		    <button class="signup" type="submit">Delete Recipe</button>
		</div>
	</form>


	<div>
		<%
		String message = (String) request.getAttribute("message");
		%>
		<%
		if (message != null) {
		%>
		<p><%=message%></p>
		<%
		}
		%>
	</div>
</body>
</html>