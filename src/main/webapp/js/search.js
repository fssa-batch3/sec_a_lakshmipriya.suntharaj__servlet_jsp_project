const searchBtn = document.getElementById('search-btn');
const mealList = document.getElementById('meal');
const mealDetailsContent = document.querySelector('.meal-details-content');
const recipeCloseBtn = document.getElementById('recipe-close-btn');
const searchInput = document.getElementById('search-input');


searchBtn.addEventListener('click', searchForMeals);
mealList.addEventListener('click', getMealRecipe); 
recipeCloseBtn.addEventListener('click', () => {
    mealDetailsContent.parentElement.classList.remove('showRecipe');
});

// Function to fetch all meals when the page loads
function fetchAllMeals() {
    fetch('https://www.themealdb.com/api/json/v1/1/search.php?s=')
        .then(response => response.json())
        .then(data => displayMeals(data.meals));
}

// Function to display meals
function displayMeals(meals) {
    let html = "";
    if (meals) {
        meals.forEach(meal => {
            html += `
                <div class="meal-item" data-id="${meal.idMeal}">
                    <div class="meal-img">
                        <img src="${meal.strMealThumb}" alt="food">
                    </div>
                    <div class="meal-name">
                        <h3>${meal.strMeal}</h3>
                        <a href="#" class="recipe-btn">Get Recipe</a>
                    </div>
                </div>
            `;
        });
        mealList.classList.remove('notFound');
    } else {
        html = "Sorry, we didn't find any meal!";
        mealList.classList.add('notFound');
    }
    mealList.innerHTML = html;
}

// Function to search for meals
function searchForMeals() {
    let searchInputTxt = searchInput.value.trim();
    if (searchInputTxt === '') {
        fetchAllMeals(); // Fetch all meals when the input is empty
    } else {
        fetch(`https://www.themealdb.com/api/json/v1/1/filter.php?i=${searchInputTxt}`)
            .then(response => response.json())
            .then(data => displayMeals(data.meals));
    }
}

// Function to get recipe of the meal
function getMealRecipe(e) {
    e.preventDefault();
    if (e.target.classList.contains('recipe-btn')) {
        let mealItem = e.target.parentElement.parentElement;
        fetch(`https://www.themealdb.com/api/json/v1/1/lookup.php?i=${mealItem.dataset.id}`)
            .then(response => response.json())
            .then(data => mealRecipeModal(data.meals));
    }
}

// Function to display meal recipe in a modal
// Function to display meal recipe in a modal
function mealRecipeModal(meal) {
    meal = meal[0];
    // Split the instructions into individual steps
    const instructions = meal.strInstructions.split('\r\n');
    
    // Create an HTML list from the instructions
    let instructionsList = '<ul>';
    instructions.forEach(step => {
        if (step.trim() !== '') {
            instructionsList += `<h5>${step}</h5>`;
        }
    });
    instructionsList += '</ul>';
    
    let html = `
        <h2 class="recipe-title">${meal.strMeal}</h2>
        <p class="recipe-category">${meal.strCategory}</p>
        <div class="recipe-instruct">
            <h3>Instructions:</h3>
            ${instructionsList}
        </div>
    `;
    mealDetailsContent.innerHTML = html;
    mealDetailsContent.parentElement.classList.add('showRecipe');
}


// Fetch all meals when the page loads
window.addEventListener('load', fetchAllMeals);
