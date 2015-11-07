<%@ page language="java" import="java.sql.*"  %>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page language="java" import="java.sql.*"  %>
 
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
 </head>
<body>
<% 

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



String uid1=session.getAttribute("uid").toString();
Integer uid=Integer.parseInt(uid1);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); 
System.out.println("uid:"+uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();

Statement st2=con.createStatement();
Statement st3=con.createStatement();


ResultSet rs1=st.executeQuery("select * from basic_info where uid ='" +uid+"'");
String use=null;
while(rs1.next())
{
	use=rs1.getString(2);
}
System.out.println("use is:"+use);
ResultSet rs2=st2.executeQuery("select * from event_info ");
String poo=null;
while(rs2.next())
{
	poo=rs2.getString(6);
}
System.out.println("poo:"+poo);
if (use.equals(poo)){
	ResultSet rs3=st3.executeQuery("select * from event_info ");
	while(rs3.next())
	{
	%>
		<br>Event Name: <%=rs3.getString(2) %><br>
        <br>Event Date and Time: 
         <br> <%=rs3.getString(5) %><br>
         <br>Event creator:
         <br> <%=rs3.getString(7) %><br>
   <%
   } 
}


} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>


</body>
</html>