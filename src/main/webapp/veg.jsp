<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="./asset/css/recipe_home.css">
    <title>cooking website</title>
    <meta name="view port" content="width=device-width, initial-scale=1.0">

</head>

<body>

    <header class="head">

        <a href=".profile.html">
            <button class="non-veg">
                profile
            </button>
        </a>

        <!-- <a href="./pages/log.html">
                <button class="login-btn">
                    Login
                </button> 

            </a> -->
       
        <a href="./veg.jsp">
            <button class="Veg-Recipe">
                Veg Recipe
            </button>
        </a>
        <a href="./nonveg.jsp">
            <button class="non-veg">
                NonVeg
            </button>
        </a>
        <a href="./snacks.jsp">
            <button class="snacks">
                Snacks
            </button>
        </a>
        <a href="./useraddrecipe.jsp">
            <button class="Veg-Recipe">
                Add New
            </button>
        </a>
            <div class="header">
                <img class="logo" src="./asset/image/yellow logo.png" height="50px" width="50px" alt="logo">
                <h1>RECIPE</h1>
            </div>
            <!-- <span class="by">By Mullai</span> -->
    </header>




    <!-- <img class="header-image" src="https://media.tenor.com/yZCowKJy4UoAAAAd/anime-anime-gif.gif" alt="head"> -->
    <div class="all-recipe">

    </div>


<%-- 
    <script>


        const recipe = [];

        let recipelist = JSON.parse(localStorage.getItem("newRecipe"));
        console.log(recipelist);
        const varitiesType = recipelist.filter((h)=> h.Varities == "Veg");
        for (i = 0; i < recipelist.length; i++) {
            recipe.push(varitiesType[i]);
            console.log(recipe);
        }

        for (let i = 0; i < recipe.length; i++) {
            let div_recipe = document.createElement("div");
            div_recipe.classList.add("recipe");
            let recipe_img = document.createElement("img");
            recipe_img.classList.add("recipe-img");
            recipe_img.setAttribute("height", "300px")
            recipe_img.setAttribute("width", "500px")

            let recipe_about = document.createElement("div");
            recipe_about.classList.add("about");

            let recipe_title = document.createElement("h2");
            recipe_title.classList.add("recipe-title");

            let recipe_description = document.createElement("p");
            recipe_description.classList.add("recipe-description");

            let detail_btn = document.createElement("a");
            detail_btn.classList.add("detailBtn");

            recipe_img.src = recipe[i].image_url;
            recipe_title.textContent = recipe[i].h2_cardtitle;
            recipe_description.textContent = recipe[i].message;
            detail_btn.href = "details.html?id=" + recipe[i].recipe_id;
            detail_btn.innerText = "Get Details"

            div_recipe.appendChild(recipe_img);
            recipe_about.appendChild(recipe_title);
            recipe_about.appendChild(recipe_description);
            recipe_about.appendChild(detail_btn);
            div_recipe.appendChild(recipe_about);

            console.log(div_recipe);
            document.querySelector(".all-recipe").append(div_recipe);
        }
    </script>
    --%>
</body>

</html>