package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
public class login extends HttpServlet{
	
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		
		PrintWriter out=response.getWriter();
		String username;	
		Connection conn = null;
		String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
		int flag=0;
		ResultSet rs = null;
		ResultSet rs1 = null;
		Statement st = null;  
		Statement st1 = null;    
		try {	
			Class.forName("com.mysql.jdbc.Driver");
			conn= DriverManager.getConnection(connectionURL, "root", "ssn");
			st = conn.createStatement();
	
	 	if(request.getParameter("newuser")!=null) {  
			username = request.getParameter("username");
			String password = request.getParameter("password");
			String mail = request.getParameter("email");
			String imageLocation = request.getParameter("browse");
			String country = request.getParameter("country");

	
			st.executeUpdate("insert into user values('"+username+"','"+mail+"','"+password+"','images/"+imageLocation+"','"+country+"')");

			out.println("Successfuly created the account");

		}


		else {
			username = request.getParameter("username");
			if(username.equals("Admin")) {
				out.println("<script>window.location.replace('admin.jsp?username="+username+"')</script>");		
			}
			else {
	
        			String password = request.getParameter("password");
				rs=st.executeQuery("select * from user where username='"+username+"'");
	
				if(rs.next()) {
					HttpSession session=request.getSession();
				session.setAttribute("username",username);
		
				ServletContext ctx=getServletContext();
		
	
				out.println("<script>window.location.replace('index.jsp?username="+username+"')</script>");		
				}
				else {
					out.println("<script>window.alert('Invalid username and password')</script>");	
					out.println("<script>window.location.assign('login.jsp')</script>");
				}
			}

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
