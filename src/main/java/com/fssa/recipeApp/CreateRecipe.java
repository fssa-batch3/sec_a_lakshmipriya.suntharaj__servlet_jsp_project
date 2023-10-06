package com.fssa.recipeApp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.model.User;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class CreateRecipe
 */
@WebServlet("/createrecipe")
public class CreateRecipe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("loggedInEmail");
		UserService userservice = new UserService();
		User user = new User();
		
		try {
			user = userservice.findUserByEmail(email);
		} catch (ServiceException e) {
			
			e.printStackTrace();
		}
		
		String recipename = request.getParameter("name");
		String description = request.getParameter("description");
		String ingredients = request.getParameter("ingredients");
		String instructions = request.getParameter("instructions");
		String imageUrl= request.getParameter("imageUrl");
		String Category= request.getParameter("category");
		PrintWriter out = response.getWriter();
	
		RecipeService recipeService = new RecipeService();
		Recipe recipe = new Recipe(recipename,description,ingredients,instructions,imageUrl,Category,user.getUserid());
		
		
		try {
			if(recipeService.addRecipe(recipe)) { 
				out.println("Recipe added");
		response.sendRedirect("ListRecipe");
							
			}
		} catch (ServiceException | ClassNotFoundException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			request.setAttribute("imageUrl", imageUrl);
			request.setAttribute("name", recipename);
			request.setAttribute("description", description);
			request.setAttribute("ingredients", ingredients);
			request.setAttribute("instructions", instructions);
			request.setAttribute("category", Category);
			
			
			
			RequestDispatcher patcher = request.getRequestDispatcher("useraddrecipe.jsp?error="+error[error.length-1]);
			patcher.forward(request, response);
		}
		
		
		
		
	}


}
