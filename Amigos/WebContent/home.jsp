
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    <%@ page import="java.sql.*"%>

<!DOCTYPE html PUBIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
     <link rel="stylesheet" href="style.css" />
     
     <link rel="shortcut icon" href="images/favicon.ico" />
<script type="text/javascript" src="jq1.js"></script>
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#sidebar_adv').load('ad_display.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds
</script>
 <script type="text/javascript"> 

function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} f
} 

document.onkeypress = stopRKey; 

</script>





<script>

function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}


</script>

<script>

$(function(){
    $('#sidebar_adv').load('ad_display.jsp');
});


function like(wall_id)
{
//	alert("hi "+wall_id);   
	window.location.href="like.jsp?wall_id="+wall_id;	
}

function privacy()
{
	//alert("in privacy settings!");   
	window.location.href="privacy.jsp";	
}

function dislike(wall_id)
{
	//alert("hi "+wall_id);   
	window.location.href="dislike.jsp?wall_id="+wall_id;	
}



function comment(wall_id)
{
//document.out("comment = "+comment);
//alert("hi " +wall_id);
alert("wall id= "+wall_id);
window.location.href="comment.jsp?wall_id="+wall_id;
		//+"&comment="+document.getElementById("comment1").value; 
}


</script>




</head>

<body>
<%

/*
String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);
*/

if(session.getAttribute("uid123")!=null) // session has not been invalidated yet or it still exists 
{ 
	
//uname=(String)session.getAttribute("uname");
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//System.out.println("in prof.jsp getname1="+getname1);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st3=con.createStatement();
Statement st33=con.createStatement();
Statement st5=con.createStatement();
Statement st10=con.createStatement();
Statement st20=con.createStatement();
Statement st21=con.createStatement();
Statement st22=con.createStatement();
Statement st23=con.createStatement();
Statement st6=con.createStatement();
Statement st50=con.createStatement();
Statement st51=con.createStatement();
Statement st136=con.createStatement();
Statement st176=con.createStatement();
Statement st656=con.createStatement();
Statement st456=con.createStatement();
Statement st457=con.createStatement();
Statement st129=con.createStatement();
Statement st126=con.createStatement();
Statement st356=con.createStatement();
Statement st119=con.createStatement();
Statement st118=con.createStatement();
Statement st256=con.createStatement();
Statement st56=con.createStatement();
Statement st58=con.createStatement();
Statement st116=con.createStatement();
String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
System.out.println("!!!!! UID in home :: "+uid);
String name33=null;
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

<%
int pic_id=0;
String sql3="select * from basic_info where uid="+uid;
ResultSet rs33=st33.executeQuery(sql3);
while(rs33.next())
{
	name33=rs33.getString("first_name");
	pic_id=rs33.getInt("p_id");
	System.out.println("!!!! FIRST NAME :: "+name33);
	System.out.println("p_id="+pic_id);
}
%>



<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">

  
  
  <div>
  <div class="post" style="width:1050px;height:220px;">
<div style="float:left;width:230px;height:200px;">
<h3>Welcome <%=name33 %>&nbsp;&nbsp;&nbsp;!</h3>


<br>
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
     </div>  

<div style="float:right;width:820px;">
<!-- <div id="center_status" style="position:relative;margin:0px auto;width:250px;height:200px;color:#3D2729;border: 1px solid  #F1EDE4;" >
-->
<div class="post" style="height:90px;padding: 10px 10px;">
<center>
		<%
		String sql_curr_post="select * from wall_posts where s_id="+uid+" and r_id="+uid+" and status!='"+null+"'";
	
		System.out.println("current status post = "+sql_curr_post);
		Statement st_curr_post=con.createStatement();
		ResultSet rs_curr_post=st_curr_post.executeQuery(sql_curr_post);
		String curr_post=null;
		while(rs_curr_post.next())
		{
			curr_post=rs_curr_post.getString("text_content");
		}
		%>
		
		<label><font color="#F6B300" face="Palatino Linotype" size="4em">
		Your recent Status Update :</font>
		<font  color="#3D2729" face="Palatino Linotype" size="4em"></label> <%=curr_post %> </font>
		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<br>
		
<form name="HOME WALL " action="post_status.jsp" method="POST">
<div style="width:580px;">
<div style="float:left;width:430px;">
	<div style="float:left;width:230px;">
		<label><font color="#F6B300" face="Palatino Linotype" size="4em">Update your status here... </font></label>
	</div>
	
	<div style="float:right;width:200px;">
	
		
		
<!-- <textarea id="wallpost" cols="35" rows="2" placeholder="Whats on your mind...??" style="font-family:cursive; border-color:#F6B300; " >
</textarea> -->
<input type="text" id="search-text" name="wallpost" id="wallpost" placeholder="Whats on your mind...??" style="width:200px;height:30px;font-family:cursive; border-color:#F6B300; " >


	</div>
</div>

<div style="float:right;width:150px;">
		<input type="submit" value="Post" style="width:100px;height:40px;color:#F6B300" class="button">

</div>
</div>
	
</form>
</center>
</div>
<div style="margin:0px;width:660px;float:right;">

<% 


Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select count(*) from friend_request where reciever_uid=" +uid);

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

<div style="float:left;width:330px;padding:0 px;">
<div style="float:left;width:110px;">


<%
int fr_id=0;
int frnd_id=0;
int my_friend_id=0;
String fn=null;
String ln=null;
int count_friends=0;
Statement st1233=con.createStatement();
String sql1233="select count(*) from permanent_friend where uid="+uid+" or friend_id="+uid;
ResultSet rs1233=st1233.executeQuery(sql1233);
System.out.println("done wd exec");

while(rs1233.next())
{
	count_friends=rs1233.getInt("count(*)");
	System.out.println("count of friends:="+count_friends);
}	

session.setAttribute("fuid1",uid);
%>
<a href="show_friends.jsp?count_friends=<%=count_friends%>">

<img src="images/frnds.jpg" height=80px width=100px> 
<br>
<input type="button" value="Friends(<%=count_friends %>)" style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button"  > 
</a>

</div>
<div style="float:right;width:220px;">
<div style="float:left;width:110px">
<a href="confirm_friend.jsp">

<img src="images/addfrnd.jpg" height=80px width=100px> 
<br>
<input type="button" value="Frnd Requests( <%=i %> )"style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button"  > 
</a>
</div>
<div style="float:right;width:110px">


<a href="Events.jsp?flag=0">
<img src="images/events_side.jpg" height=80px width=100px>
<br>
<input type="button" value="Events"style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button" >
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


<div style="float:right;width:330px">

<div style="float:left;width:110px;">
<a href="Conversation.jsp">
<img src="images/msgs.jpg" width=100px height=80px>
<br>
<input type="button" value="Messages"style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button" >
 </a>
 
 
</div>

<div style="float:right;width:220px;">

<div style="float:left;width:110px;">
<a href="notification.jsp">
<img src="images/notification.jpg" width=100px height=80px>
<br>
<input type="button" value="Notification" style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button" > 
</a>

</div>

<div style="float:right;width:110px;">

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
<img src="images/privacy1.jpg" height=80px width=100px>
<br>
<input type="button" value="PRIVACY"style="width:100px;height:25px;color:#F6B300; padding:0px; " class="button" > 
</a>

</div>


</div>

</div>



</form>


  </div>



<!-- end of notif -->


</div><!-- //end of notification+image -->
</div>
</div>
</div>

<div id="sidebar_adv" style="height:600px;width:225px;padding:5px 5px 15px 5px;background-color:#ffffff;border:1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->


<div id="home_content">
<div class="post">
<div style="width:700px;">
<%

Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st93=con.createStatement();
ResultSet rs2=st2.executeQuery("select count(w_id)from wall_posts where s_id='"+uid+"' OR r_id='"+uid+"'");

int count=0;
String time=null;
while(rs2.next())
{
	//count=rs.getString("");
	count=rs2.getInt(1);
	 //time=rs2.getString("time");


}  //end of rs2


//System.out.println("count= "+count);
String sql="select * from wall_posts  where s_id='"+uid+"'OR r_id='"+uid+"'order by w_id desc ";
ResultSet rs1=st1.executeQuery(sql);
//int uid=0;
System.out.println(sql);
System.out.println("!!!! AFTER WALL POST QUERY ");
int count1=0;
int fuid=0;
int image_content=0;
int type=0;
int p=0;
String datetime="";
String status="";
%>

<div id="center" class="middle-content">
<% 
while(count1!=count)
{
	if(rs1.next())
	{
		String s_uid=rs1.getString("s_name");
		int checker=1;
		int checker1=1;
		
	
		System.out.println("NEW ::::     SNAME- "+s_uid);
		String r_uid=rs1.getString("r_name");
		System.out.println("NEW ::::     RNAME- "+r_uid);
		fuid=rs1.getInt("r_id");
		System.out.println("!!!! FUID :: "+fuid);
		String text_content=rs1.getString("text_content");
		status=rs1.getString("status");
		if(status==null)
		{
			System.out.println("in home status is null");
		}
		else
		{
			System.out.println("in home status is not null");
		}
		System.out.println("status = "+status);
		System.out.println("text-content="+text_content);
		image_content=rs1.getInt("image_content");
	 	type=rs1.getInt("type");
	 	datetime=rs1.getString("time");
	 	int s_id=rs1.getInt("s_id");
	 	int r_id=rs1.getInt("r_id");
	 	time=rs1.getString("time");
	 //---------------------------------ADDED BY ARUN TO SEPARATE DATE AND TIME----------------------
	//String []s_time=time;
 		String[] timedate=null;
		String s=datetime; 
		
		timedate=s.split(" ");
		System.out.println("result after splitting date and time = "+timedate);
		System.out.println("after splitting s= "+s);
		String y="";
		int count_timedate=0;
		String date123="";
		String time123="";
		for (int x=0; x<timedate.length && timedate[x]!=""; x++) 
		{
		
			y=timedate[x];
			System.out.println("!!!!!!!!!!!!!! Y after splitting date and time ="+y);
		
	
		}
		date123=timedate[0];
		time123=timedate[1];
	 	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! DATE123 = "+date123);
	 	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! TIME123 = "+time123);
	
	 
	 //-------------------------------------------------------------------------------------------------
		int wall_id=rs1.getInt("w_id");
	 	time=rs1.getString("time");

		System.out.println("time of wall_id::"+wall_id+" is ::"+time );
	 
	 	if(type==1)
	 	{
			System.out.println("to be displayed images!");
			Statement st4=con.createStatement();	
			String sql2="select * from image_try where p_id="+image_content;
			ResultSet rs4=st4.executeQuery(sql2);

			System.out.println("after query!");
			String path=null;
				
			while(rs4.next())
			{
				path=rs4.getString("img_path");
				System.out.println("path fetched!");
				
				Statement st12=con.createStatement();	
				String sql12="select * from basic_info where uid="+s_id;
				ResultSet rs12=st12.executeQuery(sql12);
				String sender_name="";
				int sender_id=0;
				
				while(rs12.next())
				{
					sender_id=rs12.getInt("uid");
					pic_id=rs12.getInt("p_id");
			 	    sender_name=rs12.getString("username");
				}

						
				Statement st123=con.createStatement();	
				String sql123="select * from basic_info where uid="+r_id;
				ResultSet rs123=st123.executeQuery(sql123);
				String receiver_name="";
				while(rs123.next())
				{
							 
					 receiver_name=rs123.getString("username");
				}

						
						
						
				%>
				<br>
				<img src="<%=path %>" alt="wall picture" width=200px height=200px>
				<%
				System.out.println("!!!! BEFORE POSTED PICTURE LABEL!");
				%>
				<label><a href='#'>
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
     				String path123=null;
     				while(rs116.next())
     				{
         				path123=rs116.getString("img_path");
     				}

		     	%>
     	  	    <img src="<%=path123%>" alt="profile picture" width="50" height="50">

	  		   <%

      			}
     
      			if(s_id==r_id)
      			{
    	  			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! IN IF CASE"+text_content);
    	  			
    	  		%>
    	  			<a href="checkfriend.jsp?fuid=<%=s_id%>" style="text-transform:capitalize;size:4em"><%=sender_name%></a>
    	  			<font color="#3D2729" face="Palatino Linotype" size="3em"> posted 
    	  			<font face="Palatino Linotype" size=3em color="#58ACFA">
    	  			<b><%=text_content %></b></font>
    	  			<%
      		
      				
      			}
      			else
      			{
    	  			System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! IN ELSE CASE"+text_content);
     			%>
     
	  				<a href="checkfriend.jsp?fuid=<%=s_id%>" style="text-transform:capitalize;size:4em">
	  				
	  				<%=sender_name%><font color="#3D2729" face="Palatino Linotype" size="3em"></font></a> posted
	  				</font>
	  				
	  				<font face="Palatino Linotype" size=3em color="#58ACFA">
	  				 <b><%=text_content %></b>
	  				 </font>
	  				  <font color="#3D2729" face="Palatino Linotype" size="3em"> 
	  				  on wall of
	  				  </font>
	  				  
	  				  <a href="checkfriend.jsp?fuid=<%=r_id%>" style="text-transform:capitalize;size:4em" ><%=receiver_name%></a>
      				<div>
						<br>
						<form name="trial" action="comment.jsp" method="POST">
							<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >	<br>
							<textarea name="post" id="search-text" cols="25" rows="5" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;color:#3D2729; "></textarea>
							<input type="image" src="images/comment.jpg" alt="Submit" height="30px" width="40px" style="height:30px ;width:40px"><br>
							<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/like.jpg" height="30px" width="30px">
							<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislike.jpg" height="30px" width="30px">
							<br>
						</form>
					 <div>
	 			<%
      			}
	 			System.out.println("wall_id="+wall_id);
	 			%>
   	 		</div>
   			<br>
   
		   	<%
		} //end of rs4
	 } //end of type==1
	 else
	 {
	
		 System.out.println("!!!! IN ELSE OF TYPE==1");
		 Statement st8=con.createStatement();
		 Statement st82=con.createStatement();
			
		 String sql82="select * from basic_info where uid="+s_id;
			ResultSet rs82=st82.executeQuery(sql82);
			String sender_name="";
			int sender_id=0;
			
			while(rs82.next())
			{
							pic_id=rs82.getInt("p_id");
		 	
			}
		/*
		ResultSet rs93=st8.executeQuery("select * from permanent_friend where uid='"+uid+"' OR friend_id='"+uid+"'");
		System.out.println("select * from permanent_friend where uid='"+uid+"' OR friend_id='"+uid+"'");
		*/
		String friend_list[]=new String[100];
		//OR uid='"+fuid +"'
		int check_uid=0;
		//System.out.println("before while in home.jsp");
		/*
		while(rs93.next())
		{
			
			
				if(rs93.getInt("friend_id")!=uid)
					check_uid=rs93.getInt("friend_id");
				else
					check_uid=rs93.getInt("uid");
		
				System.out.println("check_uid= "+check_uid);
				*/
			// oo if (check_uid==0)
			// oo {
				//System.out.println("not friends!");
			// oo}
			// oo		else
		// oo	{	%>
		<br> </br>
				<% 	
					System.out.println("NAME : " +s_uid+ "POSTED THIS :   " +text_content+ "ON WALL OF :   " +r_uid);
				%>
				<%
			//	String sql58=("select * from album where uid="+s_id+" and album_names='profile'");
	   
    			// ResultSet rs58=st58.executeQuery(sql58);
	 
			     //boolean empty_name1=true;
	 
			     //while(rs58.next())
	 			//{
		 			//empty_name1=false;
	 			//}
	 %>
	 
	 
	 <div style="width:680px;height:50px;">
	 <div style="float:left;width:500px;">
	 
	 <div style="float:left;width:60px;">
				<label><a href="checkfriend.jsp?fuid=<%=s_id%>">

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
     	String sql118="select * from image_try where p_id="+pic_id;
     	ResultSet rs118=st118.executeQuery(sql118);
     	String path1234=null;
     	while(rs118.next())
     	{
         	path1234=rs118.getString("img_path");
     	}

     	%>
     	   	     <img src="<%=path1234%>" alt="profile picture" width="50" height="50">

	     <%

      }
      	%>  	
</a>
      </div>
 
      <div style="float:right;width:440px;">
      <%
      if(s_id==r_id)
      {
    	  System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! IN IF CASE"+text_content);
  		if(status!=null)
			{
		System.out.println("status is not null");
			
				%>
					<a href="checkfriend.jsp?fuid=<%=s_id%>" style="text-transform:capitalize;size:4em"><%=s_uid%></a>
			<font color="#3D2729" face="Palatino Linotype" size="3em"> has recent update as  
			<font face="Palatino Linotype" size=3em color="#58ACFA">
			<b><%=status %></b></font>
	
				<% 
			}// end of  if status null
	
			else
			{
     
     
     %>
     
    	  			<a href="checkfriend.jsp?fuid=<%=s_id%>" style="text-transform:capitalize;size:5em"><%=s_uid%></a>
    	  			<font color="#3D2729" face="Palatino Linotype" size="3em"> posted 
    	  			<font face="Palatino Linotype" size=3em color="#58ACFA">
    	  			<b><%=text_content %></b></font>
    	  			<%
      } // end of else part of if status is null
			
      }
      else
      {
    	  System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! IN ELSE CASE"+text_content);
    	  %>
    			<a href="checkfriend.jsp?fuid=<%=s_id%>" style="text-transform:capitalize;size:5em">
	  				
	  				<%=s_uid%></a><font color="#3D2729" face="Palatino Linotype" size="3em"> posted
	  				</font>
	  				
	  				<font face="Palatino Linotype" size=3em color="#58ACFA">
	  				 <b><%=text_content %></b>
	  				 </font>
	  				  <font color="#3D2729" face="Palatino Linotype" size="3em"> 
	  				  on wall of
	  				  </font>
	  				  
	  				  <a href="checkfriend.jsp?fuid=<%=r_id%>" style="text-transform:capitalize;size:5em" ><%=r_uid%></a>		
    	  <%
      }
		%>	<br>
		
		</div>
		</div>
	
	 <div style="float:right;width:180px;">
	 	<font face="Palatino Linotype" size=2em color=#3D2729>Posted On:</font>
	 	 	<font face="Palatino Linotype" size=3em color=#3D2729>
	 	 				<%=date123 %></font>
				
				</div>
				</div>
				
	 <br> 
   	<%
   	//------------------------------------
   	String name9998="";
   	Statement st999=con.createStatement();
   	String sql999="select * from wall_posts where w_id='"+wall_id+"'";
ResultSet rs999=st999.executeQuery(sql999);  
  	 String name999=null;
     while(rs999.next())
     {
     	name999=rs999.getString("likes");
        name9998=rs999.getString("dislikes");   	
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
		
		String sql888="select * from basic_info where uid= '"+y999+"'";
		rs888=st888.executeQuery(sql888);
		

		while(rs888.next())
	
		{
			w=rs888.getString("username");
			//System.out.println("for wallpost id :: "+wall_id+ "dis person liked it :: "+w);
			//out.print(""+w+",");
		
			//likes123[z]=w;
			z++;
		}

		//count999++;
	}

//---------------------------------------FOR DISLIKES-----------------------------------------------
String s9998=name9998;
	String y9998="";
	String [] names9998;
	String[] result9998=s9998.split(",");
	int count9998=0;
	int z8=0;
	for (int x=0; x<result9998.length; x++) 
	{
		y9998=result9998[x];
	
		count9998=count9998+1;
		String w8="";
		Statement st8889=con.createStatement();
		ResultSet rs8889; 
		
		String sql8889="select * from basic_info where uid= '"+y9998+"'";
		rs8889=st8889.executeQuery(sql8889);
		

		while(rs8889.next())
	
		{
			w8=rs8889.getString("username");
			z8++;
		}

		//count9998++;
	}



//---------------------------------------------------------------------------------------
  
	session.setAttribute("wall_id",wall_id);   	
   	%>
	<form name="trial" action="comment.jsp" method="POST">
		<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" ><br>
		<textarea name="post" id="post" cols="20" rows="2" placeholder="Enter your comments here ... " id="search-text"></textarea>
		<input type="image" src="images/comment.jpg" alt="Submit" height="30px" width="40px"  style="height:30px ;width:40px"><br>
		<%
		
		String s9=name999;
		String y9="";
		String [] names9;
		String[] result9=s9.split(",");
		for (int x=0; x<result9.length; x++) 
		{
			y9=result9[x];
		int y1=Integer.parseInt(y9);
		if(uid==y1)
		{
			checker=0;
			break;
		}
		
		} // end of for loop
		if(checker!=0)
		{
		%>
		<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/like.jpg" height="30px" width="30px">
		<%
		//checker=0;
		} // end of if checker!=1
		
		String s8=name9998;
		String y8="";
		String [] names8;
		String[] result8=s8.split(",");
		for (int x=0; x<result8.length; x++) 
		{
			y8=result8[x];
		int y2=Integer.parseInt(y8);
		if(uid==y2)
		{
			checker1=0;
			break;
		}
		
		} // end of for loop
		if(checker1!=0)
		{
		%>
		<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislike.jpg" align="top" height="30px" width="30px">
		<br>
		<%
		//checker1=0;
		} // end of if checker1 !=1
		
		%>
	</form>
	<%
		if(result999.length==0)
		{
			
		}
		else
		{
	%>
  			<label><a href="home2.jsp?wall_id=<%=wall_id%>"><%=result999.length%><label> LIKES</label></a></label>
  			<%
		} // end of else result999.length==0
  	
  	if(result9998.length==0)
		{
			
		}
		else
		{
	%>
	<br>
  			<label><a href="home3.jsp?wall_id=<%=wall_id%>"><%=result9998.length%><label> DISLIKES</label></a></label>
  			<%
		} // end of else result9998.length==0
  	%>
  	
  	
	 <br>
   	
	<%

		Statement st888=con.createStatement();
		String sql888="select count(*) from comments where w_id='"+wall_id+"'";
		ResultSet rs888=st888.executeQuery(sql888);
		int no_of_comments123=0;
		int no_of_comments234=0;
		int no_of_comments=0;
		while(rs888.next())
		{
			no_of_comments123=rs888.getInt("count(*)");
		}
		/*
		
		Statement st8889=con.createStatement();
		String sql8889="select count(*) from comment_pictures where commentor='"+uid+"'";
		ResultSet rs8889=st8889.executeQuery(sql8889);
		//int no_of_comments123=0;
		//int no_of_comments234=0;
		while(rs8889.next())
		{
			no_of_comments234=rs8889.getInt("count(*)");
		}
		
		
		
		//System.out.println("!!!! NO OF COMMENTS = "+no_of_comments);
		//session.setAttribute("wall_id",wall_id);
		no_of_comments=no_of_comments123+no_of_comments234;
		*/
	%>
	<label><a href="home1.jsp?wall_id=<%=wall_id%>"><%=no_of_comments123%> COMMENTS</a>   </label>
	<% 
	/*
	for(z=0; z<likes123.length ;z++)
	{
		if(likes123[z]!=null)
		{*/
	%>
	<br>
	<%
	/*
}
}
*/
%>
		
	<!-- post ended here(posted on wall of) -->
		 
		<br><label> <u style="color:white;">____________________________________________________________________________________________________________ </u> </label>
		</br>		
		
		  </label>
		<% 
		
	//	}  //end of else
		
		
//	} // end of while rs3
		
	 } //end of else typewala!
} //end of rs1
	
	
count1=count1+1;

} //end of outer while
%>

<!-- friends part ahe -->
</div>

<% 
Statement st4=con.createStatement();
ResultSet rs4=st4.executeQuery("select * from permanent_friend where uid = '"+uid +"' OR friend_id= '"+uid+"'");
int frnd=0;
int frnd1=0;
int friend_owner=0;
while(rs4.next())
{
	frnd=rs4.getInt("uid");
	frnd1=rs4.getInt("friend_id");
	
	Statement st55=con.createStatement();
	ResultSet rs55=st55.executeQuery("select * from basic_info where uid = '"+frnd+"'");
String name1="";

while(rs55.next())
{
	friend_owner=rs55.getInt("uid");
	name1=rs55.getString("username");
}
//end of rs5	

Statement st66=con.createStatement();
ResultSet rs66=st66.executeQuery("select * from basic_info where uid = '"+frnd1+"' "); 
//order by friendship_id desc
String name2="";

while(rs66.next())
{
name2=rs66.getString("username");
}  //end of rs6

%>
 <div style="width:680px;height:50px;">
	 <div style="float:left;width:500px;">
	 
	 <div style="float:left;width:60px;">
	
<%  if(pic_id==0)
      {
    	  System.out.println("no profile picture has been added!");
    	  %>
    	  
    	  <a href="checkfriend.jsp?fuid=<%=frnd%>"><img src="images/default.jpg" alt="no profile" width="50" height="50"  >
    	  <font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  <%=name1 %>
    	  </font>
    	  </a>
    	  
    	  <%
      }//end of if(empty)
 
      else
      {
  	 	  System.out.println("pic id="+pic_id);
     	String sql119="select * from image_try where p_id="+pic_id;
     	ResultSet rs119=st119.executeQuery(sql119);
     	String path1235=null;
     	while(rs119.next())
     	{
         	path1235=rs119.getString("img_path");
     	}

     	%>
     	   	     <a href="checkfriend.jsp?fuid=<%=frnd%>"><img src="<%=path1235%>" alt="profile picture" width="50" height="50">
     	   	     <font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  <%=name1 %>
    	  </font></a>

	     <%

      }
      	  	
     %>
	</div>

<div style="float:right;width:440px;">
<font color="#F6B300" face="Palatino Linotype" size="3em">is now friends with </font><a href="checkfriend.jsp?fuid=<%=frnd1%>">
<font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  <%=name2 %>
    	  </font></a>	 
		<br><label> <u style="color:white;">____________________________________________________________________________________________________________ </u> </label>
			</div>
			
			</div>
			
			
			
			</div>
			<% 

Statement st7=con.createStatement();
ResultSet rs7=st7.executeQuery("select * from comments where commentor = '"+frnd1+"' ");

Statement st189=con.createStatement();

String commentor="";
String r_name="";
String wall_id="";
String comment_text="";
while(rs7.next())
{
	commentor=rs7.getString("commentor");
	wall_id=rs7.getString("w_id");
	
	String sql189="select * from wall_posts where w_id="+wall_id;
	ResultSet rs189=st189.executeQuery(sql189);
	String wall_content=null;
	int r_id=0;
	while(rs189.next())
	{
		wall_content=rs189.getString("text_content");
		r_id=rs189.getInt("r_id");
	}
	
	comment_text=rs7.getString("comment_text");
	//System.out.println("wall_post in home.jsp :: = "+wall_id);
	
	Statement st8=con.createStatement();
	ResultSet rs8=st8.executeQuery("select * from wall_posts where w_id = '"+wall_id+"' ");

	Statement st1261=con.createStatement();

	Statement st856=con.createStatement();
	
	Statement st9=con.createStatement();
	ResultSet rs9=st9.executeQuery("select * from basic_info where uid = '"+commentor+"' ");
	String commentor_name="";
	int commentor_id=0;
	
	while(rs9.next())
	{
		commentor_id=rs9.getInt("uid");
		commentor_name=rs9.getString("username");
		time=rs9.getString("time");
	}  //end of rs9
	
	int type123=0;
	while(rs8.next())
	{
		r_name=rs8.getString("r_name");
		type123=rs8.getInt("type");
		
		System.out.println("NEW         ::: TYPE123 = "+type123);
		%>
		<br></br>
		

  	  <a href="checkfriend.jsp?fuid=<%=r_id%>">
		
		<%
		//out.println("  "+commentor_name+"commented on wallpost of:"+r_name);
				if(type123==0)
		{
		%>
	
 <div style="width:680px;height:50px;">
	 <div style="float:left;width:500px;">
	 
	 <div style="float:left;width:60px;">
	 
	<%	      if(pic_id==0)
	      {
	    	  System.out.println("no profile picture has been added!");
	    	  %>
	    	  <img src="images/default.jpg" alt="no profile" width="50" height="50"  >
	    	  </a>
	    	  <%
	      }//end of if(empty)
	 
	      else
	      {
	  	 	  System.out.println("pic id="+pic_id);
	     	String sql1261="select * from image_try where p_id="+pic_id;
	     	ResultSet rs1261=st1261.executeQuery(sql1261);
	     	String path12361=null;
	     	while(rs1261.next())
	     	{
	         	path12361=rs1261.getString("img_path");
	     	}

	     	%>
	     	<a href="checkfriend.jsp?fuid=<%=r_id%>">
	     	   	     <img src="<%=path12361%>" alt="profile picture" width="50" height="50">

	     	   	     
	</a>
		     <%

	      }
	     
		%>
	 </div>    
	    	    
	<div style="width:440px;float:right;">    
	    <font color="#F6B300" face="Palatino Linotype" size="3em"><b><%=r_name%> &nbsp;: </b></font>
	    <font color="#F6B300" face="Palatino Linotype" size="3em"><%=wall_content %> </font>
	     <br>
	
	</div>
	</div>
	     <%
	
      if(pic_id==0)
      {
    	  System.out.println("no profile picture has been added!");
    	  %>
    	  <a href="checkfriend.jsp?fuid=<%=commentor_id%>">
    	  <img src="images/default.jpg" alt="no profile" width="50" height="50"  >
    	  </a>
    	  <%
      }//end of if(empty)
 
      else
      {
  	 	  System.out.println("pic id="+pic_id);
     	String sql126="select * from image_try where p_id="+pic_id;
     	ResultSet rs126=st126.executeQuery(sql126);
     	String path1236=null;
     	while(rs126.next())
     	{
         	path1236=rs126.getString("img_path");
     	}

     	%>
     	<a href="checkfriend.jsp?fuid=<%=commentor_id%>">
     	   	     <img src="<%=path1236%>" alt="profile picture" width="50" height="50">
</a>
	     <%

      }
      	  	
   %> 
		<a href="checkfriend.jsp?fuid=<%=commentor_id%>"><%=commentor_name %> </a> commented :: <%=comment_text%> </label>
		 <label><%=time %></label>
		 
		<br><label> <u style="color:white;">____________________________________________________________________________________________________________ </u> </label>
		</br>		
		
		<% 
		
		}
		
		else
		{
			%>
			<a href="checkfriend.jsp?fuid=<%=commentor_id%>">
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
     	String sql129="select * from image_try where p_id="+pic_id;
     	ResultSet rs129=st129.executeQuery(sql129);
     	String path1237=null;
     	while(rs129.next())
     	{
         	path1237=rs129.getString("img_path");
     	}

     	%>
     	   	     <img src="<%=path1237%>" alt="profile picture" width="50" height="50">

	     <%

      }
      	  	
     %>
     
			   <font color="#F6B300" face="Palatino Linotype" size="4em"><b><%=r_name%></b>
			   
			    &nbsp; uploaded this picture : </font>
	 <br>
	 <font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  
			<%=commentor_name %></font> </a> commented: <%=comment_text%> ON IMAGE OF ::<a href='#'>
			<font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	   <%=r_name %></font></a>  </label>
			 <label><%=time %></label>
			<br>
			
		<% 	
			
		}
	} //end of rs8

	
	
	
	
}  //end of rs7

//---------------------------------------------------------------------------------------------------------------------------------------

Statement st799=con.createStatement();
ResultSet rs799=st799.executeQuery("select * from comment_pictures where commentor = '"+uid+"' ");

Statement st18999=con.createStatement();

String commentor99="";
String r_name99="";
String wall_id99="";
String comment_text99="";
String username99="";
int pic_id_of=0;
while(rs799.next())
{
	
	comment_text99=rs799.getString("comment_text");
	pic_id_of=rs799.getInt("p_id");
	/*
	Statement st7899=con.createStatement();
	ResultSet rs7899=st7899.executeQuery("select * from basic_info where uid = '"+uid+"' ");
	while(rs7899.next())
	{
		username99=rs7899.getString("username");
	}

//I WANT USERNAME OF PERSON JYACHA PIC AHE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	
	
	*/
	
	
	
	Statement st789=con.createStatement();
	ResultSet rs789=st789.executeQuery("select * from basic_info where uid = '"+uid+"' ");
	while(rs789.next())
	{
		username99=rs789.getString("username");
	}

	
	%>
	<br>
	<label> <%=username99%> COMMENTED : <%=comment_text99%> ON PICTURE OF </label>
	<% 
}  //end of rs799


//-------------------------------------------------------------------------------------------------------------------------------------	
}  //end of rs4




String uid12 = session.getAttribute("uid").toString();
 
Integer uid123=Integer.parseInt(uid12);

//to display all contents of images

Statement st111=con.createStatement();
Statement st211=con.createStatement();
Statement st311=con.createStatement();
Statement st411=con.createStatement();
Statement st511=con.createStatement();
Statement st611=con.createStatement();
Statement st711=con.createStatement();
Statement st811=con.createStatement();
Statement st911=con.createStatement();



ResultSet rs111=st111.executeQuery("select * from album");
Integer uid2=0;
String path111="";
while(rs111.next())
{
	System.out.println("in album loop!");
	uid2=rs111.getInt("uid");
	
	
	if(uid2==uid123)
	{
		System.out.println("self album!");
		
		//self album then post
		
		
		//String sql2="select * from image_try where p_id='"+wall_id+"'";
	    //ResultSet rs2=st1.executeQuery(sql2);  
	      	 String name=null;
	      //   while(rs2.next())
	        // {
	         	name=rs111.getString("p_id");
	         	
	         //}
	      
	      
	      // y replaced by y1 as duplicate local variable error
	      
	System.out.println("name= "+name);
	String s1=name;
	System.out.println("s= "+s1);
	String y1="";
	String[] result=s1.split(",");
	System.out.println("after splitting s= "+s1);
	System.out.println("result = "+result);
	int count222=0;
	for (int x=0; x<result.length; x++) 
	{
		y1=result[x];
		System.out.println("y ="+y1);
		
		 
		ResultSet rs311=st311.executeQuery("select * from image_try where p_id='"+y1+"'");
		
		while(rs311.next())
		{
			 path111=rs311.getString("img_path");
			 
			 //ithe sagle show hotayt img src khalcha deleted from here
			 %>
				
			
				
				<% 
		}  //while rs3
		
		count222++;
		
		ResultSet rs711=st711.executeQuery("select * from comment_pictures where p_id='"+y1+"'");
		String comment_text111="";
		Integer commentor111=0;
		Integer p_id123=0;
		while(rs711.next())
		{
			comment_text111=rs711.getString("comment_text");
			commentor111=rs711.getInt("commentor");
			
			p_id123=rs711.getInt("p_id");
		%>
		<br>	&nbsp;
			&nbsp;&nbsp;
				<img src="<%=path111%>" alt="wall picture" width=200px height=200px>
		<br>
		
				<label> <a href='#'>
				<%
	//String sql456=("select * from album where uid="+commentor111+" and album_names='profile'");
   
     //ResultSet rs453=st456.executeQuery(sql456);
	 
     //boolean empty_name6=true;
	 
    // while(rs453.next())
	 //{
		// empty_name6=false;
	 //}
	 
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
     	String sql136="select * from image_try where p_id="+pic_id;
     	ResultSet rs136=st136.executeQuery(sql136);
     	String path1231=null;
     	while(rs136.next())
     	{
         	path1231=rs136.getString("img_path");
     	}

     	%>
     	   	     <img src="<%=path1231%>" alt="profile picture" width="50" height="50">

	     <%

      }
      	  	
     %>
     <font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  
				<%=commentor111%></font></a> ::COMMENTED ON THIS:: <a href='#'><%=comment_text111%></a> PICTURE IN YOUR ALBUM !!!</label>
				 <label><%=time%></label>
		<br>
	
	
		<% 	
		
			
		} //while rs7
		
		

	}  //for loop

			
	} //if uid1=uid
	
	else
	{
	ResultSet rs211=st211.executeQuery("select * from permanent_friend where uid='"+uid123+"'");
	Integer friend=0;
	
	while(rs211.next())
	{
		friend=rs211.getInt("friend_id");
		System.out.println("friend id = "+friend);
		
		if(friend==uid2)
		{
			System.out.println("friend's album!");	
		
			//album is of friend post this
			
			//----------
			String name1=null;
			ResultSet rs611=st611.executeQuery("select * from album");
		         while(rs611.next())
		        // {
		         	name1=rs611.getString("p_id");
		         	
		         //}
		System.out.println("name1= "+name1);
		String s1=name1;
		System.out.println("s1= "+s1);
		String y1="";
		String[] result1=s1.split(",");
		System.out.println("after splitting s1= "+s1);
		System.out.println("result1 = "+result1);
		int count12=0;
		for (int x=0; x<result1.length; x++) 
		{
			y1=result1[x];
			System.out.println("y1 ="+y1);
			
			 
			ResultSet rs511=st511.executeQuery("select * from image_try where p_id='"+y1+"'");
			
			while(rs511.next())
			{
				 path111=rs511.getString("img_path");
				 
				 //deleted from here khalacha img src
				 %>
					
					
					<% 
			}  //while rs5
 			
			count12++;
			
			
			
			
			ResultSet rs811=st811.executeQuery("select * from comment_pictures where p_id='"+y1+"'");
			String comment_text12="";
			Integer commentor12=0;
			Integer p_id1234=0;
			while(rs811.next())
			{
				comment_text12=rs811.getString("comment_text");
				commentor12=rs811.getInt("commentor");
				p_id1234=rs811.getInt("p_id");
			%>
			<br>
			&nbsp;
			&nbsp;&nbsp;
				<img src="<%=path111%>" alt="wall picture" width=200px height=200px>
			<br>
			<label> <a href='#'>
			<%
	//String sql656=("select * from album where uid="+commentor12+" and album_names='profile'");
   
     //ResultSet rs653=st656.executeQuery(sql656);
	 
     //boolean empty_name8=true;
	 
    // while(rs653.next())
	 //{
		// empty_name8=false;
	 //}
	 
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
     	String sql176="select * from image_try where p_id="+pic_id;
     	ResultSet rs176=st176.executeQuery(sql176);
     	String path1230=null;
     	while(rs176.next())
     	{
         	path1230=rs176.getString("img_path");
     	}

     	%>
     	   	     <img src="<%=path1230%>" alt="profile picture" width="50" height="50">

	     <%

      }
      	  	
     %><font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  
			<%=commentor12%></font> <a href='#'>::COMMENTED::<a href='#'> <%=comment_text12%><a href='#'> PICTURE IN ALBUM OF :: <a href='#'><%=p_id1234%><a href='#'> album!!!</label>
		<br>
		
					
					<% 	
			

		}  //end of rs8
			
			
		} // second for
			
		//	-----------------
			
		} //end of if
		else
		{
			System.out.println("not friend's album!");
		}
		
	} //end of while rs2
	
	} //end of outer else
	
}  //end of rs1 while


//----------------------------------------------------------------------------

} // end of session wala try

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
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>