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

import com.fssa.recipe.model.User;
import com.fssa.recipe.service.UserService;
import com.fssa.recipe.service.exception.ServiceException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User user = new User(email, password);
		user.setEmail(email);
		user.setPassword(password);
		PrintWriter out = response.getWriter();

		UserService us = new UserService();
		if (email == null || "".equals(email)) {
			out.println("Invalid Email");

			response.sendRedirect("login.jsp?errorMessage=Invalid Email");
		}

		else if (password == null || "".equals(password) || password.length() < 8) {

			response.sendRedirect("login.jsp?errorMessage=Invalid Password");
		} else {
			System.out.println("Email and password is valid");
		}
			try {
				if (us.loginUser(user)) {
					out.println("LogIn success");
					HttpSession session = request.getSession();
					session.setAttribute("loggedInEmail", email);
					response.sendRedirect("index.jsp");
				} else {
					String error = "check your email and password.";
					request.setAttribute("email", email);
					request.setAttribute("password",password);
				
					
					RequestDispatcher patcher = request.getRequestDispatcher("login.jsp?error="+error);
					patcher.forward(request, response);
				}
			} catch (ServiceException e) {

				String msg = e.getMessage();
				String[] error = msg.split(":");
				request.setAttribute("email", email);
				request.setAttribute("password",password);
				
				RequestDispatcher patcher = request.getRequestDispatcher("login.jsp?error="+error[error.length-1]);
				patcher.forward(request, response);
			}

//			HttpSession session = request.getSession();
//			session.setAttribute("loggedInEmail", email);
//			RequestDispatcher dispatcher = request.getRequestDispatcher("home.html");
//			dispatcher.forward(request, response);
		}

	}


//}