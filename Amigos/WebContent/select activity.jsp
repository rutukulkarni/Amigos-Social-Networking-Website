<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
       
  <link rel="stylesheet" href="style.css" />
</head>
<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			
			
	 		<li><a href="admin.jsp">Go Back to Admin Page</a></li>	
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>

 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">


<div class="post" style=" width:880px; margin:0px auto;left:350px;">
<center>
<font face="Elephanta" size=5em color="#E00000">
Welcome Admin!

</font>

<br>
<br>
<br>

<form  name="select activity" action="available.jsp">

<font face="Elephanta" size=4em color="#F6B300">
Select Activity: 
</font>
	<select name="activity">
  	<option value=1>insert available space name</option>
	<option value=2>current cost for space</option>

	<br><br>
	</select>	
<br>
<br>

<font face="Elephanta" size=4em color="#F6B300">

Select Page:  
</font>
	<select name="page">
  	<option value=1>HOME</option>
	<option value=2>PROFILE</option>
	<option value=3>FRIENDS</option>

	<br><br>
	</select>
	<br>
	<br>
		
<input type="submit" class="button" style="color:#F6B300">

	
<%
//System.out.println("in select activity.jsp!");
//String friend_type=request.getParameter("friend_type");
String activity=request.getParameter("activity");
System.out.println("in select activity :: page= "+activity);

%>


</form>
</center>
</div>
</div>
</div>
</div>
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
     

</body>
</html>
