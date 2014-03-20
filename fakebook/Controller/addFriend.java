package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class addFriend extends HttpServlet {
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		String[] month=	{"January","February","March","April","May","June","July","August","September","October","November","December"};
		PrintWriter out = response.getWriter();
		String friend=request.getParameter("friendname");
		String username=request.getParameter("username");
		String status=request.getParameter("status");
		Connection conn = null;
		String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
		Statement st = null;    
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(connectionURL, "root", "ssn");
			st = conn.createStatement();
			ResultSet rs=st.executeQuery("select curdate()");
			rs.next();
			String postedTime=rs.getString("curdate()");
			String posted[]=postedTime.split("-");
			String resultTime=month[Integer.parseInt(posted[1])-1]+" "+posted[2]+" "+posted[0];
			if(status.equals("pending")) {
				st.executeUpdate("insert into pendingRequest values('"+username+"','"+friend+"','"+resultTime+"')");
			
				out.println("Friend Request Sent");	
			}
			else {
				st.executeUpdate("insert into friend values('"+username+"','"+friend+"','"+resultTime+"')");
				st.executeUpdate("insert into friend values('"+friend+"','"+username+"','"+resultTime+"')");
				st.executeUpdate("delete from pendingRequest where username='"+friend+"' and friendname='"+username+"'");
				out.println("Friend Request Accepted");
			}
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
		finally {
		out.close();
        	}
		
		
	}
}
