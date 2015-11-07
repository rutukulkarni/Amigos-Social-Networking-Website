
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
			
			
	 			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li><a href="selectAdType.jsp">Advertise</a></li>
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

<div id="right_sidebar_adv" style="width:220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div class="post">
<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String cont=request.getParameter("content");

String flag1=session.getAttribute("message_flag").toString();
int flag=Integer.parseInt(flag1);

System.out.println("flag="+flag);

if(flag==0)
{
	
String sender=request.getParameter("sender");
System.out.println("sender in demo.jsp"+sender);

session.setAttribute("sender",sender);
}
else
{
	String sender=session.getAttribute("first_name").toString();
	System.out.println("sender in demo.jsp"+sender);

session.setAttribute("sender",sender);
}


String sender=session.getAttribute("sender").toString();

String uid1=session.getAttribute("uid").toString();
Integer uid=Integer.parseInt(uid1);
//out.println(pooh);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); //uid which will be equal to sid
//out.println(uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();

ResultSet rs1=st.executeQuery("select * from basic_info where uid ='" +uid+"'");
String use=null;
while(rs1.next())
{
	use=rs1.getString(2);
}



ResultSet rs=st.executeQuery("select * from basic_info where username ='" +sender+"'");
int j=0;


while(rs.next())
{
	j=rs.getInt(1);
	
}
int i=st2.executeUpdate("insert into mess_info(sid,rid,sen_name,rec_name,content) values("+uid+","+j+",'"+use+"','"+sender+"','"+cont+"')");
System.out.println(+i+"rows updated");


ResultSet rs2=st3.executeQuery("select * from mess_info where sid='"+uid+"' AND rid='"+j+"'" );
while(rs2.next())
{
	%>
	<br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em"><%=rs2.getString(4) %>:</font></b> <font color="#3D2729" face="Palatino Linotype" size="4em"><%=rs2.getString(6) %></font>  	

<%
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
</div>
</div>

</div>
<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
</body>
</html>
