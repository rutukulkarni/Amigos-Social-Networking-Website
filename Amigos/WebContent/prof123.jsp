<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html lang="en">
<head>
 <meta charset="utf-8" />
  <title>jQuery UI Slider - Slider scrollbar</title>
  
     <link rel="stylesheet" href="style.css" />
  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
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

//alert("in chk frnd");
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}


</script>


      
</head>

<body>

<div id="menu">
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			<li class="current_page_item"><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			<!-- <li><a href="#">Groups</a></li>   -->
	 			
			<li>
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="50px">
			<img src="images/icon-search.png" height=20px width=30px style="padding:0px;"></a></li>
			<li><a href="selectAdType.jsp">Advertise</a></li>
			<li><a href="login.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>


<%@ page import="java.sql.*"%>



<script type="text/javascript">
		function check_friend()
{
//String firstname=document.getElementById("searchFirstname").value;
//String lastname=document.getElementById("searchLastname").value;
 window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;
		   

}
</script>
<br>
<br>
<%

//start here
// AMIGOS WALA PROF PAGE

System.out.println("in prof.jsp!");
//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);
//int fuid1=0;
//String equal123=null;

if(session.getAttribute("name")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String getname1 = session.getAttribute("name").toString();
System.out.println("in prof.jsp getname1="+getname1);
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

ResultSet rs10=st10.executeQuery("select * from basic_info where username ='"+getname1+"'");

//ResultSet rs1=st1.executeQuery("select uid from basic_info where fname ='"+searchFirstname+"' AND lname='"+searchLastname+"'");

String uid1=session.getAttribute("uid").toString();
Integer uid=Integer.parseInt(uid1);

System.out.println("in prof.jsp uid= "+uid);


if(rs10.next()){
	
//out.println("WELCOME !!!");
//out.println(rs.getString("firstname")+"<br>");

//String userid = (String)session.getAttribute(rs.getString("uid").toString);
System.out.println("in prof.jsp after connection!");

//String uid = session.getAttribute("uid").toString();


//session.setAttribute("userid",userid);

System.out.println("Session uid in prof.jsp is : "+uid+"\n");
session.setAttribute("fuid1",uid);
System.out.println("Session fuid1 in prof.jsp is : "+fuid1+"\n");
//out.println(userid);

}


//mamscha laptopmadhe uncomment kara..string uid ahe tyat..devikas computer madhe uid int ahe na!

String userid1=session.getAttribute("uid").toString();

Integer userid = Integer.parseInt(userid1);


String getname = (String) session.getAttribute("name");

String getpwd = request.getParameter("pwd");



System.out.println("in prof_mam.jsp 1st name="+getname1+"\n");

session.setAttribute("getname",getname1);

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


String sql="select * from basic_info where uid="+userid;
ResultSet rs=st.executeQuery(sql);
System.out.println(sql);

int fuid=0;
int pic_id=0;
while(rs.next())
{
String pic_id1=rs.getString("p_id");
pic_id=Integer.parseInt(pic_id1);
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

  <div class="post">
  <div id="notif_img">
  
  <div id="img">


          <%
    
    String sql6=("select * from album where uid="+uid+" and album_names='profile'");
   
     ResultSet rs3=st5.executeQuery(sql6);
	 
     boolean empty=true;
	 
     while(rs3.next())
	 {
		 empty=false;
	 }
	 
      if(empty)
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
<a href="home.jsp" style="text-decoration:underline"><font size=3px>Edit Profile</font></a>
</div>

<div style="float:right;left:80px;">
<a href="images_try2.jsp">
<img src="images/change_prof.jpg" alt="change profile picture" width="20px" height="20px" title="Change Profile Picture."></a>
</div>
</div>

</div>
     
  


	
	
   <div id="notif" style="width:175px;left:1300px">
<% 

st25=con.createStatement();

ResultSet rs25=st25.executeQuery("select count(*) from friend_request where reciever_uid=" +uid);

int i=0;

while(rs.next())
{

	i=rs.getInt(1);
	//out.println(" YOU HAVE FRIEND REQUESTS FROM :"+ );
	
	
}  // end of rs

System.out.println("friend reqs = "+i);
//response.sendRedirect("awall.jsp");

//to display all contents of table wall_posts
%>


<form name="side-menu">
<p><a href="confirm_friend.jsp"><input type="button" value="FRIEND REQUESTS( <%=i %> )"style="width:200px;height:35px;color:#F6B300; padding:0px " class="button"  > </a>
<a href="message.jsp"><input type="button" value="MESSAGES( <%=i %> )"style="width:200px;height:35px;color:#F6B300" class="button" > </a>
<a href="Events.jsp"><input type="button" value="EVENTS( <%=i %> )"style="width:200px;height:35px;color:#F6B300" class="button" > </a>
<a href="Group.jsp"><input type="button" value="GROUPS( <%=i %> )"style="width:200px;height:35px;color:#F6B300" class="button" > </a>
<a href="notification.jsp"><input type="button" value="NOTIFICATIONS"style="width:200px;height:35px;color:#F6B300" class="button" > </a>
</form>

  </div>
<!-- end of notif -->

   <center>
  <div style="width:200px;left:100px;">
<br>
    
    <label for="Gender">Gender :<%=rs10.getString("gender") %> </label><br>

	     <label for="Dob">Date of Birth : <%=rs10.getString("dob") %></label><br>

	     <label for="mood">Mood : Happy :-)</label><br>
	
    
    </div>
	</center>

</div>


</div>



  <%System.out.println("userid in div tabs center=="+uid);
  %>
  
  <div id="sidebar_adv" style="float:left;width:100px;height:300px;">

<%


%>
</div><!-- end of sidebar -->
 


<div id="tabs" style="left:700px;float:right;">
    <ul>
        <li><a href="#tabs-1"><font face="Palatino Linotype" color="#F6B300" size="5em" >Personal</font></a></li>
        <li><a href="#tabs-2"><font face="Palatino Linotype" color="#F6B300" size="5em" >Professional</font> </a></li>
        <li><a href="#tabs-3"><font face="Palatino Linotype" color="#F6B300" size="5em" >Wall</font> </a></li>
    </ul>
    
    <div id="tabs-1"> 
    <script>
    <%System.out.println("userid in div tabs center personal=="+uid);
    %>
 	 $("#tabs-1").load("personal.jsp");
	</script>
      
    </div>   
    
    
    <div id="tabs-2">
    <script>
    <%System.out.println("userid in div tabs center prof=="+uid);
    %>
 	$("#tabs-2").load("professional.jsp");
	</script>
    
    </div>
         
   	
    <div id="tabs-3">
    <script>
 	$("#tabs-3").load("wall1.jsp");
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
	 
      if(empty1)
      {
    	  System.out.println("no profile picture has been added!");
    	  
    System.out.println("userid="+userid);	  
			%> 	
	   	
	   	<a href="checkfriend.jsp?uid=<%=userid%>">
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
     	

	   	<a href="checkfriend.jsp?uid=<%=userid%>">
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
</body>
</html>

