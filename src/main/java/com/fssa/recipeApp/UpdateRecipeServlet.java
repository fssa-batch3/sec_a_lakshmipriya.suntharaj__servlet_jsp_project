package com.fssa.recipeApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.model.User;
import com.fssa.recipe.service.RecipeService;

import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class UpdateRecipeServlet
 */
@WebServlet("/UpdateRecipeServlet")
public class UpdateRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateRecipeServlet() {
        super();
       
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String recipeId = request.getParameter("recipeId");
        
        // Check if recipeId is null or empty before parsing
        if (recipeId != null && !recipeId.isEmpty()) {
            try {
               int recipeid = Integer.parseInt(recipeId);
                String recipename = request.getParameter("name");
                String description = request.getParameter("description");
                String ingredients = request.getParameter("ingredients");
                String instructions = request.getParameter("instructions");
                String imageUrl = request.getParameter("imageUrl");
                String category = request.getParameter("category");
                RecipeService recipeService = new RecipeService();
                Recipe recipe = new Recipe(recipeid, recipename, description, ingredients, instructions, imageUrl, category);

                try {
                    recipeService.updateRecipe(recipe);
                    System.out.println("<h1>Successfully Updated the Recipe</h1>");
                    response.sendRedirect("MyRecipeSCardervlet");
                } catch (ClassNotFoundException e) {
                    e.printStackTrace();
                }
            } catch (NumberFormatException e) {
                // Handle the case where recipeId cannot be parsed as an integer
                out.println("Error: Invalid recipeId format.");
            } catch (ServiceException e) {
                out.println("Error: " + e.getMessage());
            }
        } else {
            out.println("Error: recipeId parameter is missing or empty.");
        }
    }

		
	}


