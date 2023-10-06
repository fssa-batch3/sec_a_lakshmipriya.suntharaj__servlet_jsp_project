package com.fssa.recipeApp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.User;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/UserUpdateServlet")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String userName = request.getParameter("name");
		
	
		
		UserService userService = new UserService();
		// check the userID , give valid details
		 User user1 = new User( email,userName);
		try {
			userService.updateUser(user1, email);
			// out.println("Successfully Updated the user");
			 response.sendRedirect("user_home.jsp");
		}catch (ServiceException e) {
	        	String msg = e.getMessage();
				String[] error = msg.split(":");
				response.sendRedirect("user_update.jsp?error="+error[1]+"&email="+email);
				
	        }
	}


}
