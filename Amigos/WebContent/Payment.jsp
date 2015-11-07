<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


  <title>jQuery UI Tabs - Default functionality</title>
    <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
    
    <script>
    $(function() {
        $( "#tabs" ).tabs();
     });
    </script>  
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li class="current_page_item"><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			<!-- <li><a href="#">Groups</a></li>   -->
			
			
	 			
			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li><a href="ad_home.jsp">Advertise</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>
    
</head>

<body>
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				
<div class="post" style=" width:780px; margin:0px auto;left:350px;">

<%


System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


//String ad_id=session.getAttribute("ad_id").toString();
//System.out.println("ad_id="+ad_id);


%>
<div id="tabs">

<ul>
        <li><a href="#tabs-1">Credit Card</a></li>
        <li><a href="#tabs-2">Debit card</a></li>
        
    </ul>

    
     <div id="tabs-1"> 
    <script>
 	 $("#tabs-1").load("CreditCard.jsp");
	</script>
      
    </div>   
    
    <div id="tabs-2">
    <script>
 	$("#tabs-2").load("DebitCard.jsp");
	</script>
    
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
</div>
</div>
</div>
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>

