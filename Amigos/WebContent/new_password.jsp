<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="style.css" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
</head>



<body>


<div id="wrapper">
 <div id="page">

 <div id="page-bgtop">
<div id="page-bgbtm">

<div style="margin-bottom: 15px;padding: 30px 40px;border-radius: 8px;width:1000px;height:40px;background-color:#3D2729;">
<h2>
Enter your new password!!!
</h2>
</div>


<script>
function get_new_password()
{

//var ans=document.getElementById("new_password");
//window.location="/ForgotPassword/new1.jsp";
 window.location.href="new1.jsp?new_password="+document.getElementById("new_password").value;	

}
</script>



<br><br><br>
<div>


<div style="float:left">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/confirm_icon.jpg" width="200px" hieght="300px">
</div>


<div class="post" style="float:right;position:absolute; width:450px; margin:0px auto;left:500px;">
<center>



<form action="new1.jsp" method="POST?password="+ans>
<h4><font color:#F6BA00;>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<h3>New &nbsp;&nbsp;&nbsp;&nbsp;Password &nbsp;&nbsp;&nbsp;&nbsp;  <input type="password" name="new_password" id="new_password" style="border-radius: 3px;height:20px;width:150px;"></font></h4>
</h3><br>
<!--  
<h4>Confirm your new password:<input type="text" name="new_password" id="new_password" style="border-radius: 3px;height:20px;width:150px;">
</h4>
-->
<br>
<input type="submit" name="submit_new_password" value="Submit" onclick="get_new_password" class="button" style="color:#F6B300;"> 

</form>


<%


String uid = session.getAttribute("uid1").toString();
session.setAttribute("uid",uid);
//String new_password=document.getElemeentById("new_password");

%>


</center>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>