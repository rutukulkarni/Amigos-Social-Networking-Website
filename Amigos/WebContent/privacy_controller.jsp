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
<form action="home.jsp" method="post">
<%
System.out.println("UID IS : " + session.getAttribute("uid123"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


String privacy_friends=request.getParameter("friend");
System.out.println("in privacy controller friend selected is ::"+privacy_friends);

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);

System.out.println("in controller uid ="+uid);

	Statement st3=con.createStatement();
	String sql3="insert into privacy(uid_from,uid_to) values('"+uid+"','"+privacy_friends+"')";
	System.out.println(sql3);
	st3.executeUpdate(sql3);

	Statement st2=con.createStatement();
	String sql2="update permanent_friend set res=1 where uid='"+uid+"'and friend_id='"+privacy_friends+"' or uid='"+privacy_friends+"' and friend_id='"+uid+"'";
	System.out.println(sql2);
	st2.executeUpdate(sql2);
	
	
	
	
	
//}















/*
Statement st1=con.createStatement();



String sql1="insert into privacy(uid,friend_list) values("+uid+",'"+friend_list+"') ";
st1.executeUpdate(sql1);
*/

response.sendRedirect("home.jsp");

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else

 %>





</form>



</body>
</html>