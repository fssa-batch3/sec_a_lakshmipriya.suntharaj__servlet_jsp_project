package com.fssa.recipeApp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class ListServletcard
 */
@WebServlet("/ListServletcard")
public class ListServletcard extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RecipeService recipeService = new RecipeService();
        	List<Recipe> recipes = recipeService.getAllRecipes();
            request.setAttribute("recipes",recipes);
        } catch (ServiceException | ClassNotFoundException e) {
            request.setAttribute("error", "Error fetching or displaying Recipe data: " + e.getMessage());
            e.printStackTrace();
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("card.jsp");
        dispatcher.forward(request, response);
        
//        request.getRequestDispatcher("/recipelisting.jsp").forward(request, response);
    
    }
}
