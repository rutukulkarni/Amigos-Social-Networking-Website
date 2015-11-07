<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page language="java" import="java.sql.*"  %>
 
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
   
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script>

function check_friend()
{
//alert("aata!");
//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


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

<div id="left_sidebar_adv" style="width: 220px;height:600px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:220px;height:600px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->
<div class="post" style=" width:500px; margin:0px auto;left:350px;">


 <div class="post">
 <center>
 <font face="Palatino Linotype" size=4em color="#3D2729">
 
   Want to send a new message?
 
 </font>
 <br>
 <br>
 <a href="NewMessage.jsp" class="button">Send New Message
</a>
 
</center>
</div>

<div class="post">
<br>
<%
session.setAttribute("message_flag","0");
%>
<form method="post" action="Conv.jsp" >

<% 

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{
String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
System.out.println("in conv uid="+uid);


%>
<font face="Palatino Linotype" size=4em color="#3D2729">
Conversations:

</font>

<br>
<br>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
String sql="select distinct(sen_name),sid from mess_info where rid ="+uid+" and sid<>"+uid;
System.out.println("sql statement in conversation : "+sql);
ResultSet rs1=st.executeQuery("select distinct(sen_name),sid from mess_info where sid <>"+uid+" and rid="+uid);

Integer id=0;
String parth=null;

while(rs1.next())
{
	parth=rs1.getString("sen_name");
	//out.println("parth:="+parth);
	id=rs1.getInt("sid");
	
	
	Statement st15=con.createStatement();
	String sql15="select * from basic_info where uid="+id;
	ResultSet rs15=st15.executeQuery(sql15);
	
	int pic_id=0;
	while(rs15.next())
	{
		pic_id=rs15.getInt("p_id");
	}
	
// out.println("id is:"+id);
	
	//ResultSet rs2=st.executeQuery("select * from mess_info where sen_name='"+parth+"' ");
	// while(rs2.next())
	 //{
		 
	 //}
	%>
<div style="width:200px;height:70px;">
<div style="float:left;width:60px">
<a href="Conv.jsp?sender=<%=parth%>">
<%
	if(pic_id==0)
	{
		%>
	<img src="images/default.jpg" width=50px height=50px>
	<%	
	}
	else
	{
	Statement st11=con.createStatement();
	String sql11="select * from image_try where p_id="+pic_id;
	ResultSet rs11=st11.executeQuery(sql11);
	String path=null;
	
	while(rs11.next())
	{
		path=rs11.getString("img_path");
		
	}
%>


<img src="<%=path %>" width=50px height=50px>
<%
}

%></div>

<div style="float:right;width:120px">
<b><font color="#F6B300" face="Palatino Linotype" size="4em" style="text-transform:capitalize"> 
  <%=parth%> </a></font></b>
  

</div>
</div>   
<%
}


} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>
<br>

</div>
</form>

</div>
</div>
</div>
</div>
<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
</body>
</html>