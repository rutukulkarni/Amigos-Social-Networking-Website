<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

String flag=session.getAttribute("flag").toString();

System.out.println("IN COMMENT.JSP!");
//String comment=request.getParameter("comment1");
//String wall_comment=request.getParameter("wall_comment");
//System.out.println("wall_Comment= "+wall_comment);
//String wall_id=request.getParameter("wall_id");
//System.out.println("comment = "+comment);
//System.out.println("wall_id = "+wall_id);

//System.out.println("in comment.jsp...");

String wall_id=request.getParameter("wall_id");
System.out.println("in comment.jsp request ne wall_id="+wall_id);
//String wall_id=session.getAttribute("wall_id").toString();
//String wall_id=wall_id123+wall_id123+1;

session.setAttribute("wall_id",wall_id);
System.out.println("wall_id in comment.jsp ::  = "+wall_id);
String uid=session.getAttribute("uid").toString();
session.setAttribute("uid",uid);
System.out.println("uid in comment :: "+uid);
String comment=request.getParameter("post");
System.out.println("POST IN COMMENT.JSP :: "+comment);
session.setAttribute("comment",comment);
//String comment=request.getParameter("comment1");
//System.out.println("in comment.jsp :: comment="+comment);
response.sendRedirect("comment_Controller.jsp");
%>
<!--  
<form name="comment" action="comment_Controller.jsp" method="POST">
<input type="text" name="comment" >
<input type="submit" value="COMMENT">

</form>
-->
<%



} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>
</body>
</html>