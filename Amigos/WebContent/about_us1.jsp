<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
      <link rel="stylesheet" href="style.css" />
</head>
<body>



 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">




<div class="post" style="left:300px;width:800px;">

<center>
<font face="Palatino Linotype" size="6em" color="#3D2729">
<b><u>
About Us
</u>
</b>
</font>
</center>

<br>

<font face="Palatino Linotype" size="5em" color="#F6B300">
<b>The fastest, simplest way to stay close to everything you care about.</b>
</font>
<br>
<div style="border-bottom:1px solid white">
<br><br>
<font face="Palatino Linotype" size="5em" color="#F6B300"><b>An information network</b></font>
<font face="Palatino Linotype" size="4em" color="#3D2729"><br>
Amigos is a real-time information network that connects you to the latest stories, ideas,opinions and news about
 what you find interesting. Simply find the accounts you find most compelling and follow the conversations.<br>
</font><br>
<br>
</div>

<div style="border-bottom:1px solid white">
<br><br>
<font face="Palatino Linotype" size="5em" color="#F6B300"><b>Posts</b></font><br>
<font face="Palatino Linotype" size="4em" color="#3D2729">
At the heart of amigos are small bursts of information called Posts.Each Tweet is 140 characters long,<br>
 but don€™t let the small size fool you ,€”you can discover a lot in a little space. You can see photos, videos 
 and conversations directly in Tweets to get the whole story at a glance, and all in one place. See it in action.<br>
 </font>
 <br><br>
 
 </div>
 
 <div style="border-bottom:1px solid white">

<br><br>
<font face="Palatino Linotype" size="5em" color="#F6B300"><b>Data Usage</b></font><br>
<font face="Palatino Linotype" size="4em" color="#3D2729">
 You don€™t have to build a web page to surf the web, and you don€™t have to  post to enjoy Amigos. <br>
 Whether you update 100 times a day or never, you still have access to the voices and information surrounding all that 
 interests you. You can contribute, or just listen in and retrieve up-to-the-second information. Visit fly.amigos.com to 
 learn more about what€™s yours to discover.<br>
 </font><br>
<br>
</div>

<div style="border-bottom:1px solid white">
<br><br>
<font face="Palatino Linotype" size="5em" color="#F6B300">
<b>Amigos for Business</b></font><br>
<font face="Palatino Linotype" size="4em" color="#3D2729">
Amigos connects businesses to customers in real time€ and businesses use amigos to quickly share information with people 
interested in their products and services using Advertisements,and build relationships with customers, partners and influencers.
 From brand lift to CRM to direct sales, amigos offers businesses an easy way to reach an engaged audience.<br> 
</font>
</div>

<%
		
		if(!session.isNew())
		{
			
			%>
			
			<a href="login.jsp" class="button">Go To Login</a>
			<%
		}
		else
		{
			
			%>
			
			<a href="home.jsp" class="button">Go To Home</a>
			<%
		}


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