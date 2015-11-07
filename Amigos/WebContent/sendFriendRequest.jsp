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



Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st3=con.createStatement();


//String user_id = session.getAttribute("uid").toString();
String user_id = session.getAttribute("uid123").toString();

String friend_uid1=request.getParameter("friend_uid");
String friend_type=request.getParameter("friend_type");
//String friend_uid11=request.getAttribute("friend_uid123").toString();

System.out.println("friend uid in controller is: "+friend_uid1);

System.out.println("friend type in controller is: "+friend_type);

String type=null;
if(friend_type.matches("1"))
{
	type="personal";
}
else
	if(friend_type.matches("2"))
	{
		type="professional";
	}
	else
	{
		type="both";
	}
st3.executeUpdate("insert into friend_request(sender_uid,reciever_uid,status,type) values ("+Integer.parseInt(user_id)+","+friend_uid1+",0,'"+type+"')");
response.sendRedirect("prof2.jsp?searchUid="+friend_uid1);
%>

<p> friend request sent..  :)

</body>
</html>
