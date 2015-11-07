<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
 <meta charset="utf-8" />
  <title>Amigos</title>
  
     <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <link rel="shortcut icon" href="images/favicon.ico" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
   
    <script>
  $(function() {
    $( document ).tooltip({
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
    });
  });
  </script>
    <style>
  .ui-tooltip, .arrow:after {
    background: #3D2729;
    border: 2px solid #F6B300;
  }
  .ui-tooltip {
    padding: 10px 20px;
    color: #F6B300;
    border-radius: 20px;
    font:  11px "Helvetica Neue", Sans-Serif;
    text-transform: uppercase;
    box-shadow: 0 0 7px #3D2729;
  }
  .arrow {
    width: 50px;
    height: 16px;
    overflow: hidden;
    position: absolute;
    left: 50%;
    margin-left: -35px;
    bottom: -16px;
  }
  .arrow.bottom {
    top: auto;
    bottom: -16px;
  }
  .arrow.left {
    left: 20%;
  }
  .arrow:after {
    content: "";
    position: absolute;
    left: 20px;
    top: -20px;
    width: 25px;
    height: 25px;
    box-shadow: 6px 5px 9px -9px black;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    tranform: rotate(45deg);
  }
  .arrow.top:after {
    bottom: -20px;
    top: auto;
  }
 
  .scroll-pane { overflow: auto; width: 99%; float:left; }
  .scroll-content { width: 2440px; float: left; }
  .scroll-content-item { width: 100px; height: 100px; float: left; margin: 10px; font-size: 1em; line-height: 96px; text-align: center; }
  .scroll-bar-wrap { clear: left; padding: 0 4px 0 2px; margin: 0 -1px -1px -1px; }
  .scroll-bar-wrap .ui-slider { background: none; border:0; height: 2em; margin: 0 auto;  }
  .scroll-bar-wrap .ui-handle-helper-parent { position: relative; width: 100%; height: 100%; margin: 0 auto; }
  .scroll-bar-wrap .ui-slider-handle { top:.2em; height: 1.5em; }
  .scroll-bar-wrap .ui-slider-handle .ui-icon { margin: -8px auto 0; position: relative; top: 50%; }
  </style>
  
  <script>
  $(function() {
    //scrollpane parts
    var scrollPane = $( ".scroll-pane" ),
      scrollContent = $( ".scroll-content" );
 
    //build slider
    var scrollbar = $( ".scroll-bar" ).slider({
      slide: function( event, ui ) {
        if ( scrollContent.width() > scrollPane.width() ) {
          scrollContent.css( "margin-left", Math.round(
            ui.value / 100 * ( scrollPane.width() - scrollContent.width() )
          ) + "px" );
        } else {
          scrollContent.css( "margin-left", 0 );
        }
      }
    });
 
    //append icon to handle
    var handleHelper = scrollbar.find( ".ui-slider-handle" )
    .mousedown(function() {
      scrollbar.width( handleHelper.width() );
    })
    .mouseup(function() {
      scrollbar.width( "100%" );
    })
    .append( "<span class='ui-icon ui-icon-grip-dotted-vertical'></span>" )
    .wrap( "<div class='ui-handle-helper-parent'></div>" ).parent();
 
    //change overflow to hidden now that slider handles the scrolling
    scrollPane.css( "overflow", "hidden" );
 
    //size scrollbar and handle proportionally to scroll distance
    function sizeScrollbar() {
      var remainder = scrollContent.width() - scrollPane.width();
      var proportion = remainder / scrollContent.width();
      var handleSize = scrollPane.width() - ( proportion * scrollPane.width() );
      scrollbar.find( ".ui-slider-handle" ).css({
        width: handleSize,
       
        "margin-left": -handleSize / 2
       
      });
      handleHelper.width( "" ).width( scrollbar.width() - handleSize );
    }
 
    //reset slider value based on scroll content position
    function resetValue() {
      var remainder = scrollPane.width() - scrollContent.width();
      var leftVal = scrollContent.css( "margin-left" ) === "auto" ? 0 :
        parseInt( scrollContent.css( "margin-left" ) );
      var percentage = Math.round( leftVal / remainder * 100 );
      scrollbar.slider( "value", percentage );
    }
 
    //if the slider is 100% and window gets larger, reveal content
    function reflowContent() {
        var showing = scrollContent.width() + parseInt( scrollContent.css( "margin-left" ), 2 );
        var gap = scrollPane.width() - showing;
        if ( gap > 0 ) {
          scrollContent.css( "margin-left", parseInt( scrollContent.css( "margin-left" ), 2 ) + gap );
        }
    }
 
    //change handle position on window resize
    $( window ).resize(function() {
      resetValue();
      sizeScrollbar();
      reflowContent();
    });
    
    //init scrollbar size
    setTimeout( sizeScrollbar, 10 );//safari wants a timeout
  });
  </script>
  

  <script>
    $(function() {
        $( "#tabs" ).tabs();
    });
    </script>
    
    <script>
    $(function(){
        $('#sidebar_adv').load('ad_display.jsp');
    });
    </script>

   <script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#sidebar_adv').load('ad_display.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
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
			<li><a href="home.jsp">My Home</a></li>
			<li class="current_page_item"><a href="prof.jsp">My Profile</a></li>
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

<%

//start here
// AMIGOS WALA PROF PAGE

System.out.println("in prof.jsp!");
//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);
//int fuid1=0;
//String equal123=null;

if(session.getAttribute("uid123")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


session.setAttribute("flag",1);
//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);
int fuid1=0;



/*
if(getname1!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1SESSION OLD WALA!");
} // end of session wala if
else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else
*/
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st10=con.createStatement();
//Statement st1=con.createStatement();

String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);

ResultSet rs10=st10.executeQuery("select * from basic_info where uid="+uid);

//ResultSet rs1=st1.executeQuery("select uid from basic_info where fname ='"+searchFirstname+"' AND lname='"+searchLastname+"'");



System.out.println("in prof.jsp uid= "+uid);


if(rs10.next()){
	
//out.println("WELCOME !!!");
//out.println(rs.getString("firstname")+"<br>");

//String userid = (String)session.getAttribute(rs.getString("uid").toString);
System.out.println("in prof.jsp after connection!");

//String uid = session.getAttribute("uid").toString();


//session.setAttribute("userid",userid);

System.out.println("Session uid in prof.jsp is : "+uid+"\n");
//COMMENTED BY ARUN ON SATURDAY
//session.setAttribute("fuid1",uid);
//System.out.println("Session fuid1 in prof.jsp is : "+fuid1+"\n");
//out.println(userid);

}


//mamscha laptopmadhe uncomment kara..string uid ahe tyat..devikas computer madhe uid int ahe na!

String userid1=session.getAttribute("uid").toString();

Integer userid = Integer.parseInt(userid1);


String getname = (String) session.getAttribute("name");

String getpwd = request.getParameter("pwd");



System.out.println("in prof_mam.jsp 1st uid="+uid+"\n");
System.out.println("after con!");

Statement st25=con.createStatement();
Statement st1=con.createStatement();
Statement st=con.createStatement();
Statement st2=con.createStatement();

Statement st5=con.createStatement();
Statement st6=con.createStatement();

Statement st9=con.createStatement();
Statement st11=con.createStatement();
Statement st12=con.createStatement();
Statement st13=con.createStatement();
Statement st14=con.createStatement();
Statement st15=con.createStatement();
Statement st16=con.createStatement();
Statement st116=con.createStatement();
Statement st20=con.createStatement();
Statement st36=con.createStatement();
Statement st21=con.createStatement();
Statement st22=con.createStatement();
Statement st23=con.createStatement();
Statement st777=con.createStatement();
Statement st7777=con.createStatement();
Statement st77777=con.createStatement();


String sql="select * from basic_info where uid="+uid;
ResultSet rs=st.executeQuery(sql);
System.out.println(sql);

int fuid=0;
int pic_id=0;
while(rs.next())
{
pic_id=rs.getInt("p_id");
System.out.println("pic id="+pic_id);
}  // end of while rs

System.out.println("after fuid=0");
if(rs.next()){
	
%>
<label>WELCOME <%=rs.getString("first_name").toUpperCase() %> </label>
<%
}


System.out.println("pic id="+pic_id);
%>

<br>
<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">

  <div class="post" style="height:200px;">
  <div id="notif_img">
  
  <div style="float:left;width:400px;">
  
  <div style="float:left;width:150px;">


          <%
    
  //  String sql6=("select * from album where uid="+uid+" and album_names='profile'");
   
    // ResultSet rs3=st5.executeQuery(sql6);
	 
     //boolean empty=true;
	 
     //while(rs3.next())
	 //{
		// empty=false;
	 //}
	 
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
 
 <div>
<div style="float:left;">
<a href="edit_profile.jsp" style="text-decoration:underline"><font size=3px>Edit Profile</font></a>
</div>

<div style="float:right;left:80px;">
<a href="images_try2.jsp">
<img src="images/change_prof.jpg" alt="change profile picture" width="20px" height="20px" title="Change Profile Picture."></a>
</div>
</div>

</div><!-- end of img+2 buttons width:200 -->
     
  <div style="float:right;width:210px;">
  <label style="font-face:Elephanta;font-size:2em;color:#F6B300"><%=rs10.getString("first_name").toUpperCase() %>&nbsp;
  <%=rs10.getString("last_name").toUpperCase() %></label>
 <br>
<br>
<%
String sql77777="select * from basic_info where uid="+uid;

ResultSet rs77777=st77777.executeQuery(sql77777);

while(rs77777.next())
{

	String gender=rs77777.getString("gender");
	System.out.println("gender is :"+gender);
	if(gender.equals(null))
	{
	System.out.println("null gender");
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


String sql7777="select * from basic_info where uid="+uid;

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
	
}


String sql777="select * from advanced_personal where uid="+uid;

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
	     <label for="hometown" style="font-face:Palatino Linotype;font-size:15px;color:#F6B300">Hometown :</label><label style="font-face:Palatino Linotype;font-size:15px;color:#3d2729"><%=hometown123%> </label><br>
<%
	}
	
}

 Statement st888=con.createStatement();
String sql888="select * from advanced_professional where uid="+uid;
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
  
</div><!-- end of width div-400 -->

	<div style="float:right;width:500px;">
	
<div class="post" style="height:40px;padding: 10px 10px;">
<center>
		<%
		String sql_curr_post="select * from wall_posts where s_id="+uid+" and r_id="+uid+" and status!='"+null+"'";
		System.out.println(sql_curr_post);
		Statement st_curr_post=con.createStatement();
		ResultSet rs_curr_post=st_curr_post.executeQuery(sql_curr_post);
		String curr_post=null;
		while(rs_curr_post.next())
		{
			curr_post=rs_curr_post.getString("status");
		}
		%>
		
		<label><font color="#F6B300" face="Palatino Linotype" size="4em">
		Your recent update :</font>
		<font  color="#3D2729" face="Palatino Linotype" size="4em"></label> <%=curr_post %> </font>
		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>

</center>
</div>
<br>

<div style="margin:0px;width:570px;float:right;">

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
<div style="float:left;width:280px;padding:0 px;">
<div style="float:left;width:90px;">



<%
int fr_id1=0;
int frnd_id1=0;
int my_friend_id1=0;
String fn1=null;
String ln1=null;
int count_friends1=0;
Statement st1233=con.createStatement();
String sql1233="select count(*) from permanent_friend where uid="+uid+" or friend_id="+uid;
ResultSet rs1233=st1233.executeQuery(sql1233);
System.out.println("done wd exec");

while(rs1233.next())
{
	count_friends1=rs1233.getInt("count(*)");
	System.out.println("count of friends:="+count_friends1);
}	

session.setAttribute("fuid1",uid);
%>
<a href="show_friends.jsp?count_friends=<%=count_friends1%>">

<img src="images/frnds.jpg" height=80px width=80px> 
<br>
<input type="button" value="Friends(<%=count_friends1 %>)" style="width:80px;height:25px;color:#F6B300; padding:0px; " class="button"  > 
</a>

</div>
<div style="float:right;width:190px;">

<div style="float:left;width:100px">
<a href="confirm_friend.jsp">

<img src="images/addfrnd.jpg" height=80px width=90px> 
<br>
<input type="button" value="Frnd Req( <%=i %> )"style="width:90px;height:25px;color:#F6B300; padding:0px; " class="button"  > 
</a>
</div>
<div style="float:right;width:90px">

<%



%>

<a href="Events.jsp?flag=0">
<img src="images/events_side.jpg" height=80px width=80px>
<br>
<input type="button" value="Events"style="width:80px;height:25px;color:#F6B300; padding:0px; " class="button" >
 </a>
 

</div>
</div>
</div>

<%
Statement st_count_msg=con.createStatement();
String sql_count_msg="select count(*) from mess_info where rid="+uid;
ResultSet rs_count_msg=st_count_msg.executeQuery(sql_count_msg);

int msg_count=0;
while(rs_count_msg.next())
{
	msg_count=rs_count_msg.getInt(1);
}

%>


<div style="float:right;width:290px">

<div style="float:left;width:100px;">
<a href="Conversation.jsp">
<img src="images/msgs.jpg" width=90px height=80px>
<br>
<input type="button" value="Messages"style="width:90px;height:25px;color:#F6B300; padding:0px; " class="button" >
 </a>
 
 
</div>

<div style="float:right;width:190px;">

<div style="float:left;width:100px;">
<a href="notification.jsp">
<img src="images/notification.jpg" width=90px height=80px>
<br>
<input type="button" value="notification" style="width:90px;height:25px;color:#F6B300; padding:0px; " class="button" > 
</a>

</div>

<div style="float:right;width:90px;">

<%
Statement st_count_frnds=con.createStatement();
String sql_count_frnds="select count(*) from permanent_friend where uid="+uid+" or friend_id="+uid;
ResultSet rs_count_frnds=st_count_frnds.executeQuery(sql_count_frnds);
int friend_count=0;
while(rs_count_frnds.next())
{
	friend_count=rs_count_frnds.getInt(1);
}

%>


<a href="privacy.jsp?friend_count=<%=friend_count %>">
<img src="images/privacy1.jpg" height=80px width=80px>
<br>
<input type="button" value="PRIVACY"style="width:80px;height:25px;color:#F6B300; padding:0px; " class="button" > 
</a>

</div>


</div>

</div>



</form>


  </div>



<!-- end of notif -->


<!-- <a href="Group.jsp"><input type="button" value="GROUPS( <%=i %> )"style="width:200px;height:35px;color:#F6B300" class="button" > </a>
-->
</div>
</div>

</div>
<!-- end of notif_img -->


  <%System.out.println("userid in div tabs center=="+uid);
  %>
  
<div id="sidebar_adv" style="height:500px;width:225px;padding:5px 5px 15px 5px;background-color:#ffffff;border:1px solid #ffffff;">


<%


%>
</div><!-- end of sidebar -->
 


<div id="tabs" style="left:700px;float:right;">
    <ul>
        <li><a href="#tabs-1"><font face="Palatino Linotype" size="5em" color="#FFFFFF">WALL</font></a></li>
        <li><a href="#tabs-2"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PERSONAL</font> </a></li>
        <li><a href="#tabs-3"><font face="Palatino Linotype" size="5em" color="#FFFFFF">PROFESSIONAL</font> </a></li>
    </ul>
    
    <div id="tabs-1"> 
    <script>
    <%System.out.println("userid in div tabs center personal=="+uid);
    %>
    $("#tabs-1").load("wall1.jsp");
	
	</script>
      
    </div>   
    
    
    <div id="tabs-2">
    <script>
    <%System.out.println("userid in div tabs center prof=="+uid);
    %>
 	$("#tabs-2").load("personal.jsp");
	</script>
    
    </div>
         
   	
    <div id="tabs-3">
    <script>
 	$("#tabs-3").load("professional.jsp");
	</script>       
    </div>
   </div>


<!-- end of tabs+ads cha madhla part of div -->


</div>



<div class="scroll-pane ui-widget ui-widget-header ui-corner-all">
	<div class="scroll-content" style="background:#F1EDE4;color:#3D2729;">
<table>
<tr>
<%
int fr_id=0;
int frnd_id=0;
int my_friend_id=0;
String fn=null;
String ln=null;


String sql1="select * from permanent_friend where uid="+uid+" or friend_id="+uid;
ResultSet rs1=st1.executeQuery(sql1);
System.out.println("done wd exec");

while(rs1.next())
{
System.out.println("in permanent  wala while");
fr_id=rs1.getInt("friend_id");
frnd_id=rs1.getInt("uid");

	if(fr_id != uid)
		{
		my_friend_id=fr_id;
		}
	else
		{
		my_friend_id=frnd_id;
		}


System.out.println("This is my friend..."+my_friend_id);



System.out.println("jst outside slider!");
%>

      
<%
System.out.println("in div1");
ResultSet rs2=st2.executeQuery("select * from basic_info where uid="+my_friend_id);
System.out.println("after executing select query!");
while(rs2.next())
{ %>
<td>
<center>
<%
	userid=rs2.getInt("uid");
	fn=rs2.getString("first_name");
	ln=rs2.getString("last_name");
	pic_id=rs2.getInt("p_id");
	System.out.println("first :"+fn);
	System.out.println("last name:"+ln);
	System.out.println("last name:"+pic_id);
	
	System.out.println("in div2");
	%>


 <%System.out.println("name displayed of user"); %>



  <%
  System.out.println("in div3");
  String sql4=("select * from album where uid="+my_friend_id+" and album_names='profile'");
   
     ResultSet rs11=st9.executeQuery(sql4);
	 
     boolean empty1=true;
	 
     while(rs11.next())
	 {
		 empty1=false;
	 }
	 
      if(pic_id==0)
      {
    	  System.out.println("no profile picture has been added!");
    	  
    System.out.println("userid="+userid);	  
			%> 	
	   	
	   	<a href="checkfriend.jsp?fuid=<%=userid%>">
<%
	  // 	session.setAttribute("frienduid",userid);
   	    %>
    	  	<img src="images/default.jpg" alt="no profile" width="100" height="100">
			<br>
 	
			<label><font color="#3D2729"><%= rs2.getString("first_name") %></font></label>
			<label><font color="#3D2729"><%= rs2.getString("last_name") %></font></label>
			</a>
    	
    	  
    	  
    	  <%
      }//end of if(empty)
    	  
      else
      {
    	  System.out.println("pic id="+pic_id);
     	String sql116="select * from image_try where p_id="+pic_id;
     	ResultSet rs36=st36.executeQuery(sql116);
     	String path=null;
     	while(rs36.next())
     	{
         	path=rs36.getString("img_path");
     	}


        System.out.println("userid="+userid);	  
    			
     	%>
     	

	   	<a href="checkfriend.jsp?fuid=<%=userid%>">
	   	<%
	   	//session.setAttribute("frienduid",userid);
   	    %>
   	    <img src="<%=path%>" alt="profile picture" width="100" height="100">
   	     <br>
		<label><font color="#3D2729"><%= rs2.getString("first_name") %></font></label>
		<label><font color="#3D2729"><%= rs2.getString("last_name") %></font></label>
		</a>
	     
	     <%
	     

      }
  
     	  
    	   
%>
</center>
</td>

<%
}
}

	
%>
</tr>
  </table>
  </div>

  <div class="scroll-bar-wrap ui-widget-content ui-corner-bottom" >
    
    <div class="scroll-bar"></div>
</div>
</div>
</div>
</div>
</div>
<% 

} // end of session wala if

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

