package db.util;

import java.sql.*;

public class GenerateConnection {
	private static final String DATABASE_INFO_FILE_NAME = 
			"db_mysql_info.properties";
	private static final DataBaseInfo info = 
			new DataBaseInfo(DATABASE_INFO_FILE_NAME);
	
	static {
		DriverClassLoader.load(
				info.readProperties("DATABASE_DRIVER"));
	}
	
	public static Connection getConnection() {		
		String url = info.readProperties("DATABASE_URL");
		String id = info.readProperties("DATABASE_ID");
		String pw = info.readProperties("DATABASE_PASSWORD");
		
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, id, pw);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		return conn;
	}
}








