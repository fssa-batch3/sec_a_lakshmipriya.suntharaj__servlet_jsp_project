package com.fssa.recipeApp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/SearchRecipeByNameServlet")
public class SearchRecipeByNameServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String searchQuery = request.getParameter("search");

        if (searchQuery != null && !searchQuery.isEmpty()) {
            try {
                RecipeService recipeService = new RecipeService();
                List<Recipe> searchResults = recipeService.searchRecipesByName(searchQuery);
                request.setAttribute("recipes", searchResults);
                request.getRequestDispatcher("card.jsp").forward(request, response);
            } catch (ServiceException e) {
                // Log the exception for debugging
                e.printStackTrace();

                // Set an error message and redirect to an error page
                request.setAttribute("errorMessage", "An error occurred while searching for recipes.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            // Handle the case where no search query is provided
            request.setAttribute("errorMessage", "Please enter a search query.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
