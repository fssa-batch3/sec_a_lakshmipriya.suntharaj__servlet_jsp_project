package com.fssa.recipeApp.servlet.practice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.fssa.recipeApp.modal.practice.Movie;

/**
 * Servlet implementation class ListMovieServlet
 */
@WebServlet("/ListMovieServlet")
public class ListMovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListMovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Movie> movie = new ArrayList<Movie> ();
		
	            Movie movie1 = new Movie(1, "jailer", "muthu");
	            Movie movie2 = new Movie(1, "Leo", "gowtham");
	            
	             String movieName = request.getParameter("movieName");
	             
	             if(movieName.equals(movie1.getMovieName())) {
	            	 movie.add(movie1);
	             }
	             if(movieName.equals(movie2.getMovieName())) {
	            	 movie.add(movie2);
	             }
	             JSONArray movieJson = new JSONArray(movie);
	     		PrintWriter out = response.getWriter();
	     		out.println(movieJson.toString());
	     		out.flush();
	     		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
