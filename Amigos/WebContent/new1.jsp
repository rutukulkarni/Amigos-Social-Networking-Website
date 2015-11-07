<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
</head>
<body>


<%
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String new_password=request.getParameter("new_password");
System.out.println("In new1.jsp::new password =  " +new_password);
//String ans=request.getParameter("password");
String uid = session.getAttribute("uid1").toString();
//System.out.println("in new1.jsp ans= "+ans);
System.out.println("uid in new_password= "+uid);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 
Statement st= con.createStatement();

ResultSet rs;
//String sql="insert into basic_info (password) values ('"+new_password+" ')where uid='"+uid+"' " ;
//String sql="update basic_info set password='"+new_password"' where uid='"uid"'";

String sql="UPDATE basic_info set password=(des_encrypt('"+new_password+"')) WHERE uid='"+uid+"'";
st.executeUpdate(sql);

response.sendRedirect("login1.jsp?flag=3");



} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else






%>
</body>
</html>