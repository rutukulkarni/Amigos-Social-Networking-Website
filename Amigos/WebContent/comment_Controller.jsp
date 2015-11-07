<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
<link rel="shortcut icon" href="images/favicon.ico" />
   
 
</head>
<body>

<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



String comment=session.getAttribute("comment").toString();
System.out.println("in comment_Controller :: comment = "+comment);
String wall_id=session.getAttribute("wall_id").toString();
System.out.println("in controller :: wall_id = "+wall_id);

String flag=session.getAttribute("flag").toString();
System.out.println("in comment_Controller :: flag = "+flag);


String uid=session.getAttribute("uid123").toString();
System.out.println("uid in controller :: "+uid);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

//Statement st1= con.creaamigosatement();
//ResultSet rs1; 
//String sql1="select * from basic_info where uid='"+uid+"')";
//rs1=st1.executeQuery(sql1);
//String name="";
//while(rs1.next())
//{
	//name=rs1.getString("username");
	
	
//}



Statement st= con.createStatement();
ResultSet rs; 
String sql="INSERT INTO comments(comment_text,w_id,commentor) VALUES ('"+comment+"','"+wall_id+"','"+uid+"')";
//String sql="INSERT into comments(comment_text) values ('"+comment+"'"); 
//where s_id=1 order by w_id desc

 st.executeUpdate(sql);


 Statement st1= con.createStatement();
 ResultSet rs1; 
 String sql1="select * from wall_posts where w_id='"+wall_id+"'";
 //String sql="INSERT into comments(comment_text) values ('"+comment+"'"); 
 //where s_id=1 order by w_id desc
int suid=0;
 int ruid=0;
 
  ResultSet rs12=st1.executeQuery(sql1);

while(rs12.next())
{
	suid=rs12.getInt("s_id");
	ruid=rs12.getInt("r_id");
}

if(flag.contentEquals("2"))
{
	response.sendRedirect("prof1.jsp");
}
else if(flag.contentEquals("1"))
	
{
response.sendRedirect("prof.jsp");	
}
 else if(flag.contentEquals("4"))
{
	response.sendRedirect("wall123.jsp");
}
else
{
response.sendRedirect("home.jsp");
}







//response.sendRedirect("prof.jsp");
}
else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>
</body>
</html>