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
String uid = session.getAttribute("uid").toString();
System.out.println("in professional.jsp uid= "+uid);
//session.setAttribute("userid",userid);
session.setAttribute("uid", uid);
System.out.println("Session uid in professional.jsp is : "+uid+"\n");

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

%>

<div style="color:#F1EDE4;">

<u>
<font color="#F6B300" face="Algerian" size="5em"><b>Education :</b> </font>
</u><br>
<%

statement = connection.createStatement();

String sql123="Select * from advanced_professional where uid="+Integer.parseInt(uid);
System.out.println("In professional.jsp query = "+sql123);

rs = statement.executeQuery("Select * from advanced_professional where uid="+Integer.parseInt(uid));



while(rs.next())
{
	
System.out.println("In professional.jsp rs.getStrng(2) = "+rs.getString(2));

%>
<label for="high_school"><font color="#F6B300" face="Palatino Linotype" size="4em">High school :</font><font face="Palatino Linotype" size="4em"> <%=rs.getString(2)%></font> </label><br>

<label for="College"><font color="#F6B300" face="Palatino Linotype" size="4em">College : </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(3)%></font> </label><br>

<label for="Univ"><font color="#F6B300" face="Palatino Linotype" size="4em">University :</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(4)%></font> </label><br>

<label for="yr"><font color="#F6B300" face="Palatino Linotype" size="4em">Year:</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(5)%></font> </label><br>

<u><font color="#F6B300" face="Algerian" size="5em"><b>Work:</b></font> </u><br>

<label for="Years_of_exp"><font color="#F6B300" face="Palatino Linotype" size="4em">Years of Experience : </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(6)%></font> </label><br>

<label for="Curr_job"><font color="#F6B300" face="Palatino Linotype" size="4em">Current job :</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(7)%></font> </label><br>

<label for="skill_set"><font color="#F6B300" face="Palatino Linotype" size="4em">Skill set :</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(8)%></font> </label><br>

<label for="Exp"><font color="#F6B300" face="Palatino Linotype" size="4em">Experience :</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(9)%></font> </label><br>

<label for="achieve"><font color="#F6B300" face="Palatino Linotype" size="4em">Achievements :</font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(10)%></font> </label><br>
    
 <%
}
%>	
</div>
</body>
</html>