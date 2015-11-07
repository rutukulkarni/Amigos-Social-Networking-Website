<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Home</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
   
       <link rel="stylesheet" href="style.css" />
</head>
<body>
<div id="menu">
	<div id="menu-wrapper">
		<ul>
				<li class="logo">
				<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			
	
			<li class="current_page_item"><a href="home.jsp">My Home</a></li>
			
			<li><a href="logout.jsp">Sign-Out</a>
		</ul>
	</div>
	<!-- end #menu -->
</div>


 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">
<center>
<div class="post" style="width:600px">

<font face="Elephanta" size=5em color=#F6B300>

WELCOME ADMIN!

</font>

<form action="select activity.jsp" method="POST">
<font face="Palatino Linotype" size=4em color=#3D2729>
Select Activity: 
</font>
	<select name="activity">
  	<option value=1>insert available space name</option>
	<option value=2>current cost for space</option>


<input type="submit" class="button" style="color:#F6B300">
	<br>
	</select>	
	</form>
	</div>
	
	<div class="post" style="width:600px;">
	<% 
	String flag123=session.getAttribute("flag").toString();
	System.out.println("flag in admin.jsp == "+flag123);
	
	//System.out.println("new flag in admin.jsp ="+flag);
	
	if(flag123==null)
			{

		%>
		<label>NO NEW USERS TO GRANT RIGHTS TO!</label>
		<% 
			}
	else
	{
		%>
	<form action="grant_admin_rights.jsp" method="post">
	<font face="Palatino Linotype" size=3em color=#3D2729>
	
	Select people you wish to grant admin rights
	
	</font>
	<br>
	<br>
	
	<%
	
	
	System.out.println("in admin.jsp!");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = null;
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

	Statement st=con.createStatement();

	Statement st11=con.createStatement();

	String sql= "select * from basic_info where type=0";

	ResultSet rs=st.executeQuery(sql);
	
String username="";
int pic_id=0;
String path=null;
String first_name=null;
String last_name=null;

while(rs.next())
{
	pic_id=rs.getInt("p_id");
	System.out.println("pic_id="+pic_id);
	username=rs.getString("username");
	first_name=rs.getString("first_name");
	last_name=rs.getString("last_name");

%>
<br>

<div style="width:200px;height:50px;">
<div style="float:left;width::100px;">

<div style="float:left;width:20px">
<input type="checkbox" name="username" value="<%=username%>" unchecked>
</div>

<div style="float:right;width:60px;">
<%
		
		
		
		if(pic_id==0)
		{
			%>
			<img src="images/default.jpg" width=50px height=50px>
			<%
		}
		else
		{
			String sql11="select * from image_try where p_id="+pic_id;
			ResultSet rs11=st11.executeQuery(sql11);
		while(rs11.next())
		{
			
			path=rs11.getString("img_path");
		}	
		%>
			<img src="path" width=50px height=50px>
		<%
			
		
		}
		
		
		
		%>
</div>
</div>	

	<div style="float:right;width:100px">
		<%

%>
<font face="Palatino Linotype" size=3em color=#3D2729>
<%=first_name %>&nbsp;&nbsp;<%=last_name %>

</font>
</div>

</div>

	
<%
}
%>

<input type="submit" value="GRANT ADMIN RIGHTS TO THESE USERS" class="button" style="color:#F6B300">
</form>

<%
	} // end of else flag==0
%>

<form action="bidders.jsp" method="POST">
<input type="submit" class="button" value="VIEW BIDDERS!" style="color:#F6B300">
</form>
</div>
</center>

</div>
</div>
</div>
</div>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>