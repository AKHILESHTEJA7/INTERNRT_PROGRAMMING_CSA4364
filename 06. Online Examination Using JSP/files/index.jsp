<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
String Name;
String ans1,ans2,ans3,ans4,ans5;
int a1,a2,a3,a4,a5,Regno;
a1=a2=a3=a4=a5=0;
Connection connect=null;
Statement stmt=null;
ResultSet rs=null;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
String url = "jdbc:odbc:exam";
connect = DriverManager.getConnection(url," "," ");
if(request.getParameter("action")!=null)
{
Regno = Integer.parseInt(request.getParameter("regno"));
Name = request.getParameter("Name");
ans1 =request.getParameter("group1");
if(ans1.equals("True"))
a1=5;
else
a1=0;
ans2 = request.getParameter("group2");
if(ans2.equals("True"))
a2=0;
else
a2=5;
ans3 = request.getParameter("group3");
if(ans3.equals("True"))
a3=0;
else
a3=5;
ans4 = request.getParameter("group4");
if(ans4.equals("True"))
a4=5;
else
a4=0;
ans5 = request.getParameter("group5");
if(ans5.equals("True"))
a5=0;
else
a5=5;
int Total=a1+a2+a3+a4+a5;
stmt = connect.createStatement();
String query = " INSERT INTO mark ( " + " regno,name,marks "
+ " ) VALUES ( ' " + Regno + " ', ' " + Name + " ' , ' " +Total+ " ' )";
int result = stmt.executeUpdate(query);
stmt.close();
stmt = connect.createStatement();
query = "SELECT * FROM mark WHERE regno = " + Regno;
rs = stmt.executeQuery(query);
%>
<html><head><title>Student Mark List</title></head>
<body bgcolor=khaki>
<center>
<h2>Students Marksheet</h2>
<h3>Name of the College : JEC College of Engineering</h3>
<table border="1" cellspacing="0" cellpadding="0">
<tr>
<td><b>RegNo</b></td>
<td><b>Name</b></td>
<td><b>Marks</b></td>
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%=rs.getInt(1)%></td>
<td> <%=rs.getString(2)%></td>
<td> <%=rs.getInt(3)%></td>
</tr>
<%
}
rs.close();
stmt.close();
connect.close();
%>
</table>
</center>
<br/> <br/><br/>
<table>
<tr><td><b>Date:<%=new java.util.Date().toString() %></td></tr>
<tr><td><b>Signature: X.Y.Z. <b></td></tr>
</table>
</body>
</html>
<% } else { %>
<html>
<head><title>Online Examination</title>
</head>
<body bgcolor=lightgreen>
<center>
<h1>Online Examination</h1>
</center>
<form action="j.jsp" method="post" name="entry" >
<input type="hidden" value="list" name="action">
<hr/>
<table>
<tr>
<td><h3>Reg Number : </h3></td>
<td><input type="text" name="regno"></td>
</tr>
<tr>
<td><h3>Name : </h3></td>
<td><input type="text" name="Name" size="50"></td>
</tr>
<tr>
<td><b>Total Marks:5*5=25 </b></td>
<td></td><td></td><td></td><td><b>Time: 15 Min.</b></td>
</tr>
</table>
<hr/>
<b>1. XML enables you to collect information once and reuse it in a
variety of ways.</b><br/>
<input type="radio" name="group1" value="True">True
<input type="radio" name="group1" value="False">False<br>
<br/>
<b>2. In Modern PC there is no cache memory.</b><br/>
<input type="radio" name="group2" value="True">True
<input type="radio" name="group2" value="False">False<br>
<br/>
<b>3. JavaScript functions cannot be used to create script fragments
that can be used over and over again</b><br/>
<input type="radio" name="group3" value="True">True
<input type="radio" name="group3" value="False">False<br>
<br/>
<b>4.The DriverManager class is used to open a connection to a
database via
a JDBC driver.</b><br/>
<input type="radio" name="group4" value="True">True
<input type="radio" name="group4" value="False">False<br>
20
<br/>
<b>5. The JDBC and ODBC does not share a common parent</b><br/>
<input type="radio" name="group5" value="True">True
<input type="radio" name="group5" value="False">False<br>
<hr/>
<center>
<input type = "submit" value="Submit">
<input type = "reset" value="Clear"><br><br>
</center>
</form>
<%}%>
