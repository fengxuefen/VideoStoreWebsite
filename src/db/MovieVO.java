package db;

import java.util.ArrayList;

public class MovieVO {
	private int id;
	private String title;
	private int year;
	private String director;
	private String bannerUrl;
	private String trailerUrl;
	private ArrayList<StarVO> stars;
	private ArrayList<GenreVO> genres; 
	
	public ArrayList<GenreVO> getGenres() {
		
		return genres;
	}
	public void setGenres(ArrayList<GenreVO> genres) {
		this.genres = genres;
	}
	public ArrayList<StarVO> getStars() {
		return stars;
	}
	public void setStars(ArrayList<StarVO> stars) {
		this.stars = stars;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	public String getTrailerUrl() {
		return trailerUrl;
	}
	public void setTrailerUrl(String trailerUrl) {
		this.trailerUrl = trailerUrl;
	}
	
}
