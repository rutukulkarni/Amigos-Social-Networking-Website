<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
</head>


<body>

<form name=confirmFriendPwd method="post" action="home.jsp">
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");




String my_uid = session.getAttribute("uid123").toString();
System.out.println("my uid in confirm friend controller:"+my_uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();


String friend_uid1=request.getParameter("uid");

String friendType=request.getParameter("type");

System.out.println("....="+friend_uid1);
st1.executeUpdate("insert into permanent_friend(uid,friend_id,type,res) values ("+Integer.parseInt(my_uid)+","+friend_uid1+",'"+friendType+"',0)");

st2.executeUpdate("delete from friend_request where sender_uid="+friend_uid1+" AND reciever_uid="+Integer.parseInt(my_uid));
response.sendRedirect("prof.jsp");

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