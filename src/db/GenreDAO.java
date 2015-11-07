package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GenreDAO {
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
	
	public ArrayList<GenreVO> getGenres(String movieID){
		ArrayList<GenreVO> res=new ArrayList<GenreVO>();
		try {
			this.getConn();
			ps = ct.prepareStatement("select * from moviedb.genres a, moviedb.genres_in_movies b "
					+ "where b.movie_id = ? and b.genre_id = a.id");
			ps.setString(1, movieID);
			rs = ps.executeQuery();
			while (rs.next()) {
				GenreVO gvo=new GenreVO();
				gvo.setId(rs.getInt(1));
				gvo.setName(rs.getString(2));
				res.add(gvo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.close();
		}
		return res;
	}
}
