package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class CreditcardDAO {
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public boolean checkValidation(String ccid, String fname, String lname, String date){
		try {
			
			this.getConn();
			ps=ct.prepareStatement("SELECT * from creditcards WHERE id=" + ccid + ";");
			rs=ps.executeQuery();
			if(!rs.next()){
				return false;
			}else{
				//System.out.println("rs.getString(4).equals(date)======"+rs.getString(4).equals(date));
				if(!rs.getString(2).equals(fname)||!rs.getString(3).equals(lname)||!rs.getString(4).equals(date))
					return false;
				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			this.close();
		}
		return false;
	}
	
	public boolean checkCreditID(String ccID) {
	
		try {
			this.getConn();
			ps = ct.prepareStatement("SELECT * from creditcards WHERE id=" + ccID + ";");
		
		rs = ps.executeQuery();
		if(rs.isBeforeFirst()){				
			
			return true;
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.close();
		}
		return false;
	}
	
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
}
