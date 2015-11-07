<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
   <link rel="stylesheet" href="style.css" />
      <script type="text/javascript">
function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;
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

<%
/*
String count1=request.getParameter("friend_count");
int count=Integer.parseInt(count1);
System.out.println("friends_count="+count);
*/


%>
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


<div class="post" style=" width:580px; margin:0px auto;left:350px;">

<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");
%>
  <label style="font-face:Elephanta;font-size:25px;color:#F6B300;">
  <u><b>Privacy Settings...</b></u>
  <br>
  <br>
  </label>
  <label style="font-face:Elephanta;font-size:15px;color:#3D2729;">

Now Scrutinize friends who can post on your wall...!!
<br>
Only scrutinized friends will be able to post on your wall.Posts on your wall by rest of your friends
will be first notified to you and then you may or may not further allow that post to appear on your wall.
   
   </label>
   
   <center>
   <br>
   <br>
   <div style="left:850px;">
   
    </div>
   
<form action="privacy_controller.jsp" method="post" >
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");





Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st1=con.createStatement();
String uid1 = session.getAttribute("uid123").toString();

Integer uid=Integer.parseInt(uid1);

System.out.println("uid in privacy ahe="+uid);
//String sql1="select * from permanent_friend where uid="+uid+"and res='"0";
String sql1="select * from permanent_friend where res=0 and uid='"+uid+"' or res=0 and friend_id='"+uid+"'";
ResultSet rs1=st1.executeQuery(sql1);
System.out.println(sql1);

int count=0;
//String uid=session.getAttribute("uid").toString();

Statement st9=con.createStatement();
String sql9="select count(*) from permanent_friend where res=0 and uid='"+uid+"' or res=0 and friend_id='"+uid+"'";
ResultSet rs9=st9.executeQuery(sql9);


while(rs9.next())
{
	count=rs9.getInt(1);
}

%>
<label style="font-face:Elephanta;font-size:20px;color:#3D2729;">
   Friends(<%=count %>)
   </label>

<% 

int friend_id=0;
while(rs1.next())
{
	if(rs1.getInt("uid")==uid)
		friend_id=rs1.getInt("friend_id");
	else
		friend_id=rs1.getInt("uid");
	
	System.out.println("friend id ahe in privacy="+friend_id);
	
	%>
	<br>

	
	<% 
	
	String sql2="select * from basic_info where uid="+friend_id;
	Statement st2=con.createStatement();
	ResultSet rs2=st2.executeQuery(sql2);
	String fname=null;
	String lname=null;
	int pic_id=0;
	while(rs2.next())
	{
	
		fname=rs2.getString("first_name");
		lname=rs2.getString("last_name");
		pic_id=rs2.getInt("p_id");
		
	}
	%>
	<div style="width:480px;border-bottom:1px solid;border-bottom-color:#787878;height:80px;">
	
	<div style="float:left;width:210px;">
	
	<div style="float:left;width:110px;">
			
			<div style="float:left">
	
			<input type="checkbox" name="friend" value=<%=friend_id %> >
		</div>
		
		<div style="float:right;width:80px;">
			<%
			if(pic_id==0)
			{
			%>
			<img src="images/default.jpg" width="60px" height="60px">
			<%	
			}
			else
			{
			Statement st111=con.createStatement();
			String sql111="select * from image_try where p_id="+pic_id;
			ResultSet rs111=st111.executeQuery(sql111);
			String path=null;
			
			while(rs111.next())
			{
			path=rs111.getString("img_path");	
			}
			
			%>		
			<img src="<%=path%>" width="60px" height="60px">
			<%}//end of else
		%>
		</div>
		</div><!-- end of chcekbox image -->
		
		
	
		<div style="float:right;width:100px;left:70px">
		
		<label style="font-face:Elephanta;font-size:20px;color:#3D2729;text-transform:capitalize;">
			<%=fname %>&nbsp;<%=lname %> 
			</label>
			
			</div>
			
			</div><!-- end of chckbox+img+naav -->
			

<div style="float:right;width:150px;">
			
			<input type="submit" value="Restrict to Post" class="button_up">

			</div>
		
			</div><!-- end of 1 div!" -->
	<%
	

}

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>


</form>
</center>
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
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>