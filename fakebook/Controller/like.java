package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class like extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		String postId=request.getParameter("postId");
		String username=request.getParameter("username");
		Connection conn = null;
		String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
		Statement st = null;    
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(connectionURL, "root", "ssn");
			st = conn.createStatement();
			ResultSet rs=st.executeQuery("select * from post where postId="+postId+"");
			rs.next();
			String postOwner=rs.getString("username");
			st.executeUpdate("insert into likes values('"+username+"',"+postId+")");
	
			st.executeUpdate("insert into notification values('"+postOwner+"','"+username+"',"+postId+")");
	
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {

			    out.close();
		}
		
		
	}
}
