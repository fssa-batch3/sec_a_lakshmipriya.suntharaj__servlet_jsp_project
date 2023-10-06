package com.fssa.recipeApp;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fssa.recipe.model.User;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

/**
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doPost(req, resp);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
//		out.println("register");
		String userName = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
	String confirmpassword = request.getParameter("confirm-password");
		
	if (!password.equals(confirmpassword)) {
        String errorMessage = "Passwords do not match";
        request.setAttribute("error", errorMessage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register_user.jsp");
        dispatcher.forward(request, response);
        return; 
    }

		UserService userService = new UserService();
		User user1 = new User(userName, email,password);
		try {
			
				userService.registerUser(user1) ;
				response.sendRedirect("login.jsp");

//			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
//			rd.forward(request, response);
			
		} catch (ServiceException e) {
			String msg = e.getMessage();
			String[] error = msg.split(":");
			request.setAttribute("email", email);
			request.setAttribute("name", userName);
			request.setAttribute("password",password);
			request.setAttribute("confirmpassword", "error message");
			
			RequestDispatcher patcher = request.getRequestDispatcher("register_user.jsp?error="+error[1]);
			patcher.forward(request, response);
			out.print(e.getMessage());
			
		}

	}

}