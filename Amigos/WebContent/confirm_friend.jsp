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
    
			<script type="text/javascript">
function disable_confirm()
{
	document.getElementById("confirm").disabled = true
	
	
	}
</script>	
<script>

function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}


</script>

	
<script>	
function confirm()
{

	//alert("in confirm function...");
	
	window.location.href="confirmFriendController.jsp?uid="+document.getElementById("uid").value+"&type="+document.getElementById("type").value;
	
}

function ignore()
{

	//alert("in ignore function...");
	
	window.location.href="ignoreFriendController.jsp?sender_id="+document.getElementById("uid").value;
	
}
	
</script>   
 
  
  
<script type="text/javascript" src="jq1.js"></script>
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#right_sidebar_adv').load('ad_display_auc2.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
</script>

<script>

$(function(){
    $('#right_sidebar_adv').load('ad_display_auc2.jsp');
});
</script>

<script type="text/javascript" src="jq1.js"></script>
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

<div class="post" style=" width:550px; margin:0px auto;left:350px;">
<h2>Friend Requests ::</h2>
<br>

<center>
<form name="confirm_permanent_friend" id="confirm_permanent_friend" >

<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String my_uid = session.getAttribute("uid").toString();
System.out.println("my uid in confirm friend:"+Integer.parseInt(my_uid));

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st112=con.createStatement();

int i=0;
String j=null;
String path=null;
String name=null;
int k=0;
int pic_id=0;
ResultSet rs1=st1.executeQuery("select count(*) from friend_request where reciever_uid=" +Integer.parseInt(my_uid));

int count=0;

while(rs1.next()){

	count=rs1.getInt(1);
	
}
System.out.println("count="+count);
//System.out.println("friend reqs = "+i);

if(count==0)
{
	%>
	<font face="Palatino Linotype" size=4em color="#F6B300">No friend requests!!!!</font>
	<%
}

else
{
ResultSet rs=st.executeQuery("select * from friend_request where reciever_uid=" +Integer.parseInt(my_uid));





//int count1=Integer.parseInt(count);
while((count)!=0)
{

	if(rs.next())
	{
		i=rs.getInt("sender_uid");
		j=rs.getString("type");
}


System.out.println("friend_id is:"+i+" type is::"+j);

ResultSet rs2=st2.executeQuery("select * from basic_info where uid="+i);

if(rs2.next())
{
 name=rs2.getString("username");
 pic_id=rs2.getInt("p_id");
}
System.out.println("pic_id="+pic_id);
System.out.println("friend name in confirm_friend="+name);
session.setAttribute("name", name);

session.setAttribute("type",j);

%>



<input type="hidden" value=<%=i %> name="uid" id="uid">
<input type="hidden" value=<%=j %> name="type" id="type">

<div style="width:450px;height:95px;border-bottom:1px solid white;">
<a href="checkfriend.jsp?uid=<%=i %>">
<div style="float:left;width:200px;">

	<div style="float:left;width:65px;">
	<%
	if(pic_id==0)
	{
		%>
		<img src="images/default.jpg" width=60px height=60px>
		<%	
	}
	else
	{
		String sql112="select * from image_try where p_id="+pic_id;
		ResultSet rs112=st112.executeQuery(sql112);
		while(rs112.next())
		{
			path=rs112.getString("img_path");
			%>
			<img src="<%=path %>" width=60px height=60px>
			<%
		}
	}
	
	
	
	%>
	</div>
	
	<div style="float:right;width:135px;">
	
<h3><font color=#F6B300><%=name %></font></h3>	
	</div>
</a>	
</div>

<div style="float:right;width:250px;">

	<div style="float:left;width:170px;">

  of type &nbsp;&nbsp;<font face="Palatino Linotype" size=3em color=#F6B300><%=j %></font>

	</div>
	
	
	<div style="float:right;width:80px;height:70px;">
<input type="button" value="Confirm" id="confirmFriendController.jsp" onclick="confirm();"  class="button" style="color:#F1EDE4">
<br>
<input type="button" value="Ignore" id="confirmFriendController.jsp" onclick="ignore();"  class="button" style="color:#F1EDE4">

	</div>


</div>
</div>

<%
count--;
}
}

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>
</div>
</div>

</form>
</div>
</center>
</div>
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>