package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class reloadnotification extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("username");
		Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	Statement st = null;   
	ResultSet rs=null; 
	String count="";
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();


	rs=st.executeQuery("select * from notification where username='"+username+"'");	
	while(rs.next()) {	
	Statement st2 = null,st1=null;   
	ResultSet rs2=null,rs1=null; 
	st1 = conn.createStatement();

	String friend=rs.getString("friendname");
	int postId=rs.getInt("postid");
	
	rs1=st1.executeQuery("select * from user where username='"+friend+"'");
	
	rs1.next();
	String image=rs1.getString("imageLocation");
		st2 = conn.createStatement();


	
	rs2=st2.executeQuery("select * from post where postId="+postId+"");
	
	rs2.next();
	String post=rs2.getString("post");

	count+=friend+"-"+image+"-"+post+"-";
	st1.close();
	rs1.close();
	st2.close();
	rs2.close();
	
	}
	out.println(count);

}
catch(Exception ex)
{
out.println("exception");
}
		
		
}
}
