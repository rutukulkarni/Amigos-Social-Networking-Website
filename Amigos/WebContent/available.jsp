<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
       
  <link rel="stylesheet" href="style.css" />


<script>
function show_type()
{
	//alert("in function");

	var selected=null;
	var input=document.getElementsByName("space");
	//alert("input = "+input);
	for(var i=0;i<input.length;i++)
		if(input[i].checked){
			selected=input[i].value;
		}
	//alert("selected = "+selected);
	if(selected==null)
	{
		 
	alert("Select SPACE!");
	
	return false;
	}
	
else
	{
	//window.location.href="show.jsp?slot="+selected.value;
	return true;
	}
	}


</script>
</head>
<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			
			
	 		<li><a href="admin.jsp">Go Back to Admin Page</a></li>	
			<li><a href="login.jsp">Sign-Out</a></li> 
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

<form action="show.jsp" method="POST">
<%
String page2=request.getParameter("page");
System.out.println("page = "+page);
session.setAttribute("page1",page);
String pg="";
if(page2.matches("1"))
{
	pg="HOME";
	%>
	
<font face="Elephanta" size=4em color="#F6B300">
	
	Select Space:
	</font> <br>
	<input type="radio" name="space" id="space" value="left_upper"><font face="Palatino Linotype" size=3em color=#3D2729">left upper</font><br><br>
	<input type="radio" name="space" id="space" value="left_lower"><font face="Palatino Linotype" size=3em color=#3D2729">left lower</font><br><br>
	<input type="radio" name="space" id="space" value="left_centre"><font face="Palatino Linotype" size=3em color=#3D2729">left centre</font><br><br>
	<% 
}
if(page2.matches("2"))
{
	pg="PROFILE";
	%>
	
<font face="Elephanta" size=4em color="#F6B300">
	
	Select Space:
	</font> <br>
	<input type="radio" name="space" id="space" value="left_upper"><font face="Palatino Linotype" size=3em color=#3D2729">left upper</font><br><br>
	<input type="radio" name="space" id="space" value="left_lower"><font face="Palatino Linotype" size=3em color=#3D2729">left lower</font><br><br>
	<input type="radio" name="space" id="space" value="left_centre"><font face="Palatino Linotype" size=3em color=#3D2729">left centre</font><br><br>
	<% 
}
if(page2.matches("3"))
{
	pg="FRIEND";
	%>
	
<font face="Elephanta" size=4em color="#F6B300">
	
	Select Space:
	</font> <br>
<input type="radio" name="space" id="space" value="left_upper"><font face="Palatino Linotype" size=3em color=#3D2729">left upper</font><br><br>
<input type="radio" name="space" id="space" value="right_upper"><font face="Palatino Linotype" size=3em color=#3D2729">right upper</font><br><br>
<input type="radio" name="space" id="space" value="right_centre"><font face="Palatino Linotype" size=3em color=#3D2729">right centre</font><br><br>
<input type="radio" name="space" id="space" value="left_lower"><font face="Palatino Linotype" size=3em color=#3D2729">left lower</font><br><br>
<input type="radio" name="space" id="space" value="right_lower"><font face="Palatino Linotype" size=3em color=#3D2729">right lower</font><br><br>
<input type="radio" name="space" id="space" value="left_centre"><font face="Palatino Linotype" size=3em color=#3D2729">left centre</font><br><br>
<% 
}


System.out.println("in available.jsp:: pg = "+pg);
session.setAttribute("pg",pg);
//session.setAttribute("slot",spac);
%>

			<input type="submit" value="ENTER AVAILABILTIY" onclick="show_type()" class="button" style="color:#F6B300">
			
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