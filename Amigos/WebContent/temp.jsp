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

<script>

$(function(){
    $('#sidebar_adv').load('ad_display.jsp');
});


function like(wall_id)
{
	alert("hi "+wall_id);   
	window.location.href="like.jsp?wall_id="+wall_id;	
}

function privacy()
{
	alert("in privacy settings!");   
	window.location.href="privacy.jsp";	
}

function dislike(wall_id)
{
	alert("hi "+wall_id);   
	window.location.href="dislike.jsp?wall_id="+wall_id;	
}



function comment(wall_id)
{
//document.out("comment = "+comment);
alert("hi " +wall_id);
//var v=document.getElementById("wall_comment").value;
//alert("v="+v);
//var w=document.getElementById("comment1");
alert("wall id= "+wall_id);
//alert("comment = "+comment);
//alert("comment="+document.getElementById("comment1").value);
//alert("wall id="+document.getElementById("wall_comment").value);
window.location.href="comment.jsp?wall_id="+wall_id;
		//+"&comment="+document.getElementById("comment1").value; 
}


</script>




</head>

<body>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","arun");
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

String uid1=session.getAttribute("uid").toString();
Integer uid=Integer.parseInt(uid1);
String name33=null;
%>
<!-- tatpurta comment 11 march 
<div id="menu">
	<div id="menu-wrapper">
		<ul>
			<li class="current_page_item"><a href="home.jsp">Homepage</a></li>
			<li><a href="prof.jsp">Profile</a></li>
			<li><a href="album1.jsp">Gallery</a></li>
			<li><a href="message.jsp">Messages</a></li>
			<li><a href="Group.jsp">Groups</a></li>
			<li><a href="Events.jsp">Events</a></li>
			<li><a href="selectAdType.jsp">Create ad!</a></li>
			<li><a href="login.jsp">Sign-Out</a>
		</ul>
	</div>
	<!-- end #menu -->
<!-- </div>
 end of tatpurta 11 marcch devika -->

<div id="menu">
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="Amigos.png" alt="amigos" height="30" width="50"></li>		
			<li class="current_page_item"><a href="home.jsp">Home</a></li>
			<li><a href="prof.jsp">Profile</a></li>
			<li><a href="album1.jsp">Gallery</a></li>
			<!-- <li><a href="#">Groups</a></li>   -->
			
			
	 			
			<li>
			<input type="text" id=search-text name=search-text 	height="20px" width="100px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" style="padding:0;" height="40px" width="20px"><img src="icon-search.png" style="padding:0;" height=35px width=30px></a></li>
			<li><a href="selectAdType.jsp">Create ad!</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String sql3="select * from basic_info where uid="+uid;
ResultSet rs33=st33.executeQuery(sql3);
while(rs33.next())
{
	name33=rs33.getString("first_name");
}
%>



<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">

  <div class="post">
<div id="notif_img">
<div id="img">

<label>Hi &nbsp;<%=name33 %>&nbsp;!!!!</label>
<br>

<a href=edit_profile.jsp>EDIT PROFILE</a>

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
	  
	  <img src="default.jpg" alt="no profile" width="70" height="70" style="border: 12px #3D2729;">
	  
	  <%
 }//end of if(empty)

 else
 {
		System.out.println("in else of if(empty)");
	String name=null;
   
	Integer rowcnt=0;
	
	System.out.println("out of while");
	
	String sql10="SELECT SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) + 1) FROM album where uid="+uid+" and album_names='profile'";
    
   ResultSet rs20=st20.executeQuery(sql10);
   while(rs20.next())
   {
   	 String a=rs20.getString("SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) + 1)");
   	  System.out.println("count="+a);
   

	if(Integer.parseInt(a)==1)//only 1 picture (p_id) in profile folder of user)
		{
			System.out.println("in else of if(empty) in if(a==1)");
			
		    String sql8=("select * from album where uid="+uid+" and album_names='profile'");
	        
	        ResultSet rs21=st21.executeQuery(sql8);
	        String name1=null;
	        while(rs21.next())
	        {
	        	name1=rs21.getString("p_id");
	          System.out.println("only a single picture in profile folder!="+name1);
	        }
			
	  		String sql21=("select * from image_try where p_id="+name1);
	  		
    	ResultSet rs22=st22.executeQuery(sql21);
   	String path=null;
  		 while(rs22.next())
    {
   	 
   	 path=rs22.getString("img_path");
   	 %>
	     <img src="<%=path%>" alt="profile picture" width="70" height="70" style="border: 12px #3D2729;">

    <%
    System.out.println("only a single picture in profile folder!");
    }
		}//end of if(a==1)
			
			

	 	else//(when no. of p_ids in profile folder opf user)
	 	{
	 		System.out.println("in else of if(empty) in else(a==1)");
 			
 		    String sql23=("select * from album where uid="+uid+" and album_names='profile'");
 	        
 	        ResultSet rs23=st23.executeQuery(sql23);
 	        String name2=null;
 	        while(rs23.next())
 	        {
 	        	name2=rs23.getString("p_id");
 	          System.out.println("only a single picture in profile folder!="+name2);
 	        }
 			
 	  		     	 	
		String z=null;
 		String y=null;
		System.out.println("names="+name2);
 		String s=name2;
 		System.out.println("s="+s);
 		
 		String[] result1=s.split(",");
     	for (int x=0; x<result1.length; x++) 
     	{
 		y=result1[x];
		 }
 
 	     String sql43=("select * from image_try where p_id="+y);
 	     ResultSet rs4=st6.executeQuery(sql43);
 	     
 	     while(rs4.next())
 	     {
 	    	z=rs4.getString("img_path"); 
 	    	%>
 	    	
 	    	<img src="<%=z%>" alt="album_wala" width="70" height="70" style="border:12px #3D2729;">
 	<%
 	     }
 	  
 	   
      
 		}   //end of else(i==1)
   }
 	
   
   }     //end of if profile has been created  

%>






</div><!-- end of div img -->

 <div id="notif">
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
 <div id="subDiv1" title="Subdivision Div Element" style="color:#3D2729;">

<br>
<form name="see_friend_request" id="see_friend_request" method="post" action="confirm_friend.jsp" >
<p>YOU HAVE <a href="confirm_friend.jsp"> <%=i %> </a>FRIEND REQUESTS...
</p>

</form>
</div>


  </div>
<!-- end of notif -->


<div id="center_status" style="border-bottom: 1px solid white;color:#3D2729;">

<!-- text area madhun text jat nahi date 9 march	
<textarea rows="6" cols="50" placeholder="Whats on your mind...??" style="border:double 12px #3D2729;">
</textarea>
 -->	
		
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
<form name="HOME WALL " action="post_home.jsp" method="POST">
		<!--  <textarea name="status" id="status" style="width:250px;height:100px;font-family:cursive;border:double 12px #3D2729;">-->

		
<input type="text" name="wallpost" id="wallpost" placeholder="Whats on your mind...??" style="width:200px;height:70px;font-family:cursive;border:double 12px #3D2729;" >

		<!--  </textarea>
		&nbsp;&nbsp;&nbsp;-->

		<input type="submit" value="Post" style="width:70px;height:50px;color:#F6B300" class="button">
		
</form>

</div><!-- //end of center_status-->
</div>
</div><!-- //end of notification+image -->
</div>

<div id="sidebar_adv">

<%


%>
</div><!-- end of sidebar -->


<div id="home_content">
<div class="post">
<%

Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st93=con.createStatement();
ResultSet rs2=st2.executeQuery("select count(w_id)from wall_posts where s_id='"+uid+"' OR r_id='"+uid+"'");

int count=0;

while(rs2.next())
{
	//count=rs.getString("");
	count=rs2.getInt(1);
}  //end of rs2

//System.out.println("count= "+count);

ResultSet rs1=st1.executeQuery("select * from wall_posts  where s_id='"+uid+"'OR r_id='"+uid+"'order by w_id desc ");
//int uid=0;
int count1=0;
int fuid=0;
int image_content=0;
int type=0;
int p=0;
%>

<div id="center" class="middle-content">
<% 
while(count1!=count)
{
if(rs1.next()){
	String s_uid=rs1.getString("s_name");
	System.out.println("NEW ::::     SNAME- "+s_uid);
	String r_uid=rs1.getString("r_name");
	System.out.println("NEW ::::     RNAME- "+r_uid);
	fuid=rs1.getInt("r_id");
	String text_content=rs1.getString("text_content");
	image_content=rs1.getInt("image_content");
	 type=rs1.getInt("type");
	 int s_id=rs1.getInt("s_id");
	 int r_id=rs1.getInt("r_id");
	 
	 int wall_id=rs1.getInt("w_id");
	 
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
						while(rs12.next())
						{
							
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
				<label><a href='#'> <%=sender_name%><a href='#'> POSTED THIS PICTURE ON WALL OF <a href='#'><%=receiver_name%> <a href='#'></label>
		<div>
		<br>
		<form name="trial" action="comment.jsp" method="POST">
	<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
	<br>
	<br>
	<br>
	
	<input type="text" name="post" id="post" style="height:40px;color:#F6B300">	
	<input type="submit" value="COMMENT " style="width:110px;height:40px;color:#F6B300" class="button"> 
	<br>
	<br>
		
	<a href="like.jsp?wall_id=<%=wall_id %>"><img src="like.png" height="30px" width="30px">

	<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="dislike.jpg" height="30px" width="30px">
	<br>
	<br>
	</form>
	 <div>
	 <%
	 System.out.println("wall_id="+wall_id);
	 %>
   	 	</div>
   	<br>
   
		   	<%
				} //end of rs4
	 } //end of type==1
	 else
	 {
		 
	Statement st8=con.createStatement();
	
	
	ResultSet rs93=st8.executeQuery("select uid from permanent_friend where friend_id='"+fuid+"'");
	//OR uid='"+fuid +"'
	int check_uid=0;
	//System.out.println("before while in home.jsp");
	while(rs93.next())
	{
		check_uid=rs93.getInt("uid");
		System.out.println("check_uid= "+check_uid);
		if (check_uid==0)
		{
			//System.out.println("not friends!");
		}
		else
		{	%>
		<br> </br>
		<% 	
			//	out.println("NAME : " +s_uid+ "POSTED THIS :   " +text_content+ "ON WALL OF :   " +r_uid);
		%>
		<label> <a href='#'><%=s_uid%></a> : <%=text_content %> ON WALL OF <a href='#'><%=r_uid %></a>
		<br>
		
			<form name="trial" action="comment.jsp" method="POST">
	<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
	<br>
	<br>
	<br>
	
	<input type="text" name="post" id="post" style="height:40px;color:#F6B300">	
	<input type="submit" value="COMMENT " style="width:110px;height:40px;color:#F6B300" class="button"> 
	<br>
	<br>
		
	<a href="like.jsp?wall_id=<%=wall_id %>"><img src="like.png" height="30px" width="30px">

	<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="dislike.jpg" height="30px" width="30px">
	<br>
	<br>
	 
	
	</form>
	 
	
	 
	 <br> 
   	<%
   	//------------------------------------
   	Statement st999=con.createStatement();
   	String sql999="select * from wall_posts where w_id='"+wall_id+"'";
ResultSet rs999=st999.executeQuery(sql999);  
  	 String name999=null;
     while(rs999.next())
     {
     	name999=rs999.getString("likes");
     	
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

count999++;
}

   	
  
session.setAttribute("wall_id",wall_id);   	
   	%>
  <label><a href="home2.jsp"><%=count999-1%> </a>LIKES</label>
   	<br> 
   	
<%

Statement st888=con.createStatement();
	String sql888="select count(*) from comments where w_id='"+wall_id+"'";
ResultSet rs888=st888.executeQuery(sql888);
int no_of_comments=0;
while(rs888.next())
{
	no_of_comments=rs888.getInt("count(*)");
}
//System.out.println("!!!! NO OF COMMENTS = "+no_of_comments);
//session.setAttribute("wall_id",wall_id);
%>
<br>

<label><a href="home1.jsp"><%=no_of_comments   %></a>COMMENT   </label>
<% 
/*
for(z=0; z<likes123.length ;z++)
{
if(likes123[z]!=null)
{*/
	%>

	<%
	/*
}
}
*/
%>   	
		<br>
		<label> --------------------------------------------------------------------------   </label>
		</br>
		
		  </label>
		<% 
		
		}  //end of else
		
		
	} // end of while rs3
		
	 } //end of else typewala!
} //end of rs1
	
	
count1=count1+1;

} //end of outer while
%>


</div>
<% 
Statement st4=con.createStatement();
ResultSet rs4=st4.executeQuery("select * from permanent_friend where uid = '"+uid +"' OR friend_id= '"+uid+"'");
int frnd=0;
int frnd1=0;
while(rs4.next())
{
	frnd=rs4.getInt("uid");
	frnd1=rs4.getInt("friend_id");
	
	Statement st55=con.createStatement();
	ResultSet rs55=st55.executeQuery("select * from basic_info where uid = '"+frnd+"'");
String name1="";

while(rs55.next())
{
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
<br> </br>
<% 

	//out.println(name1 +" ::IS NOW FRIENDS WITH :: "+name2);

%>
<label><a href='#'> <%=name1 %> </a>IS NOW FRIENDS WITH :: <a href='#'><%=name2 %></a></label>
<br>
<label> --------------------------------------------------</label>
</br>

<% 

Statement st7=con.createStatement();
ResultSet rs7=st7.executeQuery("select * from comments where commentor = '"+frnd1+"' ");


String commentor="";
String r_name="";
String wall_id="";
String comment_text="";
while(rs7.next())
{
	commentor=rs7.getString("commentor");
	wall_id=rs7.getString("w_id");
	comment_text=rs7.getString("comment_text");
	//System.out.println("wall_post in home.jsp :: = "+wall_id);
	
	Statement st8=con.createStatement();
	ResultSet rs8=st8.executeQuery("select * from wall_posts where w_id = '"+wall_id+"' ");
	
	Statement st9=con.createStatement();
	ResultSet rs9=st9.executeQuery("select * from basic_info where uid = '"+commentor+"' ");
	String commentor_name="";
	while(rs9.next())
	{
		commentor_name=rs9.getString("username");
		
	}  //end of rs9
	
	int type123=0;
	while(rs8.next())
	{
		r_name=rs8.getString("r_name");
		type123=rs8.getInt("type");
		
		System.out.println("NEW         ::: TYPE123 = "+type123);
		%>
		<br></br>
		<% 
		//out.println("  "+commentor_name+"commented on wallpost of:"+r_name);
		
		if(type123==0)
		{
		%>
		<label> <a href='#'><%=commentor_name %> </a> COMMENTED :: <%=comment_text%> ON WALLPOST OF :: <a href='#'><%=r_name %> </a> </label>
		
		<br> 
		<label>----------------------------------------------------------------  </label>
		
		</br>
		
		
		<% 
		
		}
		
		else
		{
			%>
			<label> <a href='#'><%=commentor_name %> </a> COMMENTED THIS: <%=comment_text%> ON IMAGE OF ::<a href='#'> <%=r_name %></a>  </label>
			
		<% 	
			
		}
	} //end of rs8

	
	
	
	
}  //end of rs7


	
}  //end of rs4


//-----------------------------------------------------------------------

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
	System.out.println("name= "+name);
	String s=name;
	System.out.println("s= "+s);
	String y="";
	String[] result=s.split(",");
	System.out.println("after splitting s= "+s);
	System.out.println("result = "+result);
	int count222=0;
	for (int x=0; x<result.length; x++) 
	{
		y=result[x];
		System.out.println("y ="+y);
		
		 
		ResultSet rs311=st311.executeQuery("select * from image_try where p_id='"+y+"'");
		
		while(rs311.next())
		{
			 path111=rs311.getString("img_path");
			 
			 //ithe sagle show hotayt img src khalcha deleted from here
			 %>
				
			
				
				<% 
		}  //while rs3
		
		count222++;
		
		ResultSet rs711=st711.executeQuery("select * from comment_pictures where p_id='"+y+"'");
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
				<label> <a href='#'><%=commentor111%></a> ::COMMENTED ON THIS:: <a href='#'><%=comment_text111%></a> PICTURE IN YOUR ALBUM !!!</label>
		
	
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
			<label> <a href='#'><%=commentor12%> <a href='#'>::COMMENTED::<a href='#'> <%=comment_text12%><a href='#'> PICTURE IN ALBUM OF :: <a href='#'><%=p_id1234%><a href='#'> album!!!</label>
		
					
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
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>


 
 
</p>
</div>
</div>
</div>
</div>
</div>
</div>



</body>
</html>

