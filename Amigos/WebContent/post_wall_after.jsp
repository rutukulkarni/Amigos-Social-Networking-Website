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
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String wallpost=request.getParameter("wallpost");
System.out.println("wallpost retrieved = "+wallpost);

String uid_to123=session.getAttribute("uid_to").toString();
Integer uid_to=(Integer.parseInt(uid_to123));

String uid_from123=session.getAttribute("uid_from").toString();
Integer uid_from=(Integer.parseInt(uid_from123));
String s_name="";
String r_name="";

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st1=con.createStatement();
String sql1="select * from basic_info where uid="+uid_to;
ResultSet rs1=st1.executeQuery(sql1);
while(rs1.next())
{
	
	r_name=rs1.getString("username");
}

Statement st2=con.createStatement();
String sql2="select * from basic_info where uid="+uid_from;
ResultSet rs2=st2.executeQuery(sql2);
while(rs2.next())
{
	
	s_name=rs2.getString("username");
}

Statement st=con.createStatement();
String sql="insert into wall_posts (s_id,r_id,text_content,likes,dislikes,type,s_name,r_name) values ('"+uid_from+"','"+uid_to+"','"+wallpost+"',0,0,0,'"+s_name+"','"+r_name+"')";
st.executeUpdate(sql);

System.out.println("EXECUTED NEW POST WALL SUCCESSFULLY !!!!!!!!!!!!!!!!!!!!!");

Statement st5=con.createStatement();
String sql5="delete from notification where notification='"+wallpost+"' ";
st5.executeUpdate(sql5);




response.sendRedirect("home.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>


</body>
</html>