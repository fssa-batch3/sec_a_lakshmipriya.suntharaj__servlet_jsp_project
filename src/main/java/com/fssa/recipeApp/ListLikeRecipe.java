package com.fssa.recipeApp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.recipe.model.Recipe;
import com.fssa.recipe.model.User;
import com.fssa.recipe.service.LikeService;
import com.fssa.recipe.service.RecipeService;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/ListLikeRecipe")
public class ListLikeRecipe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("loggedInEmail");
        UserService userService = new UserService();
        User user = new User();

        try {
            user = userService.findUserByEmail(email);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        LikeService likeService = new LikeService();

        try {
            
            List<Integer> likedRecipeIds = likeService.getLikedRecipes(user.getUserid());

            RecipeService recipeService = new RecipeService();
            List<Recipe> likedRecipes = new ArrayList<>();

            for (int recipeId : likedRecipeIds) {
                Recipe recipe = recipeService.getRecipeById(recipeId);
                if (recipe != null) {
                    likedRecipes.add(recipe);
                }
            }

            
            request.setAttribute("likes", likedRecipes);

            request.getRequestDispatcher("list-likedrecipe.jsp").forward(request, response);
        } catch (ServiceException e) {
            e.printStackTrace();
            
        }
    }
}
