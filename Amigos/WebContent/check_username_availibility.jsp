<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 
String uname=request.getParameter("uname");
System.out.println("uname in check_username = "+uname);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
String sql= "select * from basic_info where username='"+uname+"'";
ResultSet rs=st.executeQuery(sql);
String getname="";
while(rs.next())

{
	getname=rs.getString("username");
	System.out.println("GETNAME = "+getname);
}
System.out.println("GETNAME = "+getname);

if(getname=="")
{
System.out.println("in null if part");
session.setAttribute("uname_available","available");
}

else
{
	System.out.println("in else part");
	session.setAttribute("uname_available","unavailable");
}
session.setAttribute("flag","1");
session.setAttribute("username_check",uname);
response.sendRedirect("Sign_Up.jsp?");
%>


</body>
</html>