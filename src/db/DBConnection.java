package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public static void initConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
					
		} catch (ClassNotFoundException e) {			
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception{		
		String DBIP = "59.14.27.123";
		String DBID = "semi";
		String DBPW = "q1w2e3r4";
		String ConnectStr = "jdbc:oracle:thin:@"+DBIP+":1521:xe";
		Connection conn = null;		
		conn = DriverManager.getConnection(ConnectStr,DBID,DBPW);
		
		return conn;		
	}
	
}
