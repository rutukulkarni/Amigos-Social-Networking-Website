<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from bid");
int ad_id=0;
int cost=0;
String space_type=null;
while(rs.next())
{
	ad_id=rs.getInt(ad_id);
space_type=rs.getString(space_type);
cost=rs.getInt(cost);
%>


	<label>AD ID :: <%=ad_id%></label>
	<label>SPACE TYPE IS :: <%=space_type%></label>
	<label>COST IS ::: <%=cost%></label>
	
<% 	
	
} // end of while

%>
</body>
</html>