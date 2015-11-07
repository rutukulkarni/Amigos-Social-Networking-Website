<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>


 <link rel="shortcut icon" href="images/favicon.ico" />
 <link rel="stylesheet" href="style.css" />
     <script type="text/javascript" src="jq1.js"></script>
     <script type="text/javascript" src="jq2.js"></script>
     <link rel="shortcut icon" href="images/favicon.ico" />

<script type="text/javascript">

function confirm_del(nid)
{
   var retVal = confirm("Do you want to delete this notification ?");
   if( retVal == true ){
      //alert("User wants to delete!");
      window.location.href="DeletePost.jsp?nid="+nid;
	  return true;
   }
   else{
      //alert("User does not want to delete!");
      //window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}
</script>


<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#right_sidebar_adv').load('ad_display_auc2.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds

</script>

<script type="text/javascript">
$(function(){
    $('#right_sidebar_adv').load('ad_display_auc2.jsp');
});
</script>

<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#left_sidebar_adv').load('ad_display_auc1.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
</script>

<script>

$(function(){
    $('#left_sidebar_adv').load('ad_display_auc1.jsp');
});
</script>

<script >
function reject()
{
window.location.href="prof.jsp";	
}

</script>


<script>
function accept(String text)
{	
	//alert("in accept function!");
window.location.href="post_wall_after.jsp?wallpost="+text;		
}
</script>


</head>
<body>


<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li><a href="home.jsp">My Home</a></li>
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


<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">


<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->

<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);
System.out.println("in notification uid="+uid);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st1=con.createStatement();

System.out.println("in notification uid="+uid);

ResultSet rs1=st1.executeQuery("select count(*) from notification where uid_to="+uid);
int count=0;
while(rs1.next())
{
	count=rs1.getInt("count(*)");
	System.out.println("!!! COUNT = "+count);
}



if(count==0)
{%>
<br>
<br>

	<div class="post" style=" width:580px; margin:0px auto;left:350px;height:100px;" >

<br><br>
<center>
<font face="Palatino Linotype" size="4em" color="#F6B300">NO NOTIFICATIONS</font>
</center>
<% 
//response.sendRedirect("home.jsp");
}
else
{
	%>
	<div class="post" style=" width:580px; margin:0px auto;left:350px;" >
<center>
<font face="Elephanta" size=6em color="#F6B300">Your Notifications :</font>
</center>
<br>
<br>

	
	<%
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from notification where uid_to='"+uid+"'");

int uid_from=0;
String notify="";
int uid_to=0;
int nid=0;

while(rs.next())
{
nid=rs.getInt("nid");	
notify=rs.getString("notification");
uid_from=rs.getInt("uid_from");
uid_to=rs.getInt("uid_to");
System.out.println ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!                notify = "+notify);
session.setAttribute("uid_to",uid_to);
session.setAttribute("uid_from",uid_from);

String user_to="";
String user_from="";
String user_from_last="";
Statement st9=con.createStatement();
ResultSet rs9=st9.executeQuery("select * from basic_info where uid= '"+uid_to+"'");
while(rs9.next())
{
	user_to=rs9.getString("username");
	
}
int pic_id=0;
Statement st99=con.createStatement();
Statement st999=con.createStatement();

ResultSet rs99=st99.executeQuery("select * from basic_info where uid= '"+uid_from+"'");
while(rs99.next())
{
	uid_from=rs99.getInt("uid");
	user_from=rs99.getString("first_name");

	user_from_last=rs99.getString("last_name");
	pic_id=rs99.getInt("p_id");
	
}


%>
<div style="width:600px;height:100px;border-bottom:1px solid;border-bottom-color:#FFFFFF">
<form name="notification_privacy" action="post_wall_after.jsp" method="post">

<div style="float:left;width:60px;">
<a href="checkfriend.jsp?fuid=<%=uid_from %>">
<%
if(pic_id==0)
{
	System.out.println("no prof pic!");
	%>
	<img src="images/default.jpg" width=50px height=50px>
	<%
	
}
else
{
	
	System.out.println("ahe profile pic of user!");
	String path=null;
	ResultSet rs999=st999.executeQuery("select * from image_try where p_id="+pic_id);
	while(rs999.next())
	{
		path=rs999.getString("img_path");
	}
	%>
	<img src="<%=path %>" width=50px height=50px>
	
	<%
}
%>
</a>
</div>

<div style="float:right;width:540px;">
<a href="checkfriend.jsp?fuid=<%=uid_from %>">

<font face="Palatino Linotype" size=5em color=#F6B300 style="text-transform:capitalize"><%=user_from%>&nbsp;&nbsp;<%=user_from_last %></font></a> 
<font face="Palatino Linotype" size=3em color="#3D2729"> wants to post :</font>
<font face="Palatino Linotype" size=5em color="#0000CC"> <%=notify%></font> 
<font face="Palatino Linotype" size=3em color="#3D2729">on your wall!</font>
<br>
<font face="Palatino Linotype" size=3em color="#E00000">ALLOW TO POST?? </font>
&nbsp;&nbsp;
<a href="post_wall_after.jsp?wallpost=<%=notify%>" >
<font face="Palatino Linotype" size=3em color="#009900"><b><u>YES</u></b></font> </a> 
&nbsp;&nbsp;&nbsp;
<a onclick="confirm_del(<%=nid%>)"><font face="Palatino Linotype" size=3em color="#E00000"><b><u>NO</u></b></font></a>

<!-- 
<input type="button" value="NO" onclick="reject();" class="button">
-->
</div>

</form>
</div>


<% 

} 

} // end of else part of null notification
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