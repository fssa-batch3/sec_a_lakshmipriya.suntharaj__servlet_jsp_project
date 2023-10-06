package com.fssa.recipeApp;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/ViewDetailsServlet")
public class ViewDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ViewDetailsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recipeStr = request.getParameter("recipeId");

        if (recipeStr != null && !recipeStr.isEmpty()) {
            try {
                int recipeId = Integer.parseInt(recipeStr);
                System.out.println(recipeId);
                
                RecipeService recipeService = new RecipeService();
                Recipe recipe = recipeService.findRecipeById(recipeId);

                if (recipe != null) {
                    request.setAttribute("recipe", recipe);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendRedirect("error.jsp");
                }
            } catch (NumberFormatException e) {
               
                response.sendRedirect("error.jsp");
            } catch (ServiceException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp");
            }
        } else {
            // Handle the case where recipeId parameter is not provided
            response.sendRedirect("error.jsp");
        }
    }

}
  