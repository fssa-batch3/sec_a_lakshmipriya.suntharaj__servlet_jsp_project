package com.fssa.recipeApp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fssa.recipe.model.Recipe;

/**
 * Servlet implementation class GetAllRecipeJsonObject
 */
@WebServlet("/GetAllRecipeJsonObject")
public class GetAllRecipeJsonObject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAllRecipeJsonObject() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//List<Recipe> Recipes = new ArrayList<Recipe> ();
		Recipe Recipe = new Recipe(0, "curd", "Delicious pasta dish with bacon and cream sauce.",
				"Pasta, Bacon, Eggs, Parmesan cheese, Cream, Garlic, Black pepper, Salt",
				"1. Cook pasta according to package instructions.\n2. In a pan, fry bacon until crispy.\n3. In a bowl, whisk eggs, grated parmesan, cream, minced garlic, black pepper, and a pinch of salt.\n4. Drain cooked pasta and add it to the pan with bacon, then turn off the heat.\n5. Pour the egg mixture over the pasta and toss until coated in the sauce.\n6. Serve immediately with extra parmesan on top.",
				"https://www.example.com/images/pasta-carbonara.jpg", "veg");
//		Recipes.add(new Recipe("curd", "Delicious pasta dish with bacon and cream sauce.",
//				"Pasta, Bacon, Eggs, Parmesan cheese, Cream, Garlic, Black pepper, Salt",
//				"1. Cook pasta according to package instructions.\n2. In a pan, fry bacon until crispy.\n3. In a bowl, whisk eggs, grated parmesan, cream, minced garlic, black pepper, and a pinch of salt.\n4. Drain cooked pasta and add it to the pan with bacon, then turn off the heat.\n5. Pour the egg mixture over the pasta and toss until coated in the sauce.\n6. Serve immediately with extra parmesan on top.",
//				"https://www.example.com/images/pasta-carbonara.jpg", "veg"));
//		Recipes.add(new Recipe("curd", "Delicious pasta dish with bacon and cream sauce.",
//				"Pasta, Bacon, Eggs, Parmesan cheese, Cream, Garlic, Black pepper, Salt",
//				"1. Cook pasta according to package instructions.\n2. In a pan, fry bacon until crispy.\n3. In a bowl, whisk eggs, grated parmesan, cream, minced garlic, black pepper, and a pinch of salt.\n4. Drain cooked pasta and add it to the pan with bacon, then turn off the heat.\n5. Pour the egg mixture over the pasta and toss until coated in the sauce.\n6. Serve immediately with extra parmesan on top.",
//				"https://www.example.com/images/pasta-carbonara.jpg", "veg"));
//		Recipes.add(new Recipe("curd", "Delicious pasta dish with bacon and cream sauce.",
//				"Pasta, Bacon, Eggs, Parmesan cheese, Cream, Garlic, Black pepper, Salt",
//				"1. Cook pasta according to package instructions.\n2. In a pan, fry bacon until crispy.\n3. In a bowl, whisk eggs, grated parmesan, cream, minced garlic, black pepper, and a pinch of salt.\n4. Drain cooked pasta and add it to the pan with bacon, then turn off the heat.\n5. Pour the egg mixture over the pasta and toss until coated in the sauce.\n6. Serve immediately with extra parmesan on top.",
//				"https://www.example.com/images/pasta-carbonara.jpg", "veg"));
		
		JSONObject recipeJson = new JSONObject(Recipe);
		PrintWriter out = response.getWriter();
		out.println(recipeJson.toString());
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
