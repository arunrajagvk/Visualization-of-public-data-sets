package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class publish extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		String[] harsh={"shit","hell","bloody"};
		String[] month={"January","February","March","April","May","June","July","August","September","October","November","December"};
		PrintWriter out = response.getWriter();
		String post=request.getParameter("text");
		String username=request.getParameter("username");
		Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	Statement st = null;    
	int flag=0;
	for(int i=0;i<harsh.length;i++) {
		if(post.contains(harsh[i])) {
			flag=1;		
		}	
	}
	if(flag==0) {
	try {	
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();
	ResultSet rs=st.executeQuery("select curdate()");
	rs.next();
	String postedTime=rs.getString("curdate()");
	String posted[]=postedTime.split("-");
	String resultTime=month[Integer.parseInt(posted[1])-1]+" "+posted[2]+" "+posted[0];
	st.executeUpdate("insert into post(username,post,time) values('"+username+"','"+post+"','"+resultTime+"')");
	out.println("Your Status posted");
	}
	catch(Exception ex)
	{
	ex.printStackTrace();
	}
finally {

            out.close();
        }
	}
	else {
		out.println("Abusive words has been used... post discarded");
	}	
		
}
}
