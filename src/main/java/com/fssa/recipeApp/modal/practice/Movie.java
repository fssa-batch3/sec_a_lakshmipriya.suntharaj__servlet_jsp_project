package com.fssa.recipeApp.modal.practice;

public class Movie {
	private int id;
	public Movie(int id, String movieName, String director) {
		super();
		this.id = id;
		this.movieName = movieName;
		Director = director;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public String getDirector() {
		return Director;
	}
	public void setDirector(String director) {
		Director = director;
	}
	private String movieName;
	private String Director;
	
}
