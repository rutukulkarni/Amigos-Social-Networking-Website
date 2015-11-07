<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
 <meta charset="utf-8" />
  
     <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    <title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   

  <script>
    $(function() {
        $( "#tabs" ).tabs();
    });
    </script>
    
    
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

function show_friends(count_friends)
{
	//alert("hi ="+count_friends);   
	window.location.href="show_friends.jsp?count_friends="+count_friends;	
}
</script>   
<%@ page import="java.sql.*"%>


<script>
  function unfriend()
  {
	  

		//alert("in unfriend function!!!!!1");
		window.location.href="unfriend.jsp?fuid="+document.getElementById("fuid").value;

	  
  }
  
  
  </script>
      
  
   <script type="text/javascript">
   
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

<%@ page import="java.sql.*"%>





<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">


  <div class="post">
<%

System.out.println("in prof.jsp!");
session.setAttribute("flag",2);
//String getname1 = session.getAttribute("getname").toString();
//String getpwd = request.getParameter("pwd");

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or  it still exists 
{ 
System.out.println ("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! !SESSION OLD WALA!");

String getname1 = session.getAttribute("name").toString();
System.out.println("in prof.jsp getname1="+getname1);
//int fuid1=0;
String userid1=session.getAttribute("uid123").toString();
int userid=Integer.parseInt(userid1);

String searchUid=request.getParameter("searchUid");

System.out.println("in prof1.jsp searchuid="+searchUid);
//System.out.println("in prof.jsp password="+getpwd);
//int fuid1=0;


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st10=con.createStatement();

Statement st9=con.createStatement();

Statement st13=con.createStatement();
Statement st2=con.createStatement();
Statement st21=con.createStatement();
Statement st22=con.createStatement();
Statement st23=con.createStatement();
Statement st20=con.createStatement();
Statement st5=con.createStatement();
Statement st6=con.createStatement();
Statement st18=con.createStatement();
Statement st1=con.createStatement();
Statement st7777=con.createStatement();
Statement st777=con.createStatement();
Statement st40=con.createStatement();
Statement st77777=con.createStatement();
Statement st41=con.createStatement();
System.out.println("jst b4 rs10chi query in prof1.jsp"+searchUid);

Statement st116=con.createStatement();
ResultSet rs10=st10.executeQuery("select * from basic_info where uid ="+searchUid);


String uid = session.getAttribute("uid").toString();
System.out.println("in prof1.jsp uid= "+uid);


//session.setAttribute("uid", uid);

System.out.println("Session uid in prof1.jsp is :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: "+uid+"\n");
session.setAttribute("fuid1",searchUid);

//System.out.println("Session fuid1 in prof.jsp is : "+fuid1+"\n");
String fname=null;
String lname=null;
int pic_id=0;

if(rs10.next()){
fname=rs10.getString("first_name");
lname=rs10.getString("last_name");
pic_id=rs10.getInt("p_id");
System.out.println("in prof1.jsp pic_id="+pic_id);
}

else
{
	//response.sendRedirect("login.jsp");
}


//String fuid=session.getAttribute("searchUid").toString();
//System.out.println("in prof1.jsp fuid = "+fuid);
%>
<%

//session.setAttribute("fuid",searchUid);

%>
<div id="notif_img" style="height:200px;">

<div style="float:left;width:400px;">
<div style="float:left;width:150px;">
<%


 if(pic_id==0)
 {
	  System.out.println("no profile picture has been added!");
	  %>
	  
	  <img src="images/default.jpg" alt="no profile" width="150" height="150"  >
	  
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
	   	     <img src="<%=path%>" alt="profile picture" width="150" height="150">

    <%

 }
 	  	

%>

</div>  <!-- end of 150 width in notif_img -->

 <div style="float:right;width:210px;">
  <label style="font-face:Elephanta;font-size:2em;color:#F6B300"><%=fname.toUpperCase() %>&nbsp;
  <%=lname.toUpperCase() %></label>
 <br>
<br>
    <%
String sql77777="select * from basic_info where uid="+searchUid;

ResultSet rs77777=st77777.executeQuery(sql77777);

while(rs77777.next())
{

	String gender=rs77777.getString("gender");
	//System.out.println("dob is :"+birthdate);
	if(gender==(null))
	{
//		System.out.println("null birthdate");
		%>
	         <label for="Gender" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Gender :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729">Not Specified</label><br>
<%	
	}
	else
	{
		//System.out.println(" birthdate = "+birthdate);
		%>
    <label for="Gender" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Gender :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729"><%=gender%> </label><br>
<%
	}
	
}

	 
String sql7777="select * from basic_info where uid="+searchUid;

ResultSet rs7777=st7777.executeQuery(sql7777);

while(rs7777.next())
{

	String birthdate=rs7777.getString("dob");
	System.out.println("dob is :"+birthdate);
	if(birthdate==(null))
	{
		System.out.println("null birthdate");
		%>
	     <label for="dob" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Date of Birth :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729">Not Specified </label><br>
<%	
	}
	else
	{
		System.out.println(" birthdate = "+birthdate);
		%>
	     <label for="dob" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Date of Birth :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729"><%=birthdate%></label><br>
<%
	}
	
} // end of while

	   
String sql777="select * from advanced_personal where uid="+searchUid;

ResultSet rs777=st777.executeQuery(sql777);

while(rs777.next())
{

	String hometown123=rs777.getString("hometown");
	if(hometown123.equals(null))
	{
		System.out.println("null hometown123");
		%>
	     <label for="hometown" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Hometown :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729">Not Specified</label><br>
<%	
	}
	else
	{
		System.out.println(" hometown123 = "+hometown123);
		%>
	     <label for="hometown" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Hometown :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729"><%=hometown123%></label><br>
<%
	}
	
}


 Statement st888=con.createStatement();
String sql888="select * from advanced_professional where uid="+searchUid;
ResultSet rs888=st888.executeQuery(sql888);

while(rs888.next())
{
	String curr_job123=rs888.getString("curr_job");
	if(curr_job123.equals(null))
	{	
%>
	     <label for="curr_job" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Currently at : </label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729">Not Specified</label><br>
<% 
}
else
{
	%>
    <label for="curr_job" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Currently at : </label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729"><%=curr_job123%> </label><br>
  <%   
}
}
%> 
 
  </div>

</div>
<!-- end of 400 left wala -->

<%
System.out.println("in prof_mam.jsp frnd cha uid="+searchUid+"\n");
System.out.println("in prof_mam.jsp my uid="+uid+"\n");

String getname = (String) session.getAttribute("name");

String getpwd = request.getParameter("pwd");



System.out.println("in prof_mam.jsp 1st name="+getname+"\n");



System.out.println("after con!");

Statement st=con.createStatement();

String sql="select * from basic_info where username ='"+getname+"' AND password='"+getpwd+"'";
ResultSet rs=st.executeQuery(sql);
System.out.println(sql);
//ResultSet rs1=st1.executeQuery("select uid from basic_info where fname ='"+searchFirstname+"' AND lname='"+searchLastname+"'");
int frienduid=0;

System.out.println("after fuid=0");


%>



<div style="float:right;width:500px;">
	
<div class="post" style="height:40px;padding: 10px 10px;">
<center>
		<%
	String sql_curr_post="select * from wall_posts where s_id="+searchUid+" and r_id="+searchUid;
		System.out.println(sql_curr_post);
		Statement st_curr_post=con.createStatement();
		ResultSet rs_curr_post=st_curr_post.executeQuery(sql_curr_post);
		String curr_post=null;
		while(rs_curr_post.next())
		{
			curr_post=rs_curr_post.getString("text_content");
		}
		%>
		
		<label><font color="#F6B300" face="Palatino Linotype" size="4em">
	<label style="font-face:Elephanta;font-size:15px;color:#F6B300"><%=fname.toUpperCase() %>'s&nbsp;
  	</label> recent update :</font>
		<font  color="#3D2729" face="Palatino Linotype" size="4em"></label> <%=curr_post %> </font>
		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


</center>
</div>

<div style="margin:0px;width:500px;">

<% 


Statement st999=con.createStatement();

ResultSet rs999=st999.executeQuery("select count(*) from friend_request where reciever_uid=" +uid);

int i=0;

while(rs999.next())
{

	i=rs999.getInt(1);
	//out.println(" YOU HAVE FRIEND REQUESTS FROM :"+ );
	
	
}  // end of rs

System.out.println("friend reqs = "+i);
//response.sendRedirect("awall.jsp");

//to display all contents of table wall_posts
%>


<form name="side-menu">
<div style="float:left;width:250px;padding:0 px;">

<div style="float:left;130px;">
<a href="album2.jsp?searchUid=<%=searchUid%>">

<img src="images/album.jpg" width="120px" height="120px">
<br>
<center>
<font size:0.5em;><b>Albums</b></font></a>
</center>
</div>


<div style="float:right;width:120px">
<%


int fr_id=0;
int frnd_id=0;
int my_friend_id=0;
String fn=null;
String ln=null;
int count_friends=0;
if(searchUid.equals(uid))
{
	response.sendRedirect("prof.jsp");
}

String sql18="select count(*) from permanent_friend where uid="+searchUid+" or friend_id="+searchUid;
ResultSet rs18=st18.executeQuery(sql18);
System.out.println("done wd exec");

while(rs18.next())
{
	count_friends=rs18.getInt("count(*)");
	System.out.println("count of friends:="+count_friends);
}	


%>


<a onclick="show_friends(<%=count_friends%>);">
<img src="images/social-media.jpg" width=120px height=120px>
<center>
<font size:0.5em;><b>Friends( <%=count_friends%> )</b></font>
</center>
</a>


</div>


</div>


<div style="float:right;width:200px;">
<br>
<br>
<br>

<a href="unfriend.jsp?fuid=<%=searchUid %>" class="button" style="width:85px;height:35px;color:#F6B300">Unfriend </a>
<br>
<br>
<br>



<a href="NewMessage.jsp?uid=<%=searchUid %>" class="button" style="width:175px;height:35px;color:#F6B300">Send a Message</a>
</div>
</form>
</div>
</div>
</div>
</div>


<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->



<%
String sql40="select * from permanent_friend where uid="+userid+" and friend_id="+searchUid+" or friend_id="+userid+" and uid="+searchUid;
ResultSet rs40=st40.executeQuery(sql40);
System.out.println(sql40);
String friend_type=null;

while(rs40.next())
{
friend_type=rs40.getString("type");	
System.out.println("in prof1.jsp!!!!!!="+friend_type);

}
%>
   <div id="home_content_album" style="position:absolute; width:620px; margin:0px auto;left:360px;">
  <div class="post">
   <div id="tabs" style="width:540px;margin:0px;left:10px;" >
    <ul>
<%
if(searchUid!=uid)
{

if(friend_type.equals("personal"))
{
	System.out.println("in personal! of prof1");
  %> 
        <li><a href="#tabs-1"><font face="Palatino Linotype" size="5em" color="#FFFFFF">WALL</font></a></li>
   
        <li><a href="#tabs-2"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PERSONAL</font></a></li>
   </ul>
   <div id="tabs-1"> 
    <script>
 	 $("#tabs-1").load("wall11.jsp");
	</script>
   </div>         
   	
    
    <div id="tabs-2">
    <script>
 	$("#tabs-2").load("personal1.jsp");
	</script>
    </div>
    
     <%
 }
 
else 
	{

	System.out.println("in else! of prof1");
	if(friend_type.equals("professional"))
	
{
		System.out.println("in professionl! of prof1");
 %>
        <li><a href="#tabs-3"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PROFESSIONAL</font></a></li>
   </ul>
    <div id="tabs-3">
    <script>
 	$("#tabs-3").load("professional1.jsp");
	</script>       
    </div>
    
      <%
 }
else 
{	

	System.out.println("in both! of prof1");
 %>
      <li><a href="#tabs-1"><font face="Palatino Linotype" size="5em" color="#FFFFFF">WALL</font></a></li>
   
    
        <li><a href="#tabs-2"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PERSONAL</font></a></li>
    
        <li><a href="#tabs-3"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PROFESSIONAL</font></a></li>
   
   </ul>
   <div id="tabs-1"> 
    <script>
 	 $("#tabs-1").load("wall11.jsp");
	</script>
   </div>         
   	
    
    <div id="tabs-2">
    <script>
 	$("#tabs-2").load("personal1.jsp");
	</script>
    </div>
    
    <div id="tabs-3">
    <script>
 	$("#tabs-3").load("professional1.jsp");
	</script>       
    </div>
    	
   	     
        
 <%
}
	
	}
	
 
}
%>
 
    
    
   
   
   </div>
   </div>
   </div>

<%

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
}
// end of session wala else

%>    
</div>
</div>
</div>
</div>

    
</body>
</html>
