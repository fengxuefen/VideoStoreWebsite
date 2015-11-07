package db;

import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.*;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.*;

public class MovieDAO {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public void getConn(){
		Context initCtx;
		try {
			
			initCtx = new InitialContext();
			if (initCtx == null) 
				System.out.println ("initCtx is NULL");
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
	        if (envCtx == null) 
	        	System.out.println ("envCtx is NULL");
				
		       // Look up our data source
		    DataSource ds = (DataSource) envCtx.lookup("jdbc/TestDB");
			if (ds == null)
				System.out.println ("ds is null.");
		      
			ct = ds.getConnection();
			if (ct == null)
		        System.out.println ("dbcon is null.");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if (ct != null) {
				ct.close();
				ct = null;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public int getPageCount(String arg, int pageSize, String method){
		int rowCount=0;
		int pageCount=0;
		try {
			this.getConn();
			if(method.equals("title"))
				ps=ct.prepareStatement("SELECT count(*) FROM movies WHERE title LIKE '"+arg+"%';");
			else
				ps=ct.prepareStatement("SELECT count(*) FROM genres_in_movies WHERE genre_id =(select id from genres where name= '"+arg+"')");
			rs =ps.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}
			if (rowCount % pageSize == 0) {
				pageCount = rowCount / pageSize;
			} else {
				pageCount = rowCount / pageSize + 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return pageCount;
	}
	
	public ArrayList<MovieVO> getMovieByPage(int pageSize, int pageNow, String order, String arg, String method){
		ArrayList<MovieVO> al=new ArrayList<MovieVO>();
	
		try {
			this.getConn();
			String ordercolumn=order.substring(0,1);
			if(ordercolumn.equals("t")){
				ordercolumn="title";
			}else{
				ordercolumn="year";
			}
			String orderby=order.substring(2);
		//	System.out.println("SELECT * FROM movies WHERE title LIKE '"+arg+"%' ORDER BY "+ordercolumn+" "+orderby+" LIMIT "+pageSize+" OFFSET "+(pageNow-1)*pageSize+";");
			if(method.equals("title"))
				ps=ct.prepareStatement("SELECT * FROM movies WHERE title LIKE '"+arg+"%' ORDER BY "+ordercolumn+" "+orderby+" LIMIT "+pageSize+" OFFSET "+(pageNow-1)*pageSize+";");
			else{
//				System.out.println("SELECT * FROM movies WHERE genre = '"+arg+"%' ORDER BY "+ordercolumn+" "+orderby+" LIMIT "+pageSize+" OFFSET "+(pageNow-1)*pageSize+";");
				ps=ct.prepareStatement("SELECT m.* FROM genres_in_movies r, movies m, genres g WHERE g.name='"+arg+"' AND g.id=r.genre_id AND m.id=r.movie_id ORDER BY "+ordercolumn+" "+orderby+" LIMIT "+pageSize+" OFFSET "+(pageNow-1)*pageSize+";");
				}
				rs=ps.executeQuery();
			while(rs.next()){
				MovieVO mvo=new MovieVO();
				mvo.setId(rs.getInt(1));
			
				mvo.setTitle(rs.getString(2));
				mvo.setYear(rs.getInt(3));
				mvo.setDirector(rs.getString(4));
				mvo.setBannerUrl(rs.getString(5));
				mvo.setTrailerUrl(rs.getString(6));			
				ArrayList<StarVO> stars=new StarDAO().getStars(rs.getInt(1));
				mvo.setStars(stars);
				ArrayList<GenreVO> genres=new GenreDAO().getGenres(mvo.getId()+"");
				mvo.setGenres(genres);
				al.add(mvo);
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	public ArrayList<MovieVO> getMovieByPage(int ipp, int pageNow,
			String order, String title, String year, String director,
			String fname, String lname) {
		
		ArrayList<MovieVO> al=new ArrayList<MovieVO>();
		
		try {
			this.getConn();
			String ordercolumn=order.substring(0,1);
			if(ordercolumn.equals("t")){
				ordercolumn="title";
			}else{
				ordercolumn="year";
			}
			String orderby=order.substring(2);
			String sql="SELECT * FROM movies WHERE ";
			if(!year.equals(""))
				sql+="year="+year+" AND ";
			sql+="title LIKE '%"+title+"%' AND director LIKE '%"+director+"%' AND id in (SELECT DISTINCT m.id FROM stars s, movies m, stars_in_movies r WHERE (s.id = r.star_id AND m.id = r.movie_id) AND s.last_name LIKE '%"+lname+"%' AND s.first_name LIKE '%"+fname+"%') ORDER BY "+ordercolumn+" "+orderby+" LIMIT "+ipp+" OFFSET "+(pageNow-1)*ipp+";";
		//	System.out.println("sql==="+sql);
			ps=ct.prepareStatement(sql);
				rs=ps.executeQuery();
			while(rs.next()){
				MovieVO mvo=new MovieVO();
				mvo.setId(rs.getInt(1));
				mvo.setTitle(rs.getString(2));
				mvo.setYear(rs.getInt(3));
				mvo.setDirector(rs.getString(4));
				mvo.setBannerUrl(rs.getString(5));
				mvo.setTrailerUrl(rs.getString(6));			
				ArrayList<StarVO> stars=new StarDAO().getStars(rs.getInt(1));
				mvo.setStars(stars);
				ArrayList<GenreVO> genres=new GenreDAO().getGenres(mvo.getId()+"");
				mvo.setGenres(genres);
				al.add(mvo);
			}
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return al;
	}
	
	public MovieVO getMovieByID(String id){
		MovieVO mvo=new MovieVO();
		try {
			this.getConn();
			String sql="SELECT * FROM movies WHERE id ="+id;
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				mvo.setId(rs.getInt(1));
				mvo.setTitle(rs.getString(2));
				mvo.setYear(rs.getInt(3));
				mvo.setDirector(rs.getString(4));
				mvo.setBannerUrl(rs.getString(5));
				mvo.setTrailerUrl(rs.getString(6));
				ArrayList<StarVO> stars=new StarDAO().getStars(rs.getInt(1));
				mvo.setStars(stars);
				ArrayList<GenreVO> genres=new GenreDAO().getGenres(mvo.getId()+"");
				mvo.setGenres(genres);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return mvo;
	}
	
	public int getPageCount(int ipp, String title, String year,
			String director, String fname, String lname) {
		int rowCount=0;
		int pageCount=0;
		try {
			this.getConn();
			String sql="SELECT count(*) FROM movies WHERE ";
			if(!year.equals(""))
				sql+="year="+year+" AND ";
			sql+="title LIKE '%"+title+"%' AND director LIKE '%"+director+"%' AND id in (SELECT DISTINCT m.id FROM stars s, movies m, stars_in_movies r WHERE (s.id = r.star_id AND m.id = r.movie_id) AND s.last_name LIKE '%"+lname+"%' AND s.first_name LIKE '%"+fname+"%');";
			ps=ct.prepareStatement(sql);
			rs =ps.executeQuery();
			if (rs.next()) {
				rowCount = rs.getInt(1);
			}
			if (rowCount % ipp == 0) {
				pageCount = rowCount / ipp;
			} else {
				pageCount = rowCount / ipp + 1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.close();
		}

		return pageCount;
	}
	public ArrayList<MovieVO> getMovieByStarID(String starID){
		ArrayList<MovieVO> movies=new ArrayList<MovieVO>();
		try {
			this.getConn();
			String sql="SELECT * FROM movies WHERE id IN (SELECT movie_id FROM stars_in_movies WHERE star_id="+starID+");";
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				MovieVO mvo=new MovieVO();
				mvo.setId(rs.getInt(1));
				mvo.setTitle(rs.getString(2));
				mvo.setYear(rs.getInt(3));			
				movies.add(mvo);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			this.close();
		}
		return movies;
	}  
}
