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
function show_cost()
{
	//alert("in function");
var cost12=document.getElementById("cost").value;
//alert("cost12  = "+cost12);
if(cost12==0)
	{
	alert("enter value!");
	return false;
	
	}
else
	{
	//window.location.href="show_Controller.jsp";
	//alert("in else ahe!");
	window.location.href="show_Controller.jsp?cost="+document.getElementById("cost").value;
	//return true;
	}
}


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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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


<div class="post" style=" height:420px;width:880px; margin:0px auto;left:350px;">
<center>
<% 
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String page_slot=request.getParameter("space");
System.out.println("in show.jsp :: SLOT = "+page_slot);

String page1=session.getAttribute("pg").toString();
System.out.println("in show.jsp :: page = "+page1);
 
String type="";

if(page1=="HOME" || page1=="PROFILE")
{
	type="guaranteed";
}
else
{
	type="auctioned";
}


System.out.println("in show.jsp :: type = "+type);
session.setAttribute("type",type);
session.setAttribute("page_slot",page_slot);


%>

<br><br><br>
<font face="Palatino Linotype" size=5em color="#F6B300">
Advertisers will have to pay according to this cost.


</font><br><br><br><br>
<form action= "show_Controller.jsp" method="POST">

<font face="Palatino Linotype" size=4em color="#3D2729">
ENTER COST: </font><input type="text" style="border-radius: 5px;height:35px;width:200px;" name="cost" id="cost">
<br>
<br>
</form>
<!--  <input type="button" value="PROCEED" onclick="show()">-->
<input type="submit" value="PROCEED" class="button" style="color:#F6B300;"  onclick="return show_cost()" class="button" style="color:#F6B300">
</center>
</div>
</div>
</div>
</div>
</div>
<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else
%>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
     


</body>
</html>