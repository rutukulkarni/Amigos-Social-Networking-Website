<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
     <link rel="stylesheet" href="style.css" />
     
     <link rel="shortcut icon" href="images/favicon.ico" />
<script type="text/javascript" src="jq1.js"></script>
<script type="text/javascript">
  
   function check_friend()
{

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
<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li class="current_page_item"><a href="home.jsp">My Home</a></li>
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


<div class="post" style="position:absolute; width:500px; margin:0px auto;left:350px;">

<center>
<font face="Elephanta" size=6em color=#F6B300>
<b>Wallpost</b>
</font>
</center>

<% 

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");





System.out.println("IN HOME1.JSP!!!!");
//String wall_id123=session.getAttribute("wall_id").toString();

String wall_id123=request.getParameter("wall_id");
Integer wall_id=Integer.parseInt(wall_id123);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

//System.out.println("WALL ID MILALAL KA NAI = "+wall_id);
Statement st1=con.createStatement();
String sql1=("select * from wall_posts where w_id="+wall_id);

System.out.println(sql1);
ResultSet rs1=st1.executeQuery(sql1);
Statement st116=con.createStatement();

String wall_post="";
int r_id=0;
int s_id=0;
String r_name="";
String s_name="";
String first_name=null;
String last_name=null;
int pic_id=0;
int userid2=0;
int userid1=0;


while(rs1.next())
{
	wall_post=rs1.getString("text_content");
	r_id=rs1.getInt("r_id");
	s_id=rs1.getInt("s_id");
	
} 

//--------------------
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from basic_info where uid="+r_id);
int r_uid=0;
String r_fname=null;
String r_lname=null;

while(rs2.next())
{
	r_name=rs2.getString("username");
	r_fname=rs2.getString("first_name");
	r_lname=rs2.getString("last_name");
	r_uid=rs2.getInt("uid");
} 

Statement st3=con.createStatement();
ResultSet rs3=st3.executeQuery("select * from basic_info where uid="+s_id);

while(rs3.next())
{
	userid2=rs3.getInt("uid");
	s_name=rs3.getString("username");
	first_name=rs3.getString("first_name");
	last_name=rs3.getString("last_name");
	pic_id=rs3.getInt("p_id");
} 
%>
<a href="checkfriend.jsp?fuid=<%=userid2%>">
<%
if(pic_id==0)
 {
	  System.out.println("no profile picture has been added!");
	  %>
	  
	  <img src="images/default.jpg" alt="no profile" width="50" height="50"  >
	  
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
	   	     <img src="<%=path%>" alt="profile picture" width="50" height="50">

    <%

 } 	  	
 
 

%>
</a>

<%
if(s_name.equals(r_name))
{
%>
<a href="checkfriend.jsp?fuid=<%=userid2%>">
<font face="Palatino Linotype" size=4em color=#F6B300 style="text-transform:capitalize">
<%=first_name%>&nbsp;<%=last_name %> </font></a>

&nbsp;&nbsp;:: &nbsp;<font face="Palatino Linotype" size=4em color=#3D2729><%=wall_post%></font>
<%
}
else
{

%>
<a href="checkfriend.jsp?fuid=<%=userid2%>">
<font face="Palatino Linotype" size=4em color=#F6B300 style="text-transform:capitalize">
<%=first_name%>&nbsp;<%=last_name %> </font>
</a>

&nbsp;&nbsp;:: &nbsp;<font face="Palatino Linotype" size=4em color=#3D2729><%=wall_post%></font>
<font face="Palatino Linotype" size=2em color=#3D2729>
on wall of  </font>
<a href="checkfriend.jsp?fuid=<%=r_uid%>">

<font face="Palatino Linotype" size=3em color=#F6B300 style="text-transform:capitalize"><%=r_fname%>&nbsp;<%=r_lname %></font></a>
<%	
}
%>

<br>
<br>

<label>COMMENTS :: </label>
<br>
<% 


	//System.out.println("in home1 :: comments= "+comment);
String sql11="SELECT count(*) from comments where w_id='"+wall_id+"'";
Statement st11=con.createStatement();
ResultSet rs11=st11.executeQuery(sql11);
int counter=0;
while(rs11.next())
{
	counter=rs11.getInt(1);
}

System.out.println("in home1.jsp  count of comments = "+counter);


if(counter==0)
{
	System.out.println("comments are null");
%>
<center>
<font color="#3D2729" face="Palatino Linotype" size="3em">
No Comments!!</font>
</center>
<%
}
else
{
	System.out.println("comments are not null");
%>

<%
Statement st4=con.createStatement();
ResultSet rs4=st4.executeQuery("select * from comments where w_id="+wall_id);
String comment="";
String commentor="";
while(rs4.next())
{
	comment=rs4.getString("comment_text");
	commentor=rs4.getString("commentor");	
	Statement st5=con.createStatement();
	ResultSet rs5=st5.executeQuery("select * from basic_info where uid="+commentor);
	String commentor_fname="";
	String commentor_lname="";
	int commentor_pid=0;
	int commentor_id=0;
	while(rs5.next())
	{
		commentor_id=rs5.getInt("uid");
		commentor_fname=rs5.getString("first_name");
		commentor_lname=rs5.getString("last_name");
		commentor_pid=rs5.getInt("p_id");
	}
	
	%>
	<br>
	
	
	
<a href="checkfriend.jsp?fuid=<%=commentor_id%>">
<%
if(commentor_pid==0)
 {
	  System.out.println("no profile picture has been added!");
	  %>
	  
	  <img src="images/default.jpg" alt="no profile" width="50" height="50"  >
	  
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
	   	     <img src="<%=path%>" alt="profile picture" width="50" height="50">

    <%

 } 	  	
 
 

%>

	
	
	<font face="Palatino Linotype" size=4em color=#F6B300 style="text-transform:capitalize"><%=commentor_fname%> <%=commentor_lname %> </font>&nbsp;&nbsp; : &nbsp;
	</a> <font face="Palatino Linotype" size=3em color=#3D2729><%=comment%></font>
<br>
	
	<% 
	
} 

%>
</div>
</div>
</div>
</div>

<%
} // end of else part of if not null commnets
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>

</div>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>