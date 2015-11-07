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
System.out.println("in professional.jsp frnd uid= "+uid);
//session.setAttribute("userid",userid);

//session.setAttribute("fuid", uid);
//System.out.println("Session uid in professional.jsp is : "+uid+"\n");
%>
<u>
<font color="#F6B300" face="Algerian" size="5em"><b>Education :</b> </font>
</u><br>

<%
System.out.println("try marti!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1");

		Connection connection = null;

Statement statement1 = null;

ResultSet rs;
Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

statement1 = connection.createStatement();

		int uid1=Integer.parseInt(uid);
		
		System.out.println("trying with an int uid now!"+uid1);
		
String sql1="select * from advanced_professional where uid="+uid1;
rs = statement1.executeQuery(sql1);
System.out.println("after query in professional!");

System.out.println("just b4 rs!");
while(rs.next())
{	

System.out.println("just after rs!");
	
%><label for="high_school"><font color="#F6B300" face="Palatino Linotype" size="4em">High school :</font>
<font face="Palatino Linotype" size="4em" color=#F1EDE4> <%=rs.getString(2)%></font> </label><br>

<label for="College"><font color="#F6B300" face="Palatino Linotype" size="4em">College : </font>
<font face="Palatino Linotype" size="4em" color=#F1EDE4> <%=rs.getString(3)%></font> </label><br>

<label for="Univ"><font color="#F6B300" face="Palatino Linotype" size="4em">University :</font>
<font face="Palatino Linotype" size="4em" color=#F1EDE4> <%=rs.getString(4)%></font> </label><br>

<label for="yr"><font color="#F6B300" face="Palatino Linotype" size="4em">Year:</font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em"> <%=rs.getString(5)%></font> </label><br>

<u><font color="#F6B300" face="Algerian" size="5em"><b>Work:</b></font> </u><br>

<label for="Years_of_exp"><font color="#F6B300" face="Palatino Linotype" size="4em">Years of Experience : </font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em"> <%=rs.getString(6)%></font> </label><br>

<label for="Curr_job"><font color="#F6B300" face="Palatino Linotype" size="4em">Current job :</font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em">
 <%=rs.getString(7)%></font> </label><br>

<label for="skill_set"><font color="#F6B300" face="Palatino Linotype" size="4em">Skill set :</font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em"></label><br>

<label for="Exp"><font color="#F6B300" face="Palatino Linotype" size="4em">Experience :</font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em"> <%=rs.getString(9)%></font> </label><br>

<label for="achieve"><font color="#F6B300" face="Palatino Linotype" size="4em">Achievements :</font>
<font color=#F1EDE4 face="Palatino Linotype" size="4em"><%=rs.getString(10)%></font> </label><br>
    
 <%
}
%>	
</body>
</html>