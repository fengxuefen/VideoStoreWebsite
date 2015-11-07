package db;

import java.util.ArrayList;

public class StarVO {
	private int id;
	private String firstname;
	private String lastname;
	private String dob;
	private String photo_url;
	private ArrayList<MovieVO> movieStarredIn;
	public ArrayList<MovieVO> getMovieStarredIn() {
		return movieStarredIn;
	}
	public void setMovieStarredIn(ArrayList<MovieVO> movieStarredIn) {
		this.movieStarredIn = movieStarredIn;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getPhoto_url() {
		return photo_url;
	}
	public void setPhoto_url(String photoUrl) {
		photo_url = photoUrl;
	}
}
