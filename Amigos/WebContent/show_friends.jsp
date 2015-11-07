<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   

     <link rel="stylesheet" href="style.css" />

<script>

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
  
  
  </head>
<body>
<%@ page import="java.sql.*"%>

<div id="menu" >
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


<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->


<div class="post" style=" width:550px; margin:0px auto;left:350px;">
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String count_friends1=request.getParameter("count_friends");

System.out.println("count_friends:="+count_friends1);

int count_friends=Integer.parseInt(count_friends1);

System.out.println("count_friends:="+count_friends);





String searchUid1=session.getAttribute("fuid1").toString();
int searchUid=Integer.parseInt(searchUid1);

System.out.println("searched id="+searchUid);


String uid123=session.getAttribute("uid").toString();
int uid=Integer.parseInt(uid123);

System.out.println("in show friends.jsp  uid="+uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st5=con.createStatement();

int fr_id=0;
int frnd_id=0;
int my_friend_id=0;
String fn=null;
String ln=null;
int userid=0;
int pic_id=0;
//--------------------------
/*
int count=0;
//String uid=session.getAttribute("uid").toString();

Statement st9=con.createStatement();
String sql9="select count(*) from permanent_friend where uid='"+searchUid+"'";
ResultSet rs9=st9.executeQuery(sql9);


while(rs9.next())
{
	count=rs9.getInt(1);
}
*/
%>


<% 

//----------------------
if(count_friends==0)
{
	%>
	<label>
	No friends of this user!!!</label>
	<%
}
else
{
%>
<center>
<font face="Elephanta" size=6em color="#E00000">Friends(<%=count_friends%>) :</font>
</center>
<br>
<%
String sql1="select * from permanent_friend where uid="+searchUid+" or friend_id="+searchUid;
ResultSet rs1=st1.executeQuery(sql1);
System.out.println("done wd exec");

while(rs1.next())
{
System.out.println("in permanent  wala while");
fr_id=rs1.getInt("friend_id");
frnd_id=rs1.getInt("uid");

	if(fr_id != searchUid)
		{
		my_friend_id=fr_id;
		}
	else
		{
		my_friend_id=frnd_id;
		}


System.out.println("This is my friend..."+my_friend_id);




System.out.println("in div1");
ResultSet rs2=st2.executeQuery("select * from basic_info where uid="+my_friend_id);
System.out.println("after executing select query!");
while(rs2.next())
{ 
	userid=rs2.getInt("uid");
	fn=rs2.getString("first_name");
	ln=rs2.getString("last_name");
	pic_id=rs2.getInt("p_id");
	System.out.println("first :"+fn);
	System.out.println("last name:"+ln);
	System.out.println("last name:"+pic_id);
	
	System.out.println("in div2");
}
%>


 <%System.out.println("name displayed of user"); %>



  <%
  System.out.println("in div3");
    	  %>
    	  
		<div style="width:350px;height:100px;border-bottom:1 px solid white;">
			 	
	   	<a href="checkfriend.jsp?fuid=<%=my_friend_id%>">
	   	
		<div style="float:left;width:60px;">
		<%
		if(pic_id==0)
	   	{
	   	
	   //	session.setAttribute("frienduid",userid);
   	    %>
    	  	<img src="images/default.jpg" alt="no profile" width="50" height="50">
			<br>
 		<%
 		}
	   	else
	   	{
	   	 System.out.println("pic id="+pic_id);
	     	String sql116="select * from image_try where p_id="+pic_id;
	     	ResultSet rs36=st4.executeQuery(sql116);
	     	String path=null;
	     	while(rs36.next())
	     	{
	         	path=rs36.getString("img_path");
	     	}
			%>
			<img src="<%=path %>" width=50px height=50px>
			<%
	   	}
		%>
		</div>
		<div style="float:right;width:290px;">
		
		
			<label><font color="#F6B300" size=4em face="Palatino Linotype" style="text-transform:capitalize"><%= fn %></font></label>
			<label><font color="#F6B300" size=4em face="Palatino Linotype" style="text-transform:capitalize"><%= ln %></font></label>
			
    	
    	</div>
    	</a>
    	</div>  
    	<br>
    	  <%
	     

  
     	  
}

}
%>
</div>
</div>
</div>
</div>
</div>
<%
}
else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>