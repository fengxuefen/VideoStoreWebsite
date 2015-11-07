package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SearchDAO {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public void getConn(){
		Context initCtx;
		try {
			
			initCtx = new InitialContext();
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
	public String getMovieByTitle(String title){
		String[] titles = title.split(" ");
		if(titles.length == 0) return "";
		String movies ="";
		try {
			this.getConn();
			String sql = "select * from movies where ";
			for(int i = 0; i <titles.length-1; i++){
				if(i != 0)
					sql += " and ";
				sql += " title like '%"+ titles[i] +"%'";
			}
			if(titles.length != 1) sql+=" and ";
			sql += "  match(title) against ('" + titles[titles.length-1] +"*' in boolean mode)";
			System.out.println(sql);
			ps=ct.prepareStatement(sql);
			rs=ps.executeQuery();
			movies = "[";
			while(rs.next()){
				movies += "{\"value\" : \"";
				movies += rs.getString(2);
				movies += "\",";
				movies += "\"label\" : \"";
				movies += rs.getString(2);
				movies += "\"}";
				if(!rs.isLast())
					movies += ",";
			}
			movies += "]";
		} catch (Exception e) {
			
			e.printStackTrace();
		} finally{
			this.close();
		}
		return movies;
	}  
}
