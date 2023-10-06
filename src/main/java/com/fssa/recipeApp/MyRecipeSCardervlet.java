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
import com.fssa.recipe.model.User;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class MyRecipeSCardervlet
 */
@WebServlet("/MyRecipeSCardervlet")
public class MyRecipeSCardervlet extends HttpServlet {
	 private static final long serialVersionUID = 1L;

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	           
	            RecipeService recipeService = new RecipeService();
	          
	            String UserEmail = (String) request.getSession(false).getAttribute("loggedInEmail");
	            System.out.println(UserEmail);
	            UserService userService = new UserService(); 
	            User user = userService.findUserByEmail(UserEmail); 
	            int userId = user.getUserid();
	            
	            System.out.println("Recipe Lists for user with ID: " + userId);
	           
	            List<Recipe> recipes = recipeService.listRecipesByUserId(userId); 
	            
	            request.setAttribute("recipes", recipes);
	        } catch (ServiceException e) {
	            request.setAttribute("error", "Error fetching or displaying recipe data: " + e.getMessage());
	            e.printStackTrace();
	        }
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher("myRecipeCard.jsp");
	        dispatcher.forward(request, response);
	    }

}
