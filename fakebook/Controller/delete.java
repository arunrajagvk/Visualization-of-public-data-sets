package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class delete extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		
		String postId=request.getParameter("postId");
	
		Connection conn = null;
		String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
		ResultSet rs = null;
	
		Statement st = null;
		Statement st1 = null;    
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(connectionURL, "root", "ssn");
			st = conn.createStatement();
			st1 = conn.createStatement();

			st.executeUpdate("delete from post where postId="+postId+"");	
			st.executeUpdate("delete from likes where postId="+postId+"");	
	
	
	
			out.println("post deleted");
		}
		catch(Exception ex)
		{

		}	
	}
}
