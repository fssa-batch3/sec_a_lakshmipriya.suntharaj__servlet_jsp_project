package com.fssa.recipeApp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Comment;
import com.fssa.recipe.model.User;
import com.fssa.recipe.service.CommentService;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class CommentCreationCheck
 */
@WebServlet("/CommentCreationCheck")
public class CommentCreationCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		
		String Userid = request.getParameter("Userid");
		User user = new User();
		UserService userService = new UserService();
	    CommentService commentService = new CommentService();
        int userid = Integer.parseInt(Userid);
        
         
        try {
	        user = userService.findUserByUserid(userid);
    } catch (ServiceException e) {
	        e.printStackTrace();
	    }
	    
		
	    String recipeIdParam = request.getParameter("recipeId");

	    if (recipeIdParam != null && !recipeIdParam.isEmpty()) {
	        try {
	            int recipeId = Integer.parseInt(recipeIdParam);
	            System.out.println("recipe id is" + recipeId);
	            String comment = request.getParameter("comments");

	            Comment comments = new Comment(user.getUserid(), recipeId, comment);

	            try {
	                if (commentService.createComment(comments)) {
	                    System.out.println("Comment added successfully");
	                    response.sendRedirect(request.getContextPath()+"/ListCommentServlet");
	                   
	                }
	            } catch (ServiceException e) {
	              
	            	
	            }
	        } catch (NumberFormatException e) {
	            System.out.println("Invalid recipeId format");
	        } 
	    } else {
	        System.out.println("RecipeId parameter is missing or empty");
	        
	    }
		
	}

}
