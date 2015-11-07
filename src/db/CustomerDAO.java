package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class CustomerDAO {
	
	private Connection ct = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	public boolean login(String email, String password) throws SQLException{
		
		try {
		this.getConn();
		ps = ct.prepareStatement("select password from customers where email = '"+email+"' limit 1;");
		rs = ps.executeQuery();
		if(rs.next()){
			String dbPasswd = rs.getString(1);
			if (dbPasswd.equals(password)) {
				return true;
			}else{
				//wrong password;
				return false;
			}
		}else{
			//invalid username;
			return false;
		}
		}catch (SQLException e) {
			System.out.println("Error: "+e.getMessage());
		} finally {
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
	public boolean addCustomer(String email, String password, String address, String firstname, String lastname, String ccid) {
		// TODO Auto-generated method stub
	
		try{
			this.getConn();
			ps = ct.prepareStatement("INSERT INTO customers VALUES(null, '" + firstname
					+ "', '" + lastname + "', " + ccid + ", '" + address + "', '" + email
					+ "', '" + password + "');");
			ps.executeUpdate();		
		}catch(SQLException e){
			if (e.getMessage().contains("Duplicate entry"))
			{
				System.out.println("Error: duplicate ID.");
			}
			else
			{
				System.out.println("Error: "+e.getMessage());
			}
		}finally{
			close();
		}
		return true;
	}
}
