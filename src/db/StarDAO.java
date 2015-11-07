package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StarDAO {
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
	public ArrayList<StarVO> getStars(int movieID){
		//YUAN QU
		
		ArrayList<StarVO> stars=new ArrayList<StarVO>();
		try {
			this.getConn();
			ps=ct.prepareStatement("Select distinct s.id,s.first_name,s.last_name from stars s where s.id in (select star_id from stars_in_movies where movie_id="+movieID+");");
			rs=ps.executeQuery();
			while(rs.next()){
				StarVO svo=new StarVO();
				svo.setId(rs.getInt(1));
				svo.setFirstname(rs.getString(2));
				svo.setLastname(rs.getString(3));
				ArrayList<MovieVO> ar_mvo=new MovieDAO().getMovieByStarID(svo.getId()+"");
				svo.setMovieStarredIn(ar_mvo);
				stars.add(svo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.close();
		}
		return stars;
	}
//	public String getStars(String movieId){
//		String starList = "";
//		try {
//			this.getConn();
//			ps = ct.prepareStatement("select * from moviedb.stars a, moviedb.stars_in_movies b "
//					+ "where b.movie_id = ? and b.star_id = a.id;");
//			ps.setString(1, movieId);
//			rs = ps.executeQuery();
//			while(rs.next()){
//				starList = starList + rs.getString(1) + ",";
//				starList = starList + rs.getString(2) + rs.getString(3) + ";";
//			}
//			
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		} finally{
//			this.close();
//		}
//		return starList;
//	}

	public StarVO getStarByID(String id) {
		StarVO svo=new StarVO();
		try {
			this.getConn();
			String sql="SELECT * FROM stars WHERE id ="+id;
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()){
				svo.setId(rs.getInt(1));
				svo.setFirstname(rs.getString(2));
				svo.setLastname(rs.getString(3));
				svo.setDob(rs.getString(4));
				svo.setPhoto_url(rs.getString(5));
				ArrayList<MovieVO> m=new MovieDAO().getMovieByStarID(id);
				svo.setMovieStarredIn(m);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			this.close();
		}
		return svo;
	}
}
