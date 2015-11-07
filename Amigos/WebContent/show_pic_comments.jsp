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
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
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


<div class="post" style="width:580px; margin:0px auto;left:350px;">


<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

String p_id123=request.getParameter("p_id");
int p_id=Integer.parseInt(p_id123);

String p_id999=request.getParameter("p_id123");
int p_id888=Integer.parseInt(p_id999);

System.out.println("in show pic comments pic cha id = "+p_id888);
%>

<%


String sql2="select * from image_try where p_id='"+p_id888+"'";
Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery(sql2);
String path="";
while(rs2.next())
{
	
	path=rs2.getString("img_path");
}


%>

<center>
<img src="<%=path %>" width=150px height=150px>
</center>
<br>
<br>

<% 
boolean empty=true;




String sql="select * from comment_pictures where p_id='"+p_id888+"'";
System.out.println("in comment_pictures!!! "+sql);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
while(rs.next())
{
	empty=false;
	
}

if(empty==true)
{
%>
<center>
<font color="#3D2729" face="Palatino Linotype" size="3em">
No comments!!</font>
</center>
<%
	
}

else
{
%>
<font face="Algerian" size=4em color="#F6B300">Comments :</font>
<br>


<%
String comment_text="";
int commentor=0;

String sql1="select * from comment_pictures where p_id='"+p_id888+"'";
	System.out.println("in comment_pictures!!! "+sql);
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery(sql1);
	


while(rs1.next())
{
	
commentor=rs1.getInt("commentor");
comment_text=rs1.getString("comment_text");
Statement st21=con.createStatement();
String sql21="select * from basic_info where uid='"+commentor+"'";

ResultSet rs21=st21.executeQuery(sql21);
String username="";
String fname=null;
String lname=null;
int userid1=0;
int pic_id=0;


while(rs21.next())
{
	userid1=rs21.getInt("uid");
	fname=rs21.getString("first_name");
	lname=rs21.getString("last_name");
	pic_id=rs21.getInt("p_id");
	username=rs21.getString("username");
%>

				
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
	Statement st116=con.createStatement();
	ResultSet rs116=st116.executeQuery(sql116);
	String path2=null;
	while(rs116.next())
	{
    	path2=rs116.getString("img_path");
	}

	%>
	   	     <img src="<%=path2%>" alt="profile picture" width="50" height="50">

    <%

 } 	  	
 
%>
</div>

<div style="float:right;width:350px;">

<font face="Palatino Linotype" size="4em" color="#F6B300" style="text-transform:capitalize"><%=fname%> <%=lname%> </font>

 &nbsp; :: &nbsp;&nbsp;
 <font face="Palation Linotype" size=4em color="#3D2729">
  <%=comment_text %></font>


</div>
</a>
</div>
	    			
	    	

<% 
	
} //end of while rs1
 

} //end of while rs

}
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
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
<!-- add header for going to passAlbumName   -->
</body>
</html>