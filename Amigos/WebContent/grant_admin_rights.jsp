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

<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

System.out.println("in grant admin rights.jsp!");
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();

//int flag;
int i=0;
String category[]=request.getParameterValues("username");
if(category==null)
{
	session.setAttribute("flag",0);
	%>
	<label>NO NEW USERS TO GRANT RIGHTS TO</label>
	<% 
}
else
{
	session.setAttribute("flag",1);
System.out.println("length=="+category.length);

for(i=0;i<category.length;i++)
{
	System.out.println(category[i]+"Selected");
}

String categorystring="";

for(int k=0;k<category.length;k++)
{
	categorystring+=category[k]+",";

	String sql= "update basic_info set type=1 where username='"+category[k]+"' ";

	st.executeUpdate(sql);
	System.out.println(" UPDATED TYPE FIELD OF BASIC_INFO! ");
	
} 


System.out.println("Concatenated String for users as admin is = "+categorystring);
session.setAttribute("users_as_admin",categorystring);
}
response.sendRedirect("admin.jsp?");

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>
</body>
</html>