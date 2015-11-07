<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
 <meta charset="utf-8" />
  <title>Amigos</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
   
     <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
  
<style>
option.try{background-color:#F1EDE4;}
option
{
background-color:#F1EDE4;

color: #3D2729;
}

</style>
  <script>
    $(function() {
        $( "#tabs" ).tabs();
    });
    </script>
    
    <script>
    $(function(){
        $('#sidebar_adv').load('ad_display.jsp');
    });
    </script>

   <script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#sidebar_adv').load('ad_display.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
</script>

<script>

function show_friends(count_friends)
{
	//alert("hi ="+count_friends);   
	window.location.href="show_friends.jsp?count_friends="+count_friends;	
}
</script>   

<%@ page import="java.sql.*"%>

  
  
   <script type="text/javascript">
   
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





<script type="text/javascript">
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}
</script>



<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">

<%
session.setAttribute("message_flag","1");



if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! !SESSION OLD WALA!");

String getname1 = session.getAttribute("name").toString();
System.out.println("in prof.jsp getname1="+getname1);
int fuid1=0;


System.out.println("in prof.jsp!");
String searchUid=request.getParameter("searchUid");
System.out.println("searchUid="+searchUid);
//int fuid1=0;


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st10=con.createStatement();

Statement st9=con.createStatement();

Statement st13=con.createStatement();
Statement st2=con.createStatement();

Statement st111=con.createStatement();
Statement st21=con.createStatement();
Statement st22=con.createStatement();
Statement st23=con.createStatement();
Statement st20=con.createStatement();
Statement st5=con.createStatement();
Statement st6=con.createStatement();

Statement st53=con.createStatement();
Statement st1=con.createStatement();
Statement st116=con.createStatement();


ResultSet rs10=st10.executeQuery("select * from basic_info where uid ="+searchUid);
String uid = session.getAttribute("uid").toString();
System.out.println("in prof2.jsp uid= "+uid);



//session.setAttribute("userid",userid);
session.setAttribute("uid", uid);
System.out.println("Session uid in prof1.jsp is :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: "+uid+"\n");
session.setAttribute("fuid1",searchUid);
System.out.println("Session fuid1 in prof2.jsp is : "+searchUid+"\n");
//out.println(userid);
String fname=null;
String lname=null;
int pic_id=0;

if(rs10.next())
{
fname=rs10.getString("first_name");
lname=rs10.getString("last_name");
pic_id=rs10.getInt("p_id");
}

else
{
	//response.sendRedirect("login.jsp");
}





String fuid=session.getAttribute("frienduid").toString();
System.out.println("in prof1.jsp fuid = "+fuid);
%>

<%

session.setAttribute("fuid",fuid);
%>

<div id="notif_img" >
<div class="post" style="height:185px;">

<div id="img" style="float:left;width:160px;">
<center>
<h3><%=fname %>&nbsp;&nbsp;<%=lname %></h3>
</center>
<%
String sql16=("select * from album where uid="+searchUid+" and album_names='profile'");

ResultSet rs3=st5.executeQuery(sql16);

boolean empty=true;

while(rs3.next())
{
	 empty=false;
}

 if(pic_id==0)
 {
	  System.out.println("no profile picture has been added!");
	  %>
	  
	  <img src="images/default.jpg" alt="no profile" width="150" height="150"  >
	  
	  <%
 }//end of if(empty)

 else
 {
	System.out.println("pic id="+pic_id);
	String sql116="select * from image_try where p_id="+pic_id;
	ResultSet rs116=st116.executeQuery(sql116);
	String path=null;
	while(rs116.next())
	{
    	path=rs116.getString("img_path");
	}

	%>
	   	     <img src="<%=path%>" alt="profile picture" width="150" height="150">

    <%

 }
 	  	

%>

</div>  <!-- end of div img -->

<div id="notif" style="float:right;width:250px;">
<br>
<br>
<br>
<%
int fr_id=0;
int frnd_id=0;
int my_friend_id=0;
String fn=null;
String ln=null;
int count_friends=0;

String sql1="select count(*) from permanent_friend where uid="+searchUid+" or friend_id="+searchUid;
ResultSet rs1=st1.executeQuery(sql1);
System.out.println("done wd exec");

while(rs1.next())
{
	count_friends=rs1.getInt("count(*)");
	System.out.println("count of friends:="+count_friends);
}	


%>

<br>
<input type="button" class="button" value="<%=count_friends%>&nbsp;&nbsp;&nbsp;Friends" style="width:200px;height:35px;color:#F6B300" onclick="show_friends(<%=count_friends%>);">
<br>
<br>
<a href="NewMessage.jsp?fname=<%=fname %>" class="button">Send Message</a>


<!-- 
<input type="button" class="button" value="Send Message" style="width:200px;height:35px;color:#F6B300" onclick="">
-->
<br>




</div>
<br>

<div style="margin:0px auto;width:400px;">
<center>
<br>

<%
int chk=0;
Statement chk_req_sent=con.createStatement();
String chk_req_sent1="select * from friend_request where sender_uid="+uid+" and reciever_uid="+searchUid+" or sender_uid="+searchUid+" and reciever_uid="+uid;
System.out.println(chk_req_sent1);
ResultSet chk_req_sent_rs=chk_req_sent.executeQuery(chk_req_sent1);
while(chk_req_sent_rs.next())
{

	chk=1;
	
}

if(chk==1)
{%>
<font face="Palatino Linotype" size="4px" color="3D2729">
<br>
<br>
<b>Friend Request sent.
<br>
Reply Pending !</b></font>
<%
}
else
{	
%>


<h4> connect with <%=fname %>??</h4>
<form name="send_request" action="sendFriendRequest.jsp" method="post">

     <input type="hidden" name="friend_uid" value="<%=fuid%>">

<br>
<h4>
Add to : 
	<select name="friend_type">
	<option value=1 class="try">personal</option>
	<option value=2>professional</option>
	<option value=3>both</option>
	
	</select>	
circle
</h4>
<br>
<center>
 <input type="submit" value="Send friend request!" id="send friend request" style="width:200px;height:35px;color:#F6B300" class="button">
</center>
</FORM>

</center>
</div>
  
<%
}
%>

</div>
</div>

</div>

<div class="post" style="background:#ffffff;width:1020px;height:160px">
<center>
<div style="margin:0px;width:375px;left:400px">

<br><br>

<div style="float:left;">
<img src="images/lock.jpg" width=150px height=150px>
</div>
<div style="float:right;">


<br><br>
<font size="3 em">
User    has   restricted 
<br>visitors for
<br>
    profile   data  and albums !
    <br>
    (By Amigos Privacy settings..)
    
</font>

</div>

</div>

</center>


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