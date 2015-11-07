
<%@ page language="java" import="java.sql.*"  %>

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
function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;
}
</script>
 
<style>
	
	p.p1
	{
	text-align: center;
	}
	
	p.p2
	{
	text-align: left;
	}
	</style>
	
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
</head>

<body><div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
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

<div id="left_sidebar_adv" style="width: 220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->

 <form id="form" method="post" action="ReplyStore.jsp">  
<br>
<br>
<br>
<br>
<div class="post" style=" width:500px; margin:0px auto;left:350px;">

<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String flag1=session.getAttribute("message_flag").toString();
int flag=Integer.parseInt(flag1);

System.out.println("flag="+flag);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


if(flag==0)
{
%>


 <font face="Palatino Linotype" size=3em color="#3D2729"> 
To:</font>
<select name="sender" id="mySelect" onchange="getSelectedValue()">


<% 
//String uid1=session.getAttribute("uid").toString();
//Integer uid=Integer.parseInt(uid1);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); //uid which will be equal to sid
//out.println(uid);
}
else
{
	String first_name=request.getParameter("fname");
	System.out.println("in new msg fname="+first_name);

	Statement st7=con.createStatement();
	String sql7="select * from basic_info where first_name='"+first_name+"'";
	ResultSet rs7=st7.executeQuery(sql7);
	String sender_name="";
	while(rs7.next())
	{
		sender_name=rs7.getString("username");
	}
	
	%>
	<font face="Palatino Linotype" size=3em color="#3D2729">To : </font>
	<font face="Palatino Linotype" size=4em color="#F6B300"><%=first_name %></font>
	<input type="hidden" value=<%=sender_name%> name="sender">
	<%
	
}


Statement st=con.createStatement();
Statement st2=con.createStatement();

String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
//String my_uid = session.getAttribute("theName").toString();
//System.out.println("uid is:"+Integer.parseInt(my_uid));
String mess_list="";
String name="";
int n=0;
int use=0;
int i=0;

int mess[]=new int[100];

String mess_name[]=new String[100];



String frnd="select * from permanent_friend where uid =" +uid+" OR friend_id="+uid;
System.out.println(frnd);
ResultSet rs11=st.executeQuery(frnd);
while(rs11.next())
{
	if(rs11.getInt(2)==uid)
	{
		use=rs11.getInt(3);
	}
	else
	{
		use=rs11.getInt(2);
	}
	mess[i]=use;

	ResultSet rs22=st2.executeQuery("select * from basic_info where uid =" +mess[i]);
//	String mess_name=null;
	while(rs22.next())
	{

		name=rs22.getString("username");
	
		mess_name[i]=name;
		System.out.println("mess array element :: "+mess_name[i]);
		
	}
	
	i++;
	n++;
}//end of rs11 while
	
System.out.println("mess array :: "+mess_name);

for(int k=0;k<n;k++)
{
	%>
<option value=<%=mess_name[k] %> ><%=mess_name[k]  %></option>
	<%
//	mess_list+= mess[k]+",";

} 

//System.out.println("use values = "+mess_list);

	
%>
 
  
    
 </select><br>
  
 <font face="Palatino Linotype" size=3em color="#3D2729"> 
Message: </font><br>

<textarea cols="50" rows="7"  name="content1" id="content1" maxlength="145" >
</textarea><br>
<center>
<input id="submit" type="submit" value="Send Message"/ style="width:150px;height:40px;color:#F6B300" class="button">
<input id="reset" type="reset" value="Reset"/ style="width:100px;height:40px;color:#F6B300"class="button">
</center>
</div>
</form>

<%
}

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