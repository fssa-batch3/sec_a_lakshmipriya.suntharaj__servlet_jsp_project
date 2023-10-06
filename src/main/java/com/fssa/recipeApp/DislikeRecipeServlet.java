package com.fssa.recipeApp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fssa.recipe.model.User;
import com.fssa.recipe.service.LikeService;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class DislikeRecipeServlet
 */
@WebServlet("/DislikeRecipeServlet")
public class DislikeRecipeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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

    	
    	
        int recipeId = Integer.parseInt(request.getParameter("recipeId"));

        LikeService likeservice = new LikeService();
        try {
            boolean disliked = likeservice.disLike(user.getUserid(), recipeId);

            if (disliked) {
               
                response.sendRedirect("list-likedrecipe.jsp");
                return; 
            } else {
                
            	response.getWriter().write("Failed to dislike");
            }
        } catch (ServiceException e) {
            
            e.printStackTrace();
            response.getWriter().write("Failed to dislike");
        }
    }
}