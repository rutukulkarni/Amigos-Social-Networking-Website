<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<%@ 
page import="java.sql.*"
%>
<body>
<%
String uid = session.getAttribute("frienduid").toString();
System.out.println("in personal.jsp uid= "+uid);
//session.setAttribute("userid",userid);
//session.setAttribute("uid", uid);
System.out.println("Session frnd uid in personal.jsp is : "+uid+"\n");

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

statement = connection.createStatement();

rs = statement.executeQuery("Select * from advanced_personal where uid="+Integer.parseInt(uid));

%>
<div style="color:#F1EDE4">

<%
while(rs.next())
{	
%>
<label for="hometown"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Hometown :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(2)%></font></label><br>
	<label for="religion"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Religion :</b>  </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(3)%></font> </label><br>
	<label for="relationsip_status"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Relationship status :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(4)%></font> </label><br>
	<label for="languages"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Languages :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(5)%></font> </label><br>
    <label for="music"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Music :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(6)%></font> </label><br>
    <label for="tvshow"><font color="#F6B300" face="Palatino Linotype" size="4em"><b> TV Shows :</b></font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(7)%></font> </label><br>
    <label for="Travel"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Travel :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(8)%></font> </label><br>
    <label for="sports"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Sports :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(9)%></font> </label><br>
    <label for="gadgets"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Gadgets :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(10)%></font> </label><br>
    <label for="books"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Books :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(11)%></font> </label><br>
    <label for="Shop"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Shopping :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(12)%></font> </label><br>
    <label for="other_intrst"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Other Interests :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(13)%></font> </label><br>
     <label for="abt_me"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>About Me :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(13)%></font> </label><br>
     <%
}
%>	
</div>
</body>
</html>