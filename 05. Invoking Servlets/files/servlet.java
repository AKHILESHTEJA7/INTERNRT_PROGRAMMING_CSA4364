import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
public class res extends HttpServlet
{
public void doGet(HttpServletRequest req, HttpServletResponse res) throws
ServletException,IOException
{
PrintWriter out=res.getWriter();
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection conn = DriverManager.getConnection ("jdbc:odbc:library");
Statement stmt = conn.createStatement ();
int bid=Integer.parseInt(req.getParameter("id"));
ResultSet rs1=stmt.executeQuery(" select * from list where book_id = " + bid );
out.println("<html><body ><center><h1>Book Details</h1><br<br>
<table border=1><tr><th>BOOKID</th><th>BOOK Name</th><th>Author
Name</th></tr>");
16
while(rs1.next())
{
 out.println("<tr> ");
 out.print("<td> "+rs1.getInt(1)+"</td>");
 out.print("<td> "+rs1.getString(2)+"</td>");
 out.print("<td> "+rs1.getString(3)+"</td>");
 out.println("</tr> "); }
 out.println("</table></center></body></html> ");
 stmt.close();
 conn.close();
}
catch (Exception e)
{
 System.out.println("Error : "+e);
}
}
}
