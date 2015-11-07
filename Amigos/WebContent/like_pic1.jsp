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
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String like_flag=session.getAttribute("like_flag").toString();
String p_id=request.getParameter("p_id");
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!p_id = "+p_id);

String uid=session.getAttribute("uid123").toString();
System.out.println("in like_pic.jsp: Session UID= "+uid);
Integer i=Integer.parseInt(p_id);
System.out.println("i= "+i);
Class.forName("com.mysql.jdbc.Driver");
Connection con=null;

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

ResultSet rs=null;
Statement st=con.createStatement();
String sql="UPDATE image_try set likes=concat(likes,',','"+uid+"'   ) WHERE p_id="+i;

System.out.println("After update query  :"+uid);

st.executeUpdate(sql);

%>

<%

if(like_flag=="0")
{
	response.sendRedirect("home_try.jsp");
}
else
{
	response.sendRedirect("prof.jsp");
}

} // end of session wala else

%>


</body>
</html>