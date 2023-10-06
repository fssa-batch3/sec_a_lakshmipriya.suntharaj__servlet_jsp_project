<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<style>
a {
  display: inline-block;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  background-color: #2b2727; 
  color:##ff0043; 
  border-radius: 5px;
  margin: 5px; 
  width: 200px;
  transition: background-color 0.3s ease; 
}


a[href="createrecipe.html"] {
  
}

a[href="ListRecipe"] {
 
}

a[href="recipe_update.jsp"] {
  
}

a[href="recipe_delete.jsp"] {
  
}

</style>


</head>




<body>



<h1>Welcome to Recipe Web App</h1>

<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	
	if(loggedInEmail == null) {
		response.sendRedirect("login.jsp");
	}
	
%>

<p>Logged In user: <%=loggedInEmail%> </p>
<a href="LogoutServlet">logout</a><br>

<a href="createrecipe.html">Create Recipe</a> <br>
<a href="ListRecipe">List Recipes</a><br>
<a href="recipe_update.jsp">Update Recipe</a> <br>
<a href="recipe_delete.jsp">Delete Recipe</a> <br>

</body>
</html>