<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SetProfile</title>
</head>
<body>
<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String userid1 = session.getAttribute("uid").toString();
int userid=Integer.parseInt(userid1);

String albumId=request.getParameter("albumId");
String p_id=request.getParameter("p_id");

System.out.println("album id in SetProfile is:="+albumId);
System.out.println("p_id in SetProfile is:="+p_id);
System.out.println("userid in SetProfile is:="+userid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st11=con.createStatement();
Statement st111=con.createStatement();

System.out.println("p_id in SetProfile is before conn:="+p_id);

String sql11="update basic_info set p_id="+p_id+" where uid="+userid;
	st11.executeUpdate(sql11);
	System.out.println("updated!");
	
String album_name=null;
	String sql111="select * from album where album_id="+albumId;
	ResultSet rs111=st111.executeQuery(sql111);
	
	while(rs111.next())
	{
		album_name=rs111.getString("album_names");
		System.out.println("album name is:+"+album_name);
	}
	
	String temp="profile";
String sql1=("Select * from album where uid="+userid+" and album_names='profile'");
ResultSet rs=st.executeQuery(sql1);

System.out.println("p_id in SetProfile is after conn:="+p_id);

boolean empty=true;
while(rs.next())
{
	empty=false;
	
}

if(empty==true)//profile album for user does nt exist
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!doesnt match!!");
	String sql2="insert into album(uid,album_names,p_id)values('"+userid+"','profile','"+p_id+"')";
	st1.executeUpdate(sql2);
	System.out.println("inserted entry in album table when no profile was created till now!");
	

}
else
{
	if(album_name.equals(temp))
	{
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!alrdy present!");
		
	}
	else
	{
	
	String sql3="update album set p_id=concat(p_id,',','"+p_id+"') where uid="+userid+" and album_names='profile'"; 
	st2.executeUpdate(sql3);


	System.out.println("updated when user alrdy has tyacha profile album!");
	}
}
response.sendRedirect("prof.jsp");


} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>

</body>
</html>