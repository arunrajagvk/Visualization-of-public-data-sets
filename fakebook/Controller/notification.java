package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class notification extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		
		String username=request.getParameter("username");
		Connection conn = null;
		String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
		Statement st = null,st1=null,st2=null,st3=null,st4=null;   
		ResultSet rs=null,rs1=null,rs2=null,rs3=null,rs4=null; 
		int count=0,count1=0;
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(connectionURL, "root", "ssn");
			st = conn.createStatement();
			st1 = conn.createStatement();
			st2 = conn.createStatement();

			st3 = conn.createStatement();


	
			rs3=st3.executeQuery("select count(*) as count from likes where username='"+username+"'");
	
			rs3.next();
			st4 = conn.createStatement();


	
			rs4=st4.executeQuery("select count(*) as count from friend where username='"+username+"'");
	
			rs4.next();
	


	

			rs=st.executeQuery("select * from notification where username='"+username+"'");	
			while(rs.next()) {
				count++;	
			}
			rs1=st1.executeQuery("select * from pendingRequest where friendname='"+username+"'");	
			while(rs1.next()) {
				count1++;	
			}
			rs2=st2.executeQuery("select count(*) as count from post where username='"+username+"'");
	
			rs2.next();
			int count2=rs2.getInt("count");
			int count3=rs3.getInt("count");
			int count4=rs4.getInt("count");
			out.println(count+"-"+count1+"-"+count2+"-"+count3+"-"+count4);

		}
		catch(Exception ex)
		{

		}
		
		
	}
}
