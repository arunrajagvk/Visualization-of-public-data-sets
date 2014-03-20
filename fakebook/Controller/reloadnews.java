package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class reloadnews extends HttpServlet{
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
	ResultSet rs1 = null;
	
	Statement st1 = null;   
	st1 = conn.createStatement();
		String friendname=rs.getString("friendname");
	rs1=st1.executeQuery("select * from post where username='"+friendname+"'");
	while(rs1.next()) {
	ResultSet rs2=null,rs3=null;
	
	Statement st2=null,st3=null;  
	st2 = conn.createStatement();
	st3 = conn.createStatement();

	String friend=rs1.getString("username");
	String time=rs1.getString("time");
	String post=rs1.getString("post");
	int postId=rs1.getInt("postId");
	rs2=st2.executeQuery("select * from user where username='"+friend+"'");
	
	rs2.next();
	String image=rs2.getString("imageLocation");
	count+=friend+"-"+time+"-"+image+"-"+post+"-"+postId+"-";

	rs3=st3.executeQuery("select * from likes where postId="+postId+"");
	int flag=0;
	while(rs3.next()) {
	if(username.equals(rs3.getString("username"))) {
	flag=1;
}
	count+=rs3.getString("username")+"-";
	}
	if(flag==1) {
		count+="@"+"yes"+"#";
	}
	else {
		count+="@"+"no"+"#";
	}
		
		rs2.close();
		rs3.close();
		
		st2.close();
		st3.close();
		}
		rs1.close();
		st1.close();
		}
out.println(count);
}
catch(Exception ex)
{
out.println("exception");
}

}
}
