<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Recipe App</title>
<link rel="stylesheet" href="./asset/css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA=="
	crossorigin="anonymous" />
<link rel = "stylesheet" href = "./asset/css/search.css">
</head>

<body>

	<%
	String loggedInEmail = (String) session.getAttribute("loggedInEmail");
	if (loggedInEmail == null) {
	%>

	<header class="head">
		
		<a href="register_user.jsp">
			<button class="signin">Register</button>
		</a> <a href="login.jsp">
			<button class="login-btn">LogIn</button>
		</a>

		<div class="header">
			<img class="logo" src="./asset/image/yellow logo.png" height="50px"
				width="50px" alt="logo">
			<h1>RECIPE APP</h1>
		</div>
		
	</header>
	


	
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Find Meal For Your Ingredients</title>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-+4zCK9k+qNFUR5X+cKL9EIR+ZOhtIloNl9GIKS57V1MyNsYpYcUrUeQc9vNfzsWfV28IaLL3i96P9sdNyeRssA==" crossorigin="anonymous" />
      <link rel = "stylesheet" href = "./asset/css/search.css">
    </head>
    <body>
      <div class = "container">
        <div class = "meal-wrapper">
          <div class = "meal-search">
            <h2 class = "title">Find Meals For Your Ingredients</h2>
            
           
            <div class = "meal-search-box">
              <input type = "text" class = "search-control" placeholder="Enter an ingredient" id = "search-input">
              <button type = "submit" class = "search-btn btn" id = "search-btn">
                <i class = "fas fa-search"></i>
              </button>
            </div>
          </div>
          <div class = "meal-result">
            <h2 class = "title">Your Search Results:</h2>
            <div id= "meal">
            
            </div>
          </div>
          <div class = "meal-details">
           
            <button type = "button" class = "btn recipe-close-btn" id = "recipe-close-btn">
              <i class = "fas fa-times"></i>
            </button>
            
            <div class = "meal-details-content">
              
            </div>
          </div>
        </div>
      </div>
      <script src = "./js/search.js"></script>
    </body>
    </html>



	<%
	} else {
	%>
	<%--after login--%>



	<header class="head">
		

		<a href="LogoutServlet">
			<button class="Logout">Logout</button>
		</a>

		
		<div>
		
		 
		
			 <a href="MyRecipeSCardervlet">
				<button class="Veg-Recipe">My Recipes</button>
			</a> <a href="ListRecipe">
				<button class="myrecipes">Recipes</button>
			</a>

			<div class="header">
				<img class="logo" src="./asset/image/yellow logo.png" height="50px"
					width="50px" alt="logo">
				<h1>RECIPE APP</h1>
			</div>
	</header>
	


	

<head>

<title>Find Meal For Your Ingredients</title>

</head>


	<div class="container">
		<div class="meal-wrapper">
			<div class="meal-search">
				<h2 class="title">Find Meals For Your Ingredients</h2>

				<div class="meal-search-box">
					<input type="text" class="search-control"
						placeholder="Enter an ingredient" id="search-input">
					<button type="submit" class="search-btn btn" id="search-btn">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
			<div class="meal-result">
				<h2 class="title">Your Search Results:</h2>
				<div id="meal">
					
				</div>
			</div>
			<div class="meal-details">
				
				<button type="button" class="btn recipe-close-btn"
					id="recipe-close-btn">
					<i class="fas fa-times"></i>
				</button>
				
				<div class="meal-details-content">
					
				</div>
			</div>
		</div>
	</div>
	<script src = "./js/search.js"></script>


<%
}
%>


</body>
</html>