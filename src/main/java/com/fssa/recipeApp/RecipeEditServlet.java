package com.fssa.recipeApp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/RecipeEditServlet")
public class RecipeEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the form parameters
         int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        String recipeName = request.getParameter("recipeName");
        String imageUrl = request.getParameter("imageUrl");
        String description = request.getParameter("description");
        String ingredients = request.getParameter("ingredients");
        String instructions = request.getParameter("instructions");
        String category = request.getParameter("category");
        
        // Create a Recipe object with the updated information
        Recipe updatedRecipe = new Recipe( recipeName, description, ingredients,  instructions,imageUrl,category,recipeId);      
        RecipeService recipeService = new RecipeService();
        try {
            boolean updated = recipeService.updateRecipe(updatedRecipe);

            if (updated) {
                
                request.setAttribute("message", "Recipe successfully updated");
                request.getRequestDispatcher("recipe_update.jsp").forward(request, response);
            } else {
               
                request.setAttribute("message", "Failed to update recipe");
                request.getRequestDispatcher("recipe_update.jsp").forward(request, response);
            }
        } catch (ServiceException | ClassNotFoundException e) {
            
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("recipe_update.jsp").forward(request, response);
        }
    }
}
