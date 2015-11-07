<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<script>

function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;

}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
     <link rel="stylesheet" href="style.css" />
     
     <link rel="shortcut icon" href="images/favicon.ico" />
<script type="text/javascript" src="jq1.js"></script>

</head>
<body>
<%
String uname=session.getAttribute("uid123").toString();
if(uname!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("OLD WALA SESSION!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


String ad_id1=session.getAttribute("ad_id3").toString();
int ad_id=Integer.parseInt(ad_id1);



Statement st=con.createStatement();
String sql="select * from register_ad where ad_id="+ad_id;
ResultSet rs=st.executeQuery(sql);

String ad_name="";
String link_url="";
String description="";

while(rs.next())
{
ad_name=rs.getString("ad_name");
link_url=rs.getString("link_url");
description=rs.getString("description");
}






%>


<div id="menu" >
<div id="menu-wrapper">
	<ul>	
		<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
		<li class="current_page_item"><a href="home.jsp">My Home</a></li>
		<li><a href="prof.jsp">My Profile</a></li>
		<li><a href="album1.jsp">My Gallery</a></li>
		<!-- <li><a href="#">Groups</a></li>   -->
		
		
 			
		<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
		<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
		<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
		<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
		<li><a href="ad_home.jsp">Advertise</a></li>
		<li><a href="login.jsp">Sign-Out</a></li> 
	</ul>
</div>
<!-- end #menu -->
</div>


 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">


<div class="post" style="width:1050px;height:220px;">
<center>
<font  color="#F6B300" face="Palatino Linotype" size="5em"></label>YOUR FINAL PAYMENT HAS BEEN ACCEPTED ! </font><br><br>
<font  color="#3D2729" face="Palatino Linotype" size="5em"></label>AD NAME : <%=ad_name%> </font><br>
<font  color="#3D2729" face="Palatino Linotype" size="5em"></label>LINK URL : <%=link_url%></font><br>
<font  color="#3D2729" face="Palatino Linotype" size="5em"></label>DESCRIPTION :  <%=description%></font><br>
</center>
</div>
<%

}else
{
	System.out.println("NEW WALA SESSION!");
	response.sendRedirect("login.jsp");
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