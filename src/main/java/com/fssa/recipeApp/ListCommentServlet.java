package com.fssa.recipeApp;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.Comment;
import com.fssa.recipe.service.CommentService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/ListCommentServlet")
public class ListCommentServlet extends HttpServlet {
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		super.doGet(req, resp);
	}

	private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String recipeIdStr = request.getParameter("recipeId");

        if (recipeIdStr != null && !recipeIdStr.isEmpty()) {
            try {
                int recipeId = Integer.parseInt(recipeIdStr);
                CommentService commentService = new CommentService();
                List<Comment> comments = commentService.getCommentsForRecipeIdDesc(recipeId);
                System.out.println(comments);

                request.setAttribute("comments", comments);
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid recipeId format: " + recipeIdStr);
                e.printStackTrace();
            } catch (ServiceException e) {
                request.setAttribute("error", "Error fetching or displaying Recipe data: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error", "RecipeId parameter is missing or empty.");
        } 

//        String redirectURL = "ViewDetailsServlet?recipeId=" + recipeIdStr;
//        System.out.println(redirectURL);

        RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
        dispatcher.forward(request, response);
    }
}
