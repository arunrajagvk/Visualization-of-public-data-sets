
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Date;

import com.itextpdf.text.Document;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;
public class GeneratePDF extends HttpServlet {

	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		try {
			
						OutputStream file = new FileOutputStream(new File("/home/friends.pdf"));

			Document document = new Document();
			PdfWriter.getInstance(document, file);
			document.open();
			PrintWriter out=response.getWriter();
			
		String username;	
		Connection conn = null;
	String connectionURL = "jdbc:mysql://localhost:3306/fakebook"; 
	
	ResultSet rs = null;
		ResultSet rs1 = null;
	Statement st = null;    
		Statement st1 = null;    
		
	Class.forName("com.mysql.jdbc.Driver");
	conn= DriverManager.getConnection(connectionURL, "root", "ssn");
	st = conn.createStatement();
	st1 = conn.createStatement();
	String user=request.getParameter("username");
rs=st.executeQuery("select * from friend where username='"+user+"'");



			int i=0;
			while(rs.next()) {
				String friend=rs.getString("friendname");
				rs1=st1.executeQuery("select * from user where username='"+friend+"'");
				rs1.next(); 
				
			document.add(new Paragraph(user+" Contacts"));
			document.add(new Paragraph("CONTACT NO"+(++i)));
			document.add(new Paragraph("CONTACT NAME :"+rs1.getString("username")));
			document.add(new Paragraph("CONTACT EMAIL"+rs1.getString("email")));
			document.add(new Paragraph("CONTACT PICTURE"));
			Image img=Image.getInstance("/var/lib/tomcat7/webapps/site/"+rs1.getString("imageLocation"));		
			img.scaleAbsolute(960,638);	
			document.add(img);
			
			}
			document.close();
			file.close();
			out.println("Friends List PDF saved in home/friends.pdf");
			
		} catch (Exception e) {

			e.printStackTrace();
		}
}
	
}
