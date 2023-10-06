package com.fssa.recipeApp;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class FilterRecipeServlet
 */
@WebServlet("/FilterRecipeServlet")
public class FilterRecipeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FilterRecipeServlet() {
		super();
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String selectedCategory = request.getParameter("category");

		System.out.println("-----------------------------------------------");
		System.out.println("Selected" + selectedCategory);
		try {
			RecipeService recipeService = new RecipeService();
			List<Recipe> filteredRecipes = recipeService.listRecipesByCategory(selectedCategory);

			System.out.println("=============================================");
			System.out.println(filteredRecipes.size());
			System.out.println(filteredRecipes);
			System.out.println("=============================================");
			request.setAttribute("recipes", filteredRecipes);
			request.getRequestDispatcher("card.jsp").forward(request, response);
		} catch (ServiceException e) {

			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching filtered recipes.");
		}
	}
}
