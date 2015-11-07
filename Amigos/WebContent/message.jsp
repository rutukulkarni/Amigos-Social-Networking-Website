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
 <link rel="shortcut icon" href="images/favicon.ico" />
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
 </head>
<body>

<% 

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String my_uid = session.getAttribute("uid").toString();
int uid=Integer.parseInt(my_uid); 

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();

ResultSet rs1=st.executeQuery("select distinct() from basic_info where uid ='" +uid+"'") ;
String use=null;
while(rs1.next())
{
	use=rs1.getString(2);
}

ResultSet rs=st.executeQuery("select * from mess_info  ");
while(rs.next())
{
	
	/*
	if(use.equals(rs.getString(4)))
	{
		System.out.println("error in converstn!!");
	}
	else
	{ */

		Statement st123=con.createStatement();

	ResultSet rs123=st123.executeQuery("select count(*) from mess_info where rid ='" +uid+"'") ;
	int count=0;
	while(rs123.next())
	{
		count=rs123.getInt(1);
	}
		
		%>
<a href="Conversation.jsp"><%=count%></a><br>

<%//} 
}
%>
<p class="links"><a href="NewMessage.jsp" class="button">New Message</a></p>
<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>



</body>
</html>