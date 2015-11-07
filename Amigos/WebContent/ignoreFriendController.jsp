<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
</head>
<body>
<%


System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);

System.out.println("uid in ignore controller="+uid);

String sender_id1=request.getParameter("sender_id");
int sender_id=Integer.parseInt(sender_id1);

System.out.println("....="+uid);

System.out.println("sender_id in ignore controller is:="+sender_id);

String sql="delete from friend_request where sender_uid="+uid+" and reciever_uid="+sender_id+" or sender_uid="+sender_id+" and reciever_uid="+uid;
System.out.println(sql);

st.executeUpdate(sql);

response.sendRedirect("confirm_friend.jsp");
}
else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else









%>

</body>
</html>