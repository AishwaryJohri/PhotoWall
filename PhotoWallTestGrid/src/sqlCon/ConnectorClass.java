package sqlCon;

import java.sql.*;

public class ConnectorClass {
	
	static Connection con;
	
	public static Connection conn(){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/PhotoWall","root","iamthe1");
		}
		catch(Exception e)
		{}
		return con;
	}
	
}
