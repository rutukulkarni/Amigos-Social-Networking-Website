<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     
<html xmlns="http://www.w3.org/1999/xhtml
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos-FinalPayament</title>
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="menu">
	<div id="menu-wrapper">
		<ul>
			<li><a href="home.jsp">Homepage</a></li>
			<li><a href="prof.jsp">Profile</a></li>
			<li  class="current_page_item"><a href="album1.jsp">Gallery</a></li>
			<li><a href="message.jsp">Messages</a></li>
			<li><a href="#">Groups</a></li>
			<li><a href="selectAdType.jsp">Create ad!</a></li>
			<li><a href="login.jsp">Sign-Out</a>
		</ul>
	</div><br><br><br><br>
	<!-- end #menu -->
<body>
<%
String cost1=session.getAttribute("cost12").toString();
int cost=Integer.parseInt(cost1);

System.out.println("cost in cc page="+cost);

String ad_id1=session.getAttribute("ad_id3").toString();
int ad_id=Integer.parseInt(ad_id1);

System.out.println("ad_id in cc page="+ad_id);


%>

<% String pooja=request.getParameter("dc_number");
//out.println(pooja);
String parth=request.getParameter("ED");
//out.println(parth);
String part=request.getParameter("debit");


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





//out.println(part);
%>
<form action="final_payment.jsp">
<div class="post">
<label>Debit Card Number:<%=pooja %></label><br><br><br>

<label>Expiry Date:<%=parth %></label><br><br><br>


<label>Amount:Rs <%=cost %> </label><br><br><br>

<input type="submit" value="Pay" class="button_up" >
</div>
</form>
</body>
</html>