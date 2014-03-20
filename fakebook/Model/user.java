package Model;
import java.sql.*;
public class user {

public String getImage(String user ) {
	Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
	
	Statement st = null;    
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();


	
	rs=st.executeQuery("select * from user where username='"+user+"'");
	
	rs.next();
	return rs.getString("imageLocation");

}
catch(Exception ex)
{
return "-1";
}
	
}
public String getLatitude(String user) {
	Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	Statement st = null;
	Statement st1 = null;    
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();
	st1 = conn.createStatement();
	rs1=st1.executeQuery("select * from user where username='"+user+"'");
	rs1.next();
	String country=rs1.getString("country");
		rs=st.executeQuery("select * from country where country='"+country+"'");
	rs.next();
	return rs.getString("latitude");

}
catch(Exception ex)
{
return "1.0";
}
	
}
public String getLongitude(String user) {
	Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
	ResultSet rs1 = null;
	Statement st = null;
	Statement st1 = null;    
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();
	st1 = conn.createStatement();
	rs1=st1.executeQuery("select * from user where username='"+user+"'");
	rs1.next();
	
	String country=rs1.getString("country");
		rs=st.executeQuery("select * from country where country='"+country+"'");
	rs.next();
	return rs.getString("longitude");

}
catch(Exception ex)
{
return "1.0";
}
	
}

public ResultSet getFriend(String user) {
		Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
	
	Statement st = null;    
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();


	
	rs=st.executeQuery("select * from friend where username='"+user+"'");
	
	return rs;

}
catch(Exception ex)
{
return rs;
}
	
}








}
