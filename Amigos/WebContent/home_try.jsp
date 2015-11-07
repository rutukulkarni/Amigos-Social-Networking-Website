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
if(session.getAttribute("uid123")!=null) // session has not been invalidated yet or it still exists 
{ 
	session.setAttribute("like_flag","0");
	String friend_list123=session.getAttribute("friend_list").toString();
	System.out.println("in home_try pg="+friend_list123);
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

int s_id123=0;
int r_id123=0;

String time=null;

//System.out.println("count= "+count);
String sql="select * from wall_posts order by w_id desc ";
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
	while(rs1.next())
	{
		r_id123=rs1.getInt("r_id");
		s_id123=rs1.getInt("s_id");
		
		if((s_id123==uid)||(r_id123==uid))
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
			String sql2="select * from image_try where p_id="+text_content;
			ResultSet rs4=st4.executeQuery(sql2);

			System.out.println("after query!");
			String path=null;
				
			while(rs4.next())
			{
				path=rs4.getString("img_path");
				System.out.println("path fetched!="+path);
				
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
				%>
				
				<div style="width:700px;height:250px;border-bottom:1px solid;border-bottom-color:#ffffff">
					 <div style="float:left;width:300px;">
	
					 <div style="float:left;width:60px;">
	
<%  if(pic_id==0)
      {
    	  System.out.println("no profile picture has been added!");
    	  %>
    	  
    	  <a href="checkfriend.jsp?fuid=<%=sender_id%>"><img src="images/default.jpg" alt="no profile" width="50" height="50"  >
    	  
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
     	   	     <a href="checkfriend.jsp?fuid=<%=sender_id%>"><img src="<%=path1235%>" alt="profile picture" width="50" height="50">
     	  </a>

	     <%

      }
      	  	
     %>
     
	</div>
	<div style="float:right;width:240px;">
	<font face="Palatino Linotype" size=4em color="#F6B300">
    	  
    	  <%=sender_name %>
    	  </font>
    	  
<font face="Palatino Linotype" size=3em color="#3D2729">
    	  uploaded picture&nbsp;&nbsp;
    	  </font>					
    	  </div>
    	  
    	  </div>
    	  
    	  	<div style="float:right;width:300px;">  
				<img src="<%=path %>" alt="wall picture" width=200px height=200px>
				
				
				<%
				System.out.println("!!!! BEFORE POSTED PICTURE LABEL!");
				
				
				
				
				 			System.out.println("wall_id="+wall_id);
	 			%>
   	 		</div>
   	 		</div>
   	 		</div>
   	 		
   			<br>
   
		   	<%
	    	Statement st123=con.createStatement();
		    
	    	ResultSet rs123=st123.executeQuery("select * from image_try where p_id='"+text_content+"'");
	   

	    	String likes123="";
	    	String dislikes123="";
	    	while(rs123.next())
	    	{
	    		likes123=rs123.getString("likes");
	    				    		dislikes123=rs123.getString ("dislikes");
	    	}  //end if while rs123
	    	
    		String s123=likes123;
	    	String s1234=dislikes123;
    		String[] result123=s123.split(",");
    		String[] result1234=s1234.split(",");
			int count123=0;
			int count1234=0;
	    	String a="";
	    	String b="";
    		for (int x123=0; x123<result123.length; x123++) 
    		{
    			
    			a=result123[x123];
    			count123++;
    			%>
    			
    			
    			
    			<%
    		
    		}  // end of for x123
    		for (int x1234=0; x1234<result1234.length; x1234++) 
    		{
    			
    			b=result1234[x1234];
    			count1234++;
    			
    		
    		}  // end of for x1234
    		
    		String y5=text_content;
    		String y4=text_content;
    		int y3=Integer.parseInt(y4);
    		int y2=y3-1-1;
    		int dislikes=result1234.length-1;
    		Statement st1000=con.createStatement();
		    
	    	ResultSet rs1000=st1000.executeQuery("select count(*) from comment_pictures where p_id='"+text_content+"'");
	    	int comment_count=0;
	    	while(rs1000.next())
	    	{
	    		comment_count=rs1000.getInt("count(*)");
	    		System.out.println("COUNT OF COMMENTS for p_id ::"+text_content+"is "+comment_count);
	    	}
    		
	    %>	
	    	</a>
	   
	    
	<%
	
	int y6=Integer.parseInt(y5);
	if(y6!=pic_id)
			{
	%>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<% 	
String s9=likes123;
String y9="";
String [] names9;
String[] result9=s9.split(",");
for (int x1=0; x1<result9.length; x1++) 
{
	y9=result9[x1];
	int y123=Integer.parseInt(y9);
           if(uid==y123)
           {
        	   checker=0;
        	   break;
           }
		
}// end of for result9.length
	
	
	if(checker!=1)
	{
		//already liked by logged in user
	}
	else
	{
%>

<a href="like_pic1.jsp?p_id=<%=text_content%>"><img src="images/like.jpg" height="30px" width="30px"></a>
<%
	}
%>

<% 	
String s8=dislikes123;
String y8="";
String [] names8;
String[] result8=s8.split(",");
for (int x2=0; x2<result8.length; x2++) 
{
	y8=result8[x2];
	int y1234=Integer.parseInt(y8);
           if(uid==y1234)
           {
        	   checker1=0;
        	   break;
           }
		
}// end of for result8.length
	
	
	if(checker1!=1)
	{
		//already liked by logged in user
	}
	else
	{
%>

<a href="dislike_pic1.jsp?p_id=<%=text_content%>"><img src="images/dislike.jpg" height="30px" width="30px"></a>
<%
	} // end of else
%>

				<form name="trial" action="comment_pic1.jsp" method="POST">
<textarea name="post" id="search-text" cols="15" rows="2" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;width:150px;color:#3D2729; "></textarea>


<input type="hidden" value=<%=y5 %> name="wall_id_pic">

<input type="image" src="images/comment.jpg" alt="Submit"  style="height:30px ;width:30px"><br>
 	<%

if(comment_count!=0)
{
	
	System.out.println("rutuja chk 1555");
    
	%>
	
<label><a href="show_pic_comments.jsp?p_id=<%=y2%>&p_id123=<%=y5%>">COMMENTS ::<%=comment_count%></a> </label>
	<br>
<% 
}

if ((count123-1)!=0)
{

%>
<label><a href="show_pic_likes.jsp?p_id=<%=y2%>&p_id123=<%=y5%>">LIKES:<%=count123-1%></a> </label>
<br>
<% 
}

%>
 

<% 
if(dislikes!=0)
{
	%>
    		<label><a href="show_pic_dislikes.jsp?p_id=<%=y2%>&p_id123=<%=y5%>">DISLIKES:<%=dislikes%></a> </label>
    		<% 
}

			} // end of if 
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
			String friend_list[]=new String[100];
			int check_uid=0;
				%>
			<br> </br>
					<% 	
						System.out.println("NAME : " +s_uid+ "POSTED THIS :   " +text_content+ "ON WALL OF :   " +r_uid);
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
			
			String s98=name999;
			String y98="";
			String [] names98;
			String[] result98=s98.split(",");
			for (int x=0; x<result98.length; x++) 
			{
				y98=result98[x];
			int y1=Integer.parseInt(y98);
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
			
			String s89=name9998;
			String y89="";
			String [] names89;
			String[] result89=s89.split(",");
			for (int x=0; x<result89.length; x++) 
			{
				y89=result89[x];
			int y22=Integer.parseInt(y89);
			if(uid==y22)
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
		%>
		<label><a href="home1.jsp?wall_id=<%=wall_id%>"><%=no_of_comments123%> COMMENTS</a>   </label>
		<br>
	
			
		<!-- post ended here(posted on wall of) -->
			 
			<br><label> <u style="color:white;">____________________________________________________________________________________________________________ </u> </label>
			</br>		
			
			  </label>
			<% 
			
		 } //end of else typewala!

		}//end of if s_id or rid== uid)	
	
		
		else
		{
			Statement st115=con.createStatement();
			
			String text_content123=null;
			String s_name123=null;
			String r_name123=null;
//String z5=null;
int frnd=0;
String frnd1=null;
String s5=friend_list123;
String[] result5=s5.split(",");
	int len=result5.length;
System.out.println("no. of comma split:"+len);

for (int x=0; x<result5.length; x++) 
{
	frnd1=result5[x];
	frnd=Integer.parseInt(frnd1);
		if((frnd==s_id123)||(frnd==r_id123))	
		{

			text_content123=rs1.getString("text_content");
			s_name123=rs1.getString("s_name");
			r_name123=rs1.getString("r_name");
			%>
			<br>
			<br>
			
			
			<%=s_name123 %>posted <%=text_content123 %> on wall of<%=r_name123 %>
			<br>
			<br>
			<%
			
			
			
		}
		else
			break;
}
		
		
		
		}//end of else mothawala!
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	
	
	}//end of while rs1


}
%>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>