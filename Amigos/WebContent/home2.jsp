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
<script type="text/javascript" src="jq2.js"></script>
   <script type="text/javascript">
        var auto = setInterval(    function ()
        {
             $('#right_sidebar_adv').load('ad_display_auc2.jsp').fadeIn("slow");
        }, 5000); // refresh every 5000 milliseconds

   </script>

   <script type="text/javascript">
   $(function(){
       $('#right_sidebar_adv').load('ad_display_auc2.jsp');
   });
   </script>

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
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
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


<div class="post" style="position:absolute;width:500px; margin:0px auto;left:350px;">

<center>
<font face="Elephanta" size=6em color=#F6B300>
<b>Wallpost</b>
</font>
</center>

<%
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


System.out.println("IN HOME2.JSP!!!!");
String wall_id123=request.getParameter("wall_id");
Integer wall_id=Integer.parseInt(wall_id123);
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! wall id in home2 = "+wall_id);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

//System.out.println("WALL ID MILALAL KA NAI = "+wall_id);
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from wall_posts where w_id="+wall_id);
String likes="";
String wall_post="";
int s_id=0;
int pic_id=0;
Statement st_album=con.createStatement();
Statement st116=con.createStatement();



while(rs1.next())
{
wall_post=rs1.getString("text_content");
s_id=rs1.getInt("s_id");

Statement st_basic=con.createStatement();
ResultSet rs_basic=st_basic.executeQuery("select * from basic_info where uid="+s_id);
String fname="";
String lname="";
int userid2=0;
while(rs_basic.next())
{
		userid2=rs_basic.getInt("uid");
		pic_id=rs_basic.getInt("p_id");
		fname=rs_basic.getString("first_name");
		lname=rs_basic.getString("last_name");
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


<a href="checkfriend.jsp?fuid=<%=userid2%>">


<font face="Palatino Linotype" size="5em" color="#F6B300" style="text-transform:capitalize"><%=fname %> <%=lname %></font></a>&nbsp;&nbsp; ::&nbsp; 
<font color="#3D2729" face="Palatino Linotype" size="3em">
<%=wall_post %></font>
<br>
<br>
<% 
System.out.println("in home2 :: likes= "+likes);
String sql11="SELECT SUM(LENGTH(likes) - LENGTH(REPLACE(likes, ',', '')) + 1) FROM wall_posts where w_id="+wall_id+"";
Statement st11=con.createStatement();
ResultSet rs11=st11.executeQuery(sql11);
String counter="";
while(rs11.next())
{
	counter=rs11.getString("SUM(LENGTH(likes) - LENGTH(REPLACE(likes, ',', '')) + 1)");
}

System.out.println("in home2.jsp  count of likes = "+counter);


if(Integer.parseInt(counter)==1)
{
	System.out.println("likes are null");
%>
<center>
<font color="#3D2729" face="Palatino Linotype" size="3em">
No likes!!</font>
</center>
<%
}
else
{
	System.out.println("likes are not null");
%>



<font color="#3D2729" face="Palatino Linotype" size="3em">
This post is liked By::
</font>

<br>


<% 
	likes=rs1.getString("likes");
} //end of while rs1

System.out.println("LIKES = "+likes);
String s=likes;
String y="";
String [] names;
String[] result=s.split(",");
int count=0;
for (int x=0; x<result.length; x++) 
{
y=result[x];

System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!! y = "+y);
String w="";
Statement st2=con.createStatement();
ResultSet rs3; 
String fname1=null;
int userid1=0;
String lname1=null;
String sql3="select * from basic_info where uid= '"+y+"'";
System.out.println(sql3);
ResultSet rs7=st2.executeQuery(sql3);

while(rs7.next())
{
fname1=rs7.getString("first_name");
lname1=rs7.getString("last_name");
pic_id=rs7.getInt("p_id");
userid1=rs7.getInt("uid");
w=rs7.getString("username");
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!for wallpost id :: "+wall_id+ "dis person liked it :: "+w);
//out.print("USERNAMES  "+w+",");
%>
<br>
<div style="width:410px;height:70px;">
<a href="checkfriend.jsp?fuid=<%=userid1%>">
<div style="float:left;width:60px;">
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
</div>

<div style="float:right;width:350px;">

<font face="Palatino Linotype" size="5em" color="#F6B300" style="text-transform:capitalize"><%=fname1%> <%=lname1%> </font>
</div>
</a>
</div>
<% 

} // end of while rs7


count++;
}
//end of for loop

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