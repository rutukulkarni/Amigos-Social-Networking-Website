<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.util.*" %>



<%@page import="java.sql.*"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="additionalData.jsp" method="post"
>
<%
String uname1=request.getParameter("uname");
System.out.println(uname1);
String pwd=request.getParameter("pwd"); 
String fname1=request.getParameter("fname"); 
String lname1=request.getParameter("lname"); 
String gender=request.getParameter("gender"); 
String question=request.getParameter("question");
System.out.println("question id = "+question);
String answer=request.getParameter("ans"); 
String email=request.getParameter("email");
String country=request.getParameter("country");
String dob=request.getParameter("dob");
System.out.println("uname = "+ uname1);
System.out.println("pwd = "+ pwd);
System.out.println("fname"+fname1);
System.out.println("lname = "+lname1);
System.out.println("email = "+email);
System.out.println("answer = "+answer);


//String email=request.getParameter("email");



//---



//<%
//String name=request.getParameter("name");
//String password=request.getParameter("pass");
//String address=request.getParameter("address");
//String phone=request.getParameter("phone");
//int ph=Integer.parseInt(phone);
String connectionURL = "jdbc:mysql://localhost:3306/amigos";
Connection con=null;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connectionURL, "root", "rutuja");

Statement st= con.createStatement();
Statement st1= con.createStatement(); 
ResultSet rs; 
String sql2="set foreign_key_checks=0";
Statement st3= con.createStatement();
st3.executeUpdate(sql2);
String sql1="INSERT INTO basic_info(username,password,first_name,last_name,gender,email,question_id,answer,dob,country,p_id) VALUES ('"+uname1+"',des_encrypt('"+pwd+"'),'"+fname1+"','"+lname1+"','"+gender+"','"+email+"','"+question+"','"+answer+"','"+dob+"','"+country+"',0)";
/*Statement st1= con.creaamigosatement();
ResultSet rs1; 
String sql1="INSERT INTO  basic_info(password) VALUES (des_encrypt('"+pwd+"'))"; */
//String sql="INSERT into comments(comment_text) values ('"+comment+"'"); 
//where s_id=1 order by w_id desc

 st1.executeUpdate(sql1);
System.out.println("after insertion encryption query!");

//response.sendRedirect("additionalData.jsp?uname1="+uname1);
response.sendRedirect("additionalData.jsp?uname1="+uname1);
%>


</form>
</body>
</html>