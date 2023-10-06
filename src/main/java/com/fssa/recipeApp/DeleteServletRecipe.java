package com.fssa.recipeApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class DeleteServletRecipe
 */
@WebServlet("/DeleteServletRecipe")
public class DeleteServletRecipe extends HttpServlet {
	  private static final long serialVersionUID = 1L;
		
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Get the design ID from the request parameter
	        int recipeId = Integer.parseInt(request.getParameter("recipeId"));
	        
	        // Set the response content type to HTML
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter();
	        out.println("<html><body>");
	        
	       
	        RecipeService Recipeservice = new RecipeService();
	        
	        try { 
	            boolean deleted = Recipeservice.deleteRecipe(recipeId);
	            
	            if (deleted) {
	                out.println("<h1>Recipe successfully deleted.</h1>");
	               
	                response.getWriter().write("Recipe with ID " + recipeId + " was deleted successfully.");
	            } else {
	               
	                response.getWriter().write("Recipe with ID " + recipeId + " was not found or deletion failed.");
	            }
	        } catch (ServiceException | ClassNotFoundException e) {
	           
	            e.printStackTrace();
	            response.getWriter().write("An error occurred while deleting the recipe.");
	        }
	    }
	}