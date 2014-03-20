package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class reloadfriend extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("username");
	Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
	
	Statement st = null;    
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();


	
	rs=st.executeQuery("select * from friend where username='"+username+"'");
	String count="";
	while(rs.next()) {
			Statement st1=null;   
	ResultSet rs1=null; 
	st1 = conn.createStatement();
	String friend=rs.getString("friendname");
	String time=rs.getString("time");
		rs1=st1.executeQuery("select * from user where username='"+friend+"'");
	
	rs1.next();
	String image=rs1.getString("imageLocation");
	count+=friend+"-"+image+"-"+time+"-";
	rs1.close();
	st1.close();
	}
out.println(count);
}
catch(Exception ex)
{

}

}
}
