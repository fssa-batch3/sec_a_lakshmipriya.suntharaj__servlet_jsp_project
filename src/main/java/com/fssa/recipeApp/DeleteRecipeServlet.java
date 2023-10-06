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
 * Servlet implementation class DeleteRecipeServlet
 */
@WebServlet("/DeleteRecipeServlet")
public class DeleteRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteRecipeServlet() {
        super();
        
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
        PrintWriter out = response.getWriter();
        
        RecipeService recipeService = new RecipeService();

        try {
            recipeService.deleteRecipe(recipeId);
            out.println("<h1>Successfully Deleted the recipe</h1>");
            response.sendRedirect("MyRecipeSCardervlet");
        } catch (ServiceException e) {
            out.println("Error: " + e.getMessage());
          
        } catch (ClassNotFoundException e) {
            out.println("Error: An internal error occurred.");
            e.printStackTrace();
        }
    }
}
