package db;

import java.sql.*;

public class ConnDB {
	private Connection ct = null;

	public Connection getConn(String userName, String password){
		try {
			Class.forName("com.mysql.jdbc.Driver");   
			String url = "jdbc:mysql://127.0.0.1/moviedb";  
			ct = DriverManager.getConnection(url, userName, password);			
		} catch (SQLException e) {
				System.out.println("Error: "+e.getErrorCode()+"; "+e.getMessage());
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return ct;
	}
}