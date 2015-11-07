package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;


public class PrivilegeDAO {
	
	private static Connection ct = null;
	private static PreparedStatement ps = null;
	private static ResultSet rs = null;
	private static String employeeName="";
	private static String employeePass="";
	
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		login();
	}
	private static void printMenu() {
		// TODO Auto-generated method stub
		while (true) {
			System.out.println("Menu:");
			
			System.out.println("1. Grant privilege to users.");
			System.out.println("2. Revoke privilege to users.");
			System.out.println("3. Show privileges.");
			System.out.println("4. Add user.");
			System.out.println("0. Exit.");
			System.out.println("");
			System.out.println("Please enter the number:");
			
			Scanner scanner = new Scanner(System.in);
			String choose = scanner.nextLine();
			switch (Integer.parseInt(choose)) {
			case 1: {
				grantPrivilege();
				break;
			}
			case 2:
				revokePrivilege();
				break;
			case 3:
			//	addCustomer();
				break;
			case 4:
			//	delCustomer();
				break;
			
			case 0:
				System.exit(0);
			
			default:
				System.out.println("Please choose from 0-4.");
			}
		}
	}
	private static void revokePrivilege() {
		// TODO Auto-generated method stub
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			System.out.println("revoke store procedure?(Y/N)");
			boolean flag = true;
			while(flag){
				Scanner scanner = new Scanner(System.in);
				String choose = scanner.nextLine();
				switch (choose) {
				case "Y": 
					flag = false;
					System.out.println("");
					Statement myDBStm23 = ct.createStatement();
					ResultSet resultDB23 = myDBStm23.executeQuery("select * from mysql.procs_priv t where t.Routine_type = 'PROCEDURE'");
					System.out.println("List of Privileges on Stored Procedure:");
					while(resultDB23.next()){
						String spPriv = resultDB23.getString("proc_priv");
						String spName = resultDB23.getString("routine_name");
						String userName = resultDB23.getString("user");
						System.out.println("--------------------------");
						System.out.println("User Name: "+userName);
						System.out.println("Stroed Procedure Name: "+spName);
						System.out.println("Privileges: "+ spPriv);
						System.out.println("--------------------------");
					}
					System.out.println("");
					System.out.println("please input the user you want to revoke privilege:");
					Scanner sc2=new Scanner(System.in);
					String user_name2 = sc2.nextLine();
					System.out.println("please input the privilege you want to revoke privilege:");
					System.out.println("for example:insert");
					String privilege2 = sc2.nextLine();
					System.out.println("please input the resource you want to revoke privilege:");
					System.out.println("for example:add_movie");
					String resource2 = sc2.nextLine();
					Statement myDBStm221 = ct.createStatement();
					String sql2 = "revoke "+ privilege2 + " on procedure " + resource2 + " from '" + user_name2 + "'";
					myDBStm221.execute(sql2);
					break;
				case "N":
					Statement myDBStm21 = ct.createStatement();
					ResultSet resultDB21 = myDBStm21.executeQuery("select * from mysql.db t where t.Db = 'moviedb' order by t.user;");
					System.out.println("List of Privileges on Database:");
					while(resultDB21.next()){
						String database = resultDB21.getString("db");
						String user = resultDB21.getString("user");
						String priv = resultDB21.getString("select_priv").equals("Y") ? "select	" : "";;
						priv += resultDB21.getString("insert_priv").equals("Y") ? "insert	" : "";
						priv += resultDB21.getString("update_priv").equals("Y") ? "update	" : "";
						priv += resultDB21.getString("delete_priv").equals("Y") ? "delete	" : "";
						priv += resultDB21.getString("create_priv").equals("Y") ? "create	" : "";
						priv += resultDB21.getString("drop_priv").equals("Y") ? "drop	" : "";
						priv += resultDB21.getString("references_priv").equals("Y") ? "references	" : "";
						priv += resultDB21.getString("index_priv").equals("Y") ? "index	" : "";
						priv += resultDB21.getString("alter_priv").equals("Y") ? "alter	" : "";
						priv += resultDB21.getString("create_view_priv").equals("Y") ? "create_view	" : "";
						priv += resultDB21.getString("show_view_priv").equals("Y") ? "show_view	" : "";
						priv += resultDB21.getString("trigger_priv").equals("Y") ? "trigger	" : "";
						System.out.println("--------------------------");
						System.out.println("User Name: "+user);
						System.out.println("Database Name: "+database);
						System.out.println("Privileges: "+priv);
						System.out.println("--------------------------");
					}
					System.out.println("");
					Statement myDBStm2 = ct.createStatement();
					ResultSet resultDB2 = myDBStm2.executeQuery("select * from mysql.tables_priv order by user, table_name");
					System.out.println("List of Privileges on Tables:");
					while(resultDB2.next()){
						String tblPriv = resultDB2.getString("table_priv");
						String tblName = resultDB2.getString("table_name");
						String userName = resultDB2.getString("user");
						if(tblPriv != null && !tblPriv.equals("")){
							System.out.println("--------------------------");
							System.out.println("User Name: "+userName);
							System.out.println("Table Name: "+tblName);
							System.out.println("Privileges: "+tblPriv);
							System.out.println("--------------------------");
						}
					}
					System.out.println("");
					Statement myDBStm22 = ct.createStatement();
					ResultSet resultDB22 = myDBStm22.executeQuery("select * from mysql.columns_priv order by user, table_name");
					System.out.println("List of Privileges on Columns:");
					while(resultDB22.next()){
						String columnPriv = resultDB22.getString("column_priv");
						String tblName = resultDB22.getString("table_name");
						String colName = resultDB22.getString("column_name");
						String userName = resultDB22.getString("user");
						System.out.println("--------------------------");
						System.out.println("User Name: "+userName);
						System.out.println("Table Name: "+tblName);
						System.out.println("Column Name: "+colName);
						System.out.println("Privileges: "+ columnPriv);
						System.out.println("--------------------------");
					}
					System.out.println("");
					System.out.println("please input the user you want to revoke privilege:");
					Scanner sc=new Scanner(System.in);
					String user_name = sc.nextLine();
					System.out.println("please input the privilege you want to revoke privilege:");
					System.out.println("for example:insert");
					String privilege = sc.nextLine();
					System.out.println("please input the resource you want to revoke privilege:");
					System.out.println("for example:moviedb or movies or movies.id");
					String resource = sc.nextLine();
					if(resource.contains(".")){
						String[] resources = resource.split("\\.");
						Statement myDBStm211 = ct.createStatement();
						String sql = "revoke "+ privilege + " (" + resources[1] + ") on " + resources[0] + " from '" + user_name + "'";
						myDBStm211.execute(sql);
					}else if(resource.equals("moviedb")){
						Statement myDBStm211 = ct.createStatement();
						String sql = "revoke "+ privilege + " on " + resource + ".*" + " from '" + user_name + "'";
						myDBStm211.execute(sql);
					}else{
						Statement myDBStm211 = ct.createStatement();
						String sql = "revoke "+ privilege + " on " + resource + " from '" + user_name + "'";
						myDBStm211.execute(sql);
					}
					flag = false;
					break;
				default:
					System.out.println("Please choose Y/N");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		}finally{
			close();
		}
	}
	private static void grantPrivilege() {
		System.out.println("--------------------");
		System.out.println("List of Current Users:");
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			ps = ct.prepareStatement("select * from mysql.user");
			rs=ps.executeQuery();
			while(rs.next()){
				String users = rs.getString("User");				
				System.out.println(users);				
			}
			System.out.println("--------------------");
			System.out.println();
			System.out.println("Please input the user name what you want to grant privilege:");
			Scanner scanner = new Scanner(System.in);
			String username = scanner.nextLine();			
			System.out.println("Privilege Options:");
			System.out.println("1. Grant database to user.");
			System.out.println("2. Grant table to user");
			System.out.println("3. Grant column to user");
			System.out.println("4. Grant stored procedure to user");
			System.out.println("0. Cancel.");
			System.out.println();
			System.out.println("Please enter the number:");
			String choose = scanner.nextLine();
			switch (Integer.parseInt(choose)) {
			case 1:
				grantDatase(username);
				break;
			case 2:
				grantTable(username);
				break;
			case 3:
				grantColumn(username);
				break;
			case 4:
				grantSP(username);
				break;
			case 0:
				return;
				
			default:
				System.out.println("Please choose from 0-4.");
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
			return;
		}finally{
			close();
		}
		
	}
	private static void grantSP(String username) {
		// TODO Auto-generated method stub
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			
			System.out.println("----------------------");
			Statement myDBStm124 = ct.createStatement();
			ResultSet resultDB124 = myDBStm124.executeQuery("select * from mysql.proc t where t.type = 'procedure' and t.db = 'moviedb';");
			System.out.println("List of Stored Procedures: ");
			while(resultDB124.next()){
				System.out.println(resultDB124.getString("specific_name"));
			}
			System.out.println("----------------------");
			System.out.println("Please input the procedure name:");
			Scanner scanner=new Scanner(System.in);
			String proceudres = scanner.nextLine();
			boolean flag3 = true;
			String privilege3 = null;
			while(flag3){
				System.out.println("1. Execute privilege.");
				System.out.println("Please input the number :");
				privilege3 = scanner.nextLine();
				switch(Integer.parseInt(privilege3)){
				case 1:
					privilege3 = "execute";
					flag3 = false;
					break;
				default:
					System.out.println("Input error! Please input again!");
					break;
				}
			}
			Statement myDBStm142 = ct.createStatement();
			String sql3 = "grant execute on procedure moviedb." + proceudres + " to " + username + "@localhost";
			myDBStm142.execute(sql3);
			
			System.out.println("------------------------------");
			System.out.println("Congrats! Successfully grant privilege to "+username);
			System.out.println("------------------------------");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		}finally{
			close();
		}
	}
	private static void grantColumn(String username) {
		// TODO Auto-generated method stub
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			ps = ct.prepareStatement("show tables");
			rs=ps.executeQuery();
			System.out.println("----------------------");
			System.out.println("List of Tables:");		
			String tblName;
			ResultSet ColData13;
			Statement myColStm13;
			while (rs.next())
			{
				tblName = rs.getString(1);
				System.out.println("\n**Table Name:** " + tblName + "\n");
				System.out.println("Metadata about columns in this table:\n");
				
				System.out.println("--------------------");
				myColStm13 = ct.createStatement();
				// Create and execute an SQL statement to get all the column names for this table
				ColData13 = myColStm13.executeQuery("describe "+tblName);
				//myStm.close();
				while (ColData13.next())
				{
					System.out.println("Field Name: "+ColData13.getString(1));
					System.out.println("Field Type: "+ColData13.getString(2));
					System.out.println("Null Allowed? : "+ColData13.getString(3));
					System.out.println("--------------------");
				}				
				
			}	
			
			System.out.println("Please input the column name what you want to grant privilege:");
			System.out.println("For example: movies.id");
			Scanner scanner=new Scanner(System.in);
			String columnName = scanner.nextLine();
			String[] columns = columnName.split("\\.");
			boolean flag2 = true;
			Statement myDBStm123 = ct.createStatement();
			String privilege2 = null;
			while(flag2){
				System.out.println("1. Select privilege");
				System.out.println("2. Update privilege");
				System.out.println("3. Insert privilege");
				System.out.println();
				System.out.println("Please input the number: ");
				privilege2 = scanner.nextLine();
				switch(Integer.parseInt(privilege2)){
				case 1:
					privilege2 = "select";
					flag2 = false;
					break;
				case 2:
					privilege2 = "update";
					flag2 = false;
					break;
				case 3:
					privilege2 = "insert";
					flag2 = false;
					break;
				default:
					System.out.println("Input error! Please input again!");
					break;
				}
			}
			Statement myDBStm122 = ct.createStatement();
			String sql2 = "grant "+ privilege2 + " (" + columns[1] + ") on moviedb." + columns[0] + " to " + username + "@localhost";
			myDBStm122.execute(sql2);
			
			System.out.println("------------------------------");
			System.out.println("Congrats! Successfully grant privilege to "+username);
			System.out.println("------------------------------");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		} finally{
			close();
		}
	}
	private static void grantTable(String username) {
		// TODO Auto-generated method stub
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			ps = ct.prepareStatement("show tables");
			rs=ps.executeQuery();
			System.out.println("----------------------");
			System.out.println("List of Tables:");
			
			while (rs.next())
			{
				String tblName = rs.getString(1);
				System.out.println(tblName);
			}
			System.out.println("----------------------");
			System.out.println("Please input the table name what you want to grant privilege:");
			Scanner scanner =new Scanner(System.in);
			String tablename = scanner.nextLine();;
			boolean flag = true;
			
			String privilege = null;
			while(flag){
				System.out.println("1. Select privilege");
				System.out.println("2. Update privilege");
				System.out.println("3. Delete privilege");
				System.out.println("4. Insert privilege");
				System.out.println("0. Cancel.");
				System.out.println("");
				System.out.println("Please input the number:");
				privilege = scanner.nextLine();
				switch(Integer.parseInt(privilege)){
				case 1:
					privilege = "select";
					flag = false;
					break;
				case 2:
					privilege = "update";
					flag = false;
					break;
				case 3:
					privilege = "delete";
					flag = false;
					break;	
				case 4:
					privilege = "insert";
					flag = false;
					break;	
				case 0:
					return;
				default:
					System.out.println("Input error! Please input again!");
					break;
				}
			}
			
			String sql = "grant "+ privilege + " on moviedb." + tablename + " to " + username + "@localhost";
			ps=ct.prepareStatement(sql);
			ps.execute(sql);	
			System.out.println("------------------------------");
			System.out.println("Congrats! Successfully grant privilege to "+username);
			System.out.println("------------------------------");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		}finally{
			close();
		}
	}
	private static void grantDatase(String username) {
		// TODO Auto-generated method stub
		try {
			ConnDB cd = new ConnDB();
			ct = cd.getConn(employeeName,employeePass);
			ps = ct.prepareStatement("show databases");
			rs=ps.executeQuery();
			System.out.println("----------------------");
			System.out.println("List of databases:");
			while (rs.next())
			{
				String dbName = rs.getString(1);
				
				if(!dbName.endsWith("schema"))
					System.out.println(dbName);
			}
					
					System.out.println("----------------------");
					System.out.println("Please input the database name what you want to give privilege:");
					Scanner scanner=new Scanner(System.in);
					String databaseName = scanner.nextLine();
					boolean flag = true;
					Statement myDBStm111 = ct.createStatement();
					String privilege = null;
					while(flag){
						System.out.println("1. Select privilege");
						System.out.println("2. Update privilege");
						System.out.println("3. Delete privilege");
						System.out.println("4. Insert privilege");
						System.out.println("5. Create privilege");
						System.out.println("6. Drop privilege");
						System.out.println("7. References privilege");
						System.out.println("8. Index privilege");
						System.out.println("9. Alter privilege");
						System.out.println("10. Create View privilege");
						System.out.println("11. Show View privilege");
						System.out.println("12. Trigger privilege");
						System.out.println("13. All privilege");
						System.out.println("0. Cancel");
						System.out.println();
						System.out.println("Please input the number what you want to privilege:");
						privilege = scanner.nextLine();
						switch(Integer.parseInt(privilege)){
						case 1:
							privilege = "select";
							flag = false;
							break;
						case 2:
							privilege = "update";
							flag = false;
							break;
						case 3:
							privilege = "delete";
							flag = false;
							break;	
						case 4:
							privilege = "insert";
							flag = false;
							break;	
						case 5:
							privilege = "create";
							flag = false;
							break;	
						case 6:
							privilege = "drop";
							flag = false;
							break;
						case 7:
							privilege = "references";
							flag = false;
							break;
						case 8:
							privilege = "index";
							flag = false;
							break;	
						case 9:
							privilege = "alter";
							flag = false;
							break;	
						case 10:
							privilege = "create view";
							flag = false;
							break;	
						case 11:
							privilege = "show view";
							flag = false;
							break;
						case 12:
							privilege = "trigger";
							flag = false;
							break;
						case 13:
							privilege = "all";
							flag = false;
							break;	
						case 0:
							return;
						default:
							System.out.println("Input error! Please input again!");
							break;
						}
					}
					String sql = "grant "+ privilege + " on "+databaseName+".* to " + username + "@localhost";
					myDBStm111.execute(sql);	
					System.out.println("------------------------------");
					System.out.println("Congrats! Successfully grant privilege to "+username);
					System.out.println("------------------------------");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		}finally{
			close();
		}
	}
	public static void close() {
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
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println("Error: "+e.getMessage());
		}
	}
	private static void login() {
		// TODO Auto-generated method stub
		Scanner scanner = new Scanner(System.in);
		boolean b = false;
		while (!b) {
			System.out.println("Please enter user name:");
			String userName = scanner.nextLine();
			System.out.println("Please enter password:");
			String password = scanner.nextLine();
			try {
				ConnDB cd = new ConnDB();
				ct = cd.getConn(userName,password);
				if(ct != null){
					employeeName=userName;
					employeePass=password;
					printMenu();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close();
			}
		}
	}
}
