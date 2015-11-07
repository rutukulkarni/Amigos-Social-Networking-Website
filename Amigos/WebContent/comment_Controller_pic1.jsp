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
System.out.println("in comment_Controller PIC :: comment = "+comment);
String pic_id=session.getAttribute("wall_id").toString();
System.out.println("in controller :: pic_id = "+pic_id);
String flag=session.getAttribute("flag").toString();
System.out.println("!!! In comment_pic cha controller .jsp :: flag"+flag);
String uid=session.getAttribute("uid123").toString();
String album_id=session.getAttribute("album_id").toString();
System.out.println("!!! In comment_pic cha controller .jsp :: album_id"+album_id);


Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st= con.createStatement();
ResultSet rs; 
String sql="INSERT INTO comment_pictures(comment_text,p_id,commentor) VALUES ('"+comment+"','"+pic_id+"','"+uid+"')";
st.executeUpdate(sql);

 	response.sendRedirect("home_try.jsp");
} // end of session wala else

%>
</body>
</html>