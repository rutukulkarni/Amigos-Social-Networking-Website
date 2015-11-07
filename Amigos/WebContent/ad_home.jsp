<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Advertise</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
     <link rel="stylesheet" href="style.css" />

<script>
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}

</script>

</head>
<body>

<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp">
			<img src="images/Amigos.png" alt="amigos" height="30" width="50">
			</a>
			</li>		
			<li><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			
	 			
			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li class="current_page_item"><a href="ad_home.jsp">Advertise</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>


<br>

 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">


<div id="home_content_album" style=" width:1100px; margin:0px auto;left:130px;">

<div class="post" style="height:80px">

<div>
<div style="float:left">

<h2>
<label style="font-size:32"><font face="Algerian"> Amigos for Business</font></label>
</h2>

<h3><font color="#F6B300" face="Palatino Linotype" size="4em">Your business is for your customers.<br>Build relationships with them, reach new people and drive sales using Amigos.</font></h3>
</div>

<div style="float:right">

<form  method="post" action="selectAdType.jsp">
<input type="submit" value="Create Advertisement" class="button_up">
</form>
</div>

</div>
</div>

<div class="post">
<div style="width:780px;left:180px;">

<%
session.setAttribute("cost12","50");

String uid1 = session.getAttribute("uid123").toString();

Integer uid=Integer.parseInt(uid1);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from bid where uid="+uid+" and status=1");

boolean empty=true;


int count=0;
String ad_name=null;
int cost=0;
int ad_ids=0;
int status=0;
String space_type="";
while(rs.next())
{
	//status=rs.getInt("status");
	empty=false;	
	ad_ids=rs.getInt("ad_id");
		ad_name=rs.getString("ad_name");
		space_type=rs.getString("space_type");
		System.out.println("in bid");
		cost=rs.getInt("cost");


session.setAttribute("ad_id3",ad_ids);


%>
<br>
<form action="Payment.jsp" method="post">
<% %>
<!-- <div style="width:800px;border-bottom-style:solid;border-bottom-color:#3E282A;">-->

	<div style="width:700px;height:130px;border-bottom-style:solid;border-bottom-color:#C0C0C0 ;">
<!-- <div style="float:left;font-face:Elephanta;font-size:1em;left:200px;">-->

	<div style="float:left;">
<label style="font-face:Elephanta;font-size:2em;color:#009900">CONGRATULATIONS!!!</label><br>
<br>
<label style="font-face:Elephanta;font-size:1em;">Your Advertisement </label> 

<label style="font-face:Elephanta;font-size:2em;color:#F6B300"><%=ad_name %></label>
 <label style="font-face:Elephanta;font-size:1em;"> is among top bidders with cost=<%=cost %>..</label><br>
<label style="font-face:Elephanta;font-size:1em;">Now...View your advertisement statistics by paying just RS.50.. </label><br><br>
</div>

<div style="float:right;left:600px;">
<br>
<br>
<br>
<input type="submit" value="View Statistics" class="button_up">
</div>

<br>
</div>

</form>

<%
}//end of while
	
if(empty==true)
{
%>
		<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729">Create Advertisement on Amigos and get your Advertisement Notifications here!!</label>
	
<%	
}

%>

</div>

</div>

<div class="post">
<div style="width:780px;left:180px;">

<form  method="post" action="Payment.jsp">
<%
Statement st1=con.createStatement();

String sql1="select * from register_ad where uid="+uid+" and status=1";
System.out.println(sql1);
ResultSet rs1=st1.executeQuery(sql1);

boolean empty1=true;
/*
while(rs1.)
{
empty1=false;
}

if(empty1==true)
{
*/	%>

	<%/*
}
else
{ */
String ad_name1=null;
String expiry=null;

boolean empty2=true;
while(rs1.next())
{
	empty2=false;
	ad_name1=rs1.getString("ad_name");
	expiry=rs1.getString("expiry_time");
%>

	<div style="width:700px;height:100px;border-bottom-style:solid;border-bottom-color:#C0C0C0 ;">

<br><label style="font-face:Elephanta;font-size:15px;"> Your Advertisement </label>
<label style="font-face:Elephanta;font-size:15px;color:#0000CC;text-transform:uppercase;"><b> <%=ad_name1 %></b></label>
<label style="font-face:Elephanta;font-size:15px;">is about to </label>
<label style="font-face:Elephanta;font-size:15px;color:#E00000">EXPIRE</label>
<label style="font-face:Elephanta;font-size:15px;"> on</label>
<label style="font-face:Elephanta;font-size:15px;color:#E00000"><%=expiry %>..</label>
<br>

<label style="font-face:Elephanta;font-size:15px;">Do you want to renew your ad at same price? </label>
<input type="submit" value="Renew Ad" class="button_up">

</div>
<%


}//end of expiry notif part

if(empty2==true)
{
%>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729">You have no Advertisement notifications!</label>	

<%	
}


%>



</form>



</div>
</div>
</div>
</div>
</div>
</div>
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
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