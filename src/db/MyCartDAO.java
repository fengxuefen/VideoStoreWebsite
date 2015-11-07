package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class MyCartDAO {
	private ResultSet rs = null;
	private Connection ct = null;
	private PreparedStatement ps = null;
	private float allPrice=0.0f;
	HashMap<String, String> hm = new HashMap<String, String>();
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
	
	public float getAllPrice(){
		
		try {
			String sql = "SELECT * FROM movies where id in "; // (1,4)
			
			Iterator it = hm.keySet().iterator();
			System.out.println("hm.size======="+hm.size());
			String sub = "(";
			while (it.hasNext()) {
				String movieId = (String) it.next();
				
				if (it.hasNext()) {
					sub += movieId + ",";
				} else {
					sub += movieId + ")";
				}
			}
			sql += sub;
			if(sql.charAt(sql.length()-1)!=')'){
				sql+=")";
			}
			if(sql.substring(sql.length()-2).equals("()")){
				return 0.00f;
			}
			this.getConn();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			
			allPrice=0.0f;
			while (rs.next()) {				
				allPrice+=15.99*Integer.parseInt(this.getMovieNumById(rs.getInt(1)+""));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.close();
		}
		allPrice = (float)(Math.round(allPrice*100))/100;
		return allPrice;
	}
	
	public String getMovieNumById(String moviesId){
		return (String)hm.get(moviesId);
		
	}
	
	public void addMovies(String id, String num) {
		if(hm.containsKey(id))
			hm.put(id, (Integer.parseInt(hm.get(id))+1)+"");
		else
			hm.put(id, num);
		
	}
	
	public void delMovies(String moviesId) {
		hm.remove(moviesId);
	}
	
	public void clear() {
		hm.clear();
	}
	
	public void updatemovies(String moviesId, String newNum) {
		hm.put(moviesId, newNum);
	}
	
	public ArrayList showMyCart() {

		ArrayList al = new ArrayList();

		try {
			String sql = "SELECT * FROM movies where id in "; // (1,4)
			
			Iterator it = hm.keySet().iterator();

			String sub = "(";
			while (it.hasNext()) {
				String movieId = (String) it.next();
				
				if (it.hasNext()) {
					sub += movieId + ",";
				} else {
					sub += movieId + ")";
				}
			}
			sql += sub;
			this.getConn();
			ps = ct.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				MovieVO mvo=new MovieVO();
				mvo.setId(rs.getInt(1));
				mvo.setTitle(rs.getString(2));
				mvo.setYear(rs.getInt(3));
				mvo.setDirector(rs.getString(4));
				mvo.setBannerUrl(rs.getString(5));
				mvo.setTrailerUrl(rs.getString(6));		
				
				
				al.add(mvo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			this.close();
		}
		
		return al;
	}
	
	private void close() {
		// TODO Auto-generated method stub
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if(ct != null)
			if (!ct.isClosed()) {
				ct.close();
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
