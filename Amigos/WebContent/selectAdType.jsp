<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by Free CSS Templates
http://www.freecsstemplates.org
Released for free under a Creative Commons Attribution 2.5 License

Name       : Recreation  
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130121

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript">
function checkradio()
{
var input=document.getElementsByName("adType");
//alert("adType="+input);
var selected="";
for(var i=0;i<input.length;i++)
	if(input[i].checked){
		selected=input[i].value;
	
	} 
	//alert("selected="+selected);
	if(selected=="")
		{
			alert("Select Advertisement Type!");
			return false;
		}
	else
		{
			window.location.href="showSpaces.jsp?adType="+selected;
			return true;
		}
 }

</script>
<script>
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}

</script>


</head>
<body>


<div id="menu">
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			<!-- <li><a href="#">Groups</a></li>   -->
 			
			<li>
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="50px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li  class="current_page_item"><a href="selectAdType.jsp">Advertise</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>

<div id="wrapper">
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				
					<div class="post">


<form name='myform' action="showSpaces.jsp" method="post" >

<%
%>
<h2>
<label style="font-size:32"><font face="Algerian"> Amigos for Business</font></label>
</h2>

<h3><font color="#F6B300" face="Palatino Linotype" size="4em">Your  business  is  for  your  customers. <br>Build relationships with them, reach new people and drive sales using Amigos.</font></h3>
<br><font face="Palatino Linotype" size="2em">Amigos  provides  you  an  option  of  creating  your  advertisements  in  such  a  way  that  you  know  how  many  audience  you  target.</font>
<br><font face="Palatino Linotype" size="2em">Advertisement  for  inner  pages  using  Bidding  and  Frequestly  visited  pages  using  Fixed  cost  are  the  two  ways  of  advertising.</font>
<br><font face="Palatino Linotype" size="2em">To  create  advertisement..  select  one  of  the  following  categories...</font>
<br><font face="Palatino Linotype" size="2em">Auctioned :  for  adisplaying  advertisement  on  inner  pages</font>
<br><font face="Palatino Linotype" size="2em">Guaranteed :  for  displaying  advertisement  on  main  pages  such  as  Home, Profile  page</font> 


SELECT A PAGE TO DISPLAY:<BR>
<input type="radio" name="adType" value="auctioned">Auctioned..<br><br>
<input type="radio" name="adType" value="guaranteed">Guaranteed..<br><br>
		
<input type="button" value="Create your AD!" onclick="checkradio();" class="button" style="color:#F6B300">

</form>
<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);


//String adType="";
//session.setAttribute("adType", adType);
//System.out.println("adType = "+adType);

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
</div>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>