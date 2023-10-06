<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Edit Recipe</title>

<style >
/* Style for the form container */
#form2 {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f2f2f2;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* Style for labels */
label {
    font-weight: bold;
}

/* Style for input fields */
input[type="text"],
input[type="number"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

/* Style for the submit button */
button.signup {
    background-color: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 3px;
    cursor: pointer;
     width:200px
}

/* Style for the "Delete Recipe" link */
.signupbtn {
    background-color: #f44336;
    color: white;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 3px;
    width:200px;
    display: block;
    text-align: center
}

.signupbtn:hover {
    background-color: #d32f2f;
}

/* Optional: Add more specific styles for form elements if needed */


</style>

</head>
<body>


<form action="RecipeEditServlet" method="post" id="form2" class="onlyreg">
    <label >Recipe Id:</label>
    <input type="number" name="recipeId"  /><br /><br />

    <label for="recipeName">Recipe Name:</label>
    <input type="text" id="recipeName"  value = "Pongal" name="recipeName" required /><br /><br />

    <label for="imageUrl">Image URL:</label>
    <input type="text" id="imageUrl" value = "https://www.vegrecipesofindia.com/wp-content/uploads/2019/01/ven-pongal-recipe-1a.jpg" name="imageUrl" required /><br /><br />

    <label for="description">Description:</label>
    <input type="text" id="description" name="description"  value = "Pongal is a popular South Indian food made with rice & moong dal, either to a sweet or savory dish. "  required /><br /><br />

    <label for="ingredients">Ingredients:</label>
    <input id="ingredients" type = text name="ingredients" value= "Rice, Split yellow moong dal, Black pepper, Cumin seeds, Ghee (clarified butter), Cashew nuts, Curry leaves,
     Ginger" required></input><br /><br />

    <label for="instructions">Instructions:</label>
    <input id="instructions" name="instructions" value = "Cook rice and moong dal together until soft.
In a separate pan, heat ghee and add black pepper, cumin seeds, cashew nuts, ginger, curry leaves, and asafoetida.
Add the cooked rice and dal mixture. Mix well and season with salt.
Serve hot as a breakfast dish." type = text  required></input><br /><br />

<label for="category">Category:</label>
    <input type="text" id="category" name="category"  value = "veg" required /><br /><br />


    <div>
        <button class="signup" type="submit">Update Recipe</button>
    </div>
    <div class="signupbtn_div">
        <a class="signupbtn" href="recipe_delete.jsp">Delete Recipe</a>
    </div>
</form>

<div>
    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null) { %>
        <p><%= message %></p>
    <% } %>
</div>
</body>
</html>
