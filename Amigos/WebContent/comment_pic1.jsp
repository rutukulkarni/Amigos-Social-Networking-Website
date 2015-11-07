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



System.out.println("IN COMMENT PIC.JSP!");
String wall_id12=request.getParameter("wall_id_pic");
session.setAttribute("wall_id",wall_id12);
System.out.println("p_id in comment_pic.jsp ::  = "+wall_id12);
String uid=session.getAttribute("cuid").toString();
System.out.println("uid in comment pic="+uid);
session.setAttribute("uid",uid);

String album_id=session.getAttribute("album_id").toString();
System.out.println("!!! In comment_pic.jsp :: album_id"+album_id);


String comment=request.getParameter("post");
System.out.println("POST IN COMMENT.JSP :: "+comment);
session.setAttribute("comment",comment);
response.sendRedirect("comment_Controller_pic1.jsp");
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