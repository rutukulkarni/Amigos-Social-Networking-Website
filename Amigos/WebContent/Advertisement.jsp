<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
     <link rel="stylesheet" href="style.css" />

 <link rel="shortcut icon" href="images/favicon.ico" />
   
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

<div class="post" style=width:1100px" >
<center>
<%
//ADD HEADER IN THIS PAGE!!!!!!!!!!!!!!!
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

%>

<font face="Palatino Linotype" size=4em color="#F6B300">Following Users clicked on your ad and their respective details are as given : </font>
<br>
<%
//String ad_id=request.getParameter("ad_id");
String ad_id=session.getAttribute("ad_id3").toString();
System.out.println("in advertisement ad_id="+ad_id);


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st4=con.createStatement();

String fname=null;
String lname=null;
String email=null;


String sql3="select * from register_ad where ad_id="+ad_id;
ResultSet rs3=st.executeQuery(sql3);
int clicks=0;
while(rs3.next())
{
	clicks=rs3.getInt("clicks");
	System.out.println("clicks for ad is="+clicks);
		
}
clicks=clicks-1;
System.out.println("final  no. of clicks:="+clicks);

String sql4="update register_ad set clicks="+clicks+" where ad_id="+ad_id;
st4.executeUpdate(sql4);
//----------------------------------------------------

String name9998="";
   	Statement st999=con.createStatement();
   	String sql999="select * from register_ad where ad_id='"+ad_id+"'";
   	System.out.println("sql 999 = "+sql999);
ResultSet rs999=st999.executeQuery(sql999);  
  	 String name999=null;
     while(rs999.next())
     {
     	name999=rs999.getString("clicked_users");
          	
     }
	String s999=name999;
	String y999="";
	String [] names999;
	String[] result999=s999.split(",");
	int count999=0;
	int z=0;
	for (int x=0; x<result999.length; x++) 
	{
		y999=result999[x];
	
		count999=count999+1;
		String w="";
		Statement st888=con.createStatement();
		ResultSet rs888; 
%>		
<div style="border-bottom:1px solid;border-bottom-color:#FFFFFF">

	<% 	String sql888="select * from basic_info where uid= '"+y999+"'";
		rs888=st888.executeQuery(sql888);
		

		while(rs888.next())
	
		{
			w=rs888.getString("username");
			fname=rs888.getString("first_name");
			lname=rs888.getString("last_name");
			email=rs888.getString("email");
			z++;
			
		}

		//count999++;
	}
//int k=st.executeUpdate("insert into ad_info values('"+fname+"') where ad_id="+ad_id+")");
//int k=st.executeUpdate("insert into ad_info values('"+fname+"','"+lname+"',"+email+","+clicks+")");

//System.out.println(+k+"rows updated");
%>

<br>
<font face="Palatino Linotype" size=4em color="#F6B300">First Name : <%=fname %></font>
<br>
<font face="Palatino Linotype" size=4em color="#F6B300">Last Name : <%=lname %></font>
<br>
<font face="Palatino Linotype" size=4em color="#F6B300">Email ID : <%=email %></font>
<br>
<font face="Palatino Linotype" size=4em color="#F6B300">CLICKS : <%=clicks %></font>


</div>

<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>
</center>
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