<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     
<html xmlns="http://www.w3.org/1999/xhtml
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos-FinalPayament</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
   
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="menu">
	<div id="menu-wrapper">
		<ul>
		
				<li class="logo">
				<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			
			<li><a href="home.jsp">Homepage</a></li>
			<li><a href="prof.jsp">Profile</a></li>
			<li  class="current_page_item"><a href="album1.jsp">Gallery</a></li>
			<li><a href="message.jsp">Messages</a></li>
			<li><a href="#">Groups</a></li>
			<li><a href="selectAdType.jsp">Create ad!</a></li>
			<li><a href="logout.jsp">Sign-Out</a>
		</ul>
	</div><br><br><br><br>
	<!-- end #menu -->

<body>
<%
System.out.println("UID in credit control IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String cost1=session.getAttribute("cost12").toString();
int cost=Integer.parseInt(cost1);

System.out.println("cost in cc page="+cost);

String ad_id1=session.getAttribute("ad_id3").toString();
int ad_id=Integer.parseInt(ad_id1);

System.out.println("ad_id in cc page="+ad_id);


%>

<% 
//String a123=session.getAttribute("pooja").toString();
//int a=Integer.parseInt(a123);
//System.out.println("a in credit control="+a);
String pooja=request.getParameter("cc1_number");
//out.println(pooja);
String parth=request.getParameter("ED");
//out.println(parth);
String part=request.getParameter("credit");

if(part==null)
{
	part="visa";
}
else
{
	part="mastercard";
}

//out.println(part);


System.out.println("part in credit control = "+part);

%>
<form action="final_payment.jsp">


<div  class="post"">


<label>Credit Card Number:<%=pooja %></label><br><br><br>

<label>Expiry Date:<%=parth %></label><br><br><br>


<label>Amount:Rs <%=cost %> </label><br><br><br><br>

<input type="submit" value="Pay" class="button_up" >
</div>
<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>
</form>
</body>
</html>