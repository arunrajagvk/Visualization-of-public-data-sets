package Controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;


public class validate extends HttpServlet{
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		
		PrintWriter out = response.getWriter();
		String password=request.getParameter("password");

		if(password.length()<4) {
				out.println("images/week.png");	
			}
		else if(password.length()<7) {
				out.println("images/medium.png");	
			}
		else if(password.length()>=7) {
				out.println("images/strong.png");	
			}
		
 	
		out.close();
		
}
}
