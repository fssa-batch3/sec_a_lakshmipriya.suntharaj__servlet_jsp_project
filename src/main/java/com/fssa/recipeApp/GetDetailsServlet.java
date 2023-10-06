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

/**
 * Servlet implementation class GetDetailsServlet
 */
@WebServlet("/GetDetailsServlet")
public class GetDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public GetDetailsServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String recipeNameParam = request.getParameter("name");

        try {
           
            RecipeService recipeService = new RecipeService();
            Recipe recipe = recipeService.findRecipeByName(recipeNameParam);

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
    }
}
