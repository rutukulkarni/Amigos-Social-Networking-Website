<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   


  <link rel="stylesheet" href="style.css" />
<link rel="stylesheet" media="screen" type="text/css" href="zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="custom.css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="eye.js"></script>
<script type="text/javascript" src="utils.js"></script>
<script type="text/javascript" src="zoomimage.js"></script>
<script type="text/javascript" src="layout.js"></script>

  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />

<script type="text/javascript">

function confirm_del(y5,albumId)
{
   var retVal = confirm("Do you want to delete this picture ?");
   if( retVal == true ){
      //alert("User wants to delete!");
      window.location.href="DeletePic.jsp?p_id="+y5+"&album_id="+albumId;
	  return true;
   }
   else{
      //alert("User does not want to delete!");
      //window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}

function confirm_set_prof(y5,albumId)
{
   var retVal = confirm("Do you want to set this as your profile picture?");
   if( retVal == true ){
      //alert("User wants to set!");
      window.location.href="SetProfile.jsp?p_id="+y5+"&albumId="+albumId;
	  return true;
   }
   else{
      //alert("User does not want to set!");
      window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}



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
  
</style>
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


<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String userid1 = session.getAttribute("uid123").toString();
int userid=Integer.parseInt(userid1);
int uid=userid;

String albumId=request.getParameter("album_id");
System.out.println("in pass album name page album id="+albumId);
System.out.println("uid="+userid);

session.setAttribute("flag","0");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

System.out.println("album name before create con="+albumId);

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st111=con.createStatement();

session.setAttribute("albumId",albumId);
int pic_id=0;
//String sql111="select * from basic_info where uid="+userid;
//ResultSet rs111=st111.executeQuery(sql111);

//while(rs111.next())
//{
	//pic_id=rs111.getInt("p_id");
/*
System.out.println("picture id=+"+pic_id);
	session.setAttribute("wall_id",pic_id);	
}
*/


System.out.println("album name after con="+albumId);
%>
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

  <div>
  <div style="float:left">
<%
session.setAttribute("albumId",albumId);
%>
  <a href="uploadfile2.jsp">
  <img src="images/add_photo.jpg" width="30px" height="30px" title="Add more photos to this album.">
  </a>
  </div>
  </div>
  
  <br>
  <br>

<%
session.setAttribute("cuid",userid);
ResultSet rs5=st.executeQuery("select * from album where uid="+userid+" and album_id='"+albumId+"'");
String sql123="select * from album where uid="+userid+" and album_id='"+albumId+"'";
System.out.println(sql123);

System.out.println("album name after selct="+albumId);

String name5=null;
while(rs5.next())
{
	name5=rs5.getString("p_id");
	 
	System.out.println("name1 ga p_id wala!"+name5);
	%>

	
	<%
}
int y6=0;
String z5=null;
String y5=null;
String s5=name5;
String[] result5=s5.split(",");
	int len=result5.length;
System.out.println("no. of comma split:"+len);

int row=len/3+1;
System.out.println("row:"+row);
int counter=0;
%>
	

<table>
<tr>
<%
for (int x=0; x<result5.length; x++) 
{
int checker=1;
int checker1=1;

	y5=result5[x];

	if(counter!=3)
	
		{
		     String sql3=("select * from image_try where p_id="+y5);
		    System.out.println(sql3);
		    ResultSet rs8=st1.executeQuery(sql3);
		     
		     while(rs8.next())
		     {
		    	 	
		    	 z5=rs8.getString("img_path"); 
		    	%>
		    	<td>
		    	
   <!--     <div class="item">-->
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 
		    	 <a href="<%=z5 %>" title="picture"  class="example2"> 
		    	 
		    	<img src="<%=z5%>" alt="album_wala" width="150" height="150">
		    <%
		    
		    	Statement st123=con.createStatement();
		    
		    	ResultSet rs123=st123.executeQuery("select * from image_try where p_id='"+y5+"'");
		   

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
	    		
	    		
	    		String y4=y5;
	    		int y3=Integer.parseInt(y4);
	    		int y2=y3-1-1;
	    		int dislikes=result1234.length-1;
	    		Statement st1000=con.createStatement();
			    
		    	ResultSet rs1000=st1000.executeQuery("select count(*) from comment_pictures where p_id='"+y5+"'");
		    	int comment_count=0;
		    	while(rs1000.next())
		    	{
		    		comment_count=rs1000.getInt("count(*)");
		    		System.out.println("COUNT OF COMMENTS for p_id ::"+y5+"is "+comment_count);
		    	}
	    		
		    %>	
		    	</a>
		   
		    
		<%
		
		y6=Integer.parseInt(y5);
		if(y6!=pic_id)
				{
		%>
    <div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;



   
    <a onclick="confirm_set_prof(<%=y5%>,<%=albumId %>)" style="text-decoration: none; border-bottom:1px double  #F6B300;">
    <img src="images/change_prof.jpg" width="30px" height="30px" title="Set as Profile Picture"></a>&nbsp;&nbsp; 
    <a onclick="confirm_del(<%=y5%>,<%=albumId%>)"><img src="images/trash.jpg" width="30px" height="30px" title="Delete this picture"></a>
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

    <a href="like_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/like.jpg" height="30px" width="30px"></a>
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

	<a href="dislike_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/dislike.jpg" height="30px" width="30px"></a>
	<%
		} // end of else
	%>
    
					<form name="trial" action="comment_pic.jsp" method="POST">
	
<!-- 	<textarea name="post" id="search-text" cols="25" rows="5" placeholder="Enter your comments here ... " style="background-color:#ffffff;color:#3D2729; "> </textarea>  -->
	<textarea name="post" id="search-text" cols="15" rows="2" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;width:150px;color:#3D2729; "></textarea>


	<input type="hidden" value=<%=y5 %> name="wall_id_pic">

	<input type="image" src="images/comment.jpg" alt="Submit"  style="height:30px ;width:30px"><br>
	<% session.setAttribute("album_id",albumId); %>
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
	    		%>

	</form>
    </div>
    <%
    } // end of y6 if
		else
		{
			%>
			<div>
			<div style="float:left">
				
	&nbsp;&nbsp;&nbsp;&nbsp;   
    		
			<img src="images/tick.jpg" width="40px" height="40px">
			&nbsp;
<a href="like_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/like.jpg" height="30px" width="30px"></a>
<a href="dislike_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/dislike.jpg" height="30px" width="30px"></a>			
			</div>
			<br>
			
<% 

Statement st1234599=con.createStatement();

ResultSet rs1234599=st1234599.executeQuery("select * from image_try where p_id='"+y5+"'");
String likes12399="";
String dislikes12399="";
while(rs1234599.next())
{
	likes12399=rs1234599.getString("likes");
			    		dislikes12399=rs1234599.getString ("dislikes");
}  //end if while rs123

String s12399=likes12399;
String s123499=dislikes12399;
String[] result12399=s12399.split(",");
String[] result123499=s123499.split(",");



int count12399=0;
int count123499=0;
String a99="";
String b99="";
for (int x123=0; x123<result12399.length; x123++) 
{
	
	a99=result12399[x123];
	count12399++;
	%>
	
	
	
	<%

}  // end of for x123
for (int x1234=0; x1234<result123499.length; x1234++) 
{
	
	b=result123499[x1234];
	count123499++;
	%>
	
	
	
	<%

}  // end of for x1234


String y499=y5;
int y399=Integer.parseInt(y499);
int y299=y399-1-1;
int dislikes99=result123499.length-1;


%>


<%
Statement st100099=con.createStatement();

ResultSet rs100099=st100099.executeQuery("select count(*) from comment_pictures where p_id='"+y5+"'");
int comment_count99=0;
while(rs100099.next())
{
	comment_count99=rs100099.getInt("count(*)");
	System.out.println("COUNT OF COMMENTS :: "+comment_count99);
}

%>	
</a>






		<form name="trial" action="comment_pic.jsp" method="POST">
	
<!-- 	<textarea name="post" id="search-text" cols="25" rows="5" placeholder="Enter your comments here ... " style="background-color:#ffffff;color:#3D2729; "> </textarea>  -->
	<textarea name="post" id="search-text" cols="15" rows="2" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;width:150px;color:#3D2729; "></textarea>
	
	<input type="hidden" value=<%=y5 %> name="wall_id_pic">
	<input type="image" src="images/comment.jpg" alt="Submit"  style="height:30px ;width:30px"><br>
	<% session.setAttribute("album_id",albumId); %>
	
	<%
	
	if(comment_count!=0)
	{
		
		System.out.println("rutuja chk 1555");
        
		%>
		
	<label><a href="show_pic_comments.jsp?p_id=<%=y2%>&p_id123=<%=y5%>">COMMENTS ::<%=comment_count%></a> </label>
	<br>
	<% 
	}
	%>

<%
if ((count12399-1)!=0)
{

%>
<label><a href="show_pic_likes.jsp?p_id=<%=y299%>&p_id123=<%=y5%>">LIKES:<%=count12399-1%></a> </label><br>
<% 
}

%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<% 
if(dislikes99!=0)
{
%>
<label><a href="show_pic_dislikes.jsp?p_id=<%=y299%>&p_id123=<%=y5%>">DISLIKES:<%=dislikes99%></a> </label>
<% 
}
%>



	
	
	</form>
</div>
			<%
		} // else cha end of y6
    %>

    
  	 &nbsp;&nbsp;&nbsp;&nbsp;    	
	&nbsp;&nbsp;&nbsp;&nbsp;   
     &nbsp;&nbsp;&nbsp;&nbsp;   
		
		   	    <!--      </div>
  </div>-->

				</td>
				<%
				counter=counter+1;
				
		     }
	
	}
	    
	else
	{
		counter=0;
		
		%>
		</tr>
		<tr>
		<%
		String sql3=("select * from image_try where p_id="+y5);
     	
		System.out.println("rutuja chk 1444");
        
		ResultSet rs8=st1.executeQuery(sql3);
     
    	 while(rs8.next())
    	 {
    	z5=rs8.getString("img_path"); 
    	%>
    	<td>
    	
      <!--  <div class="item">-->
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    	 <a href="<%=z5 %>" title="picture" class="example2"> 
    	<img src="<%=z5%>" alt="album_wala" width="150" height="150">
    	
    	<%
    	
    	
    	%>
    </a>
   
 <!--       <div class="tooltip_description" style="display:none" title="Item 1 Description">-->
    
<%
		
		y6=Integer.parseInt(y5);
		if(y6!=pic_id)
				{
		%>

       <div>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a onclick="confirm_set_prof(<%=y5%>,<%=albumId %>)" style="text-decoration:none; border-bottom:1px double #F6B300;">

    <img src="images/change_prof.jpg" width="30px" height="30px" title="Set as Profile Picture"></a>&nbsp;&nbsp; 
        	<a onclick="confirm_del(<%=y5%>,<%=albumId%>)"><img src="images/trash.jpg" width="30px" height="30px" title="Delete this Picture"></a>
<%
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------



Statement st1234588=con.createStatement();
System.out.println("rutuja chk 1124");

ResultSet rs1234588=st1234588.executeQuery("select * from image_try where p_id='"+y5+"'");
String likes12388="";
String dislikes12388="";
while(rs1234588.next())
{
	likes12388=rs1234588.getString("likes");
			    		dislikes12388=rs1234588.getString ("dislikes");
}  //end if while rs123

String s12388=likes12388;
String s123488=dislikes12388;
String[] result12388=s12388.split(",");
String[] result123488=s123488.split(",");



int count12388=0;
int count123488=0;
String a88="";
String b88="";
for (int x123=0; x123<result12388.length; x123++) 
{
	
	a88=result12388[x123];
	count12388++;

}  // end of for x123
for (int x1234=0; x1234<result123488.length; x1234++) 
{
	
	b88=result123488[x1234];
	count123488++;
	%>
	
	
	
	<%

}  // end of for x1234


String y488=y5;
int y388=Integer.parseInt(y488);
int y288=y388-1-1;
int dislikes88=result123488.length-1;


%>


<%
Statement st100088=con.createStatement();

ResultSet rs100088=st100088.executeQuery("select count(*) from comment_pictures where p_id='"+y5+"'");
int comment_count88=0;
while(rs100088.next())
{
	comment_count88=rs100088.getInt("count(*)");
	System.out.println("COUNT OF COMMENTS :: "+comment_count88);
}
System.out.println("rutuja chk 1");

%>	
</a>





<%
if ((count12388-1)!=0)
{
	System.out.println("rutuja chk 2");
    
%>
<label><a href="show_pic_likes.jsp?p_id=<%=y288%>&p_id123=<%=y5%>">LIKES:<%=count12388-1%></a> </label><br>
<% 
}

%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="like_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/like.jpg" height="30px" width="30px"></a>
<a href="dislike_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/dislike.jpg" height="30px" width="30px"></a>
<% 
if(dislikes88!=0)
{
	System.out.println("rutuja chk 3");
    
%>
<label><a href="show_pic_dislikes.jsp?p_id=<%=y288%>&p_id123=<%=y5%>">DISLIKES:<%=dislikes88%></a> </label>
<% 
}
%>

  



<% 
    }
		else
		{
			System.out.println("rutuja chk 4");
	        
			%>
			<div>
			
			<div style="float:left">
			
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="images/tick.jpg" width="40px" height="40px">
			<a href="like_pic.jsp?p_id=<%=y5 %>&album_id=<%=albumId%>"><img src="images/like.jpg" height="30px" width="30px"></a>
			&nbsp;
			</div>
			<% 
	
Statement st1234577=con.createStatement();
			System.out.println("rutuja chk 123");
	        
ResultSet rs1234577=st1234577.executeQuery("select * from image_try where p_id='"+y5+"'");

System.out.println("rutuja chk 1111");


String likes12377="";
String dislikes12377="";
while(rs1234577.next())
{
	likes12377=rs1234577.getString("likes");
			    		dislikes12377=rs1234577.getString ("dislikes");
}  //end if while rs123

String s12377=likes12377;
String s123477=dislikes12377;
String[] result12377=s12377.split(",");
String[] result123477=s123477.split(",");



int count12377=0;
int count123477=0;
String a77="";
String b77="";
for (int x123=0; x123<result12377.length; x123++) 
{
	
	a77=result12377[x123];
	count12377++;
	%>
	
	
	
	<%

}  // end of for x123
for (int x1234=0; x1234<result123477.length; x1234++) 
{
	
	b77=result123477[x1234];
	count123477++;
	%>
	
	
	
	<%

}  // end of for x1234


String y477=y5;
int y377=Integer.parseInt(y477);
int y277=y377-1-1;
int dislikes77=result123477.length-1;


%>


<%
Statement st100077=con.createStatement();
String count_comment="select count(*) from comment_pictures where p_id='"+y5+"'";
ResultSet rs100077=st100077.executeQuery(count_comment);

int comment_count77=0;
while(rs100077.next())
{
	comment_count77=rs100077.getInt("count(*)");
	System.out.println("COUNT OF COMMENTS in anywhere:: "+comment_count77+"pic_id="+y5);
}

%>	
</a>





<%
if ((count12377-1)!=0)
{

%>
<label><a href="show_pic_likes.jsp?p_id=<%=y277%>&p_id123=<%=y5%>"> LIKES:<%=count12377-1%></a> </label><br>
<% 
}

%>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<% 
if(dislikes77!=0)
{
%>
<label><a href="show_pic_dislikes.jsp?p_id=<%=y277%>&p_id123=<%=y5%>">DISLIKES:<%=dislikes77%></a> </label>
<% 
}
%>




			
			<%
			
			

 	    	System.out.println("before comments form : y5 = "+y5);
		}
    %>
   
        
    
       &nbsp;&nbsp;&nbsp;&nbsp;   
		 &nbsp;&nbsp;&nbsp;&nbsp;   
 	    &nbsp;&nbsp;&nbsp;&nbsp;   
		<form name="trial" action="comment_pic.jsp" method="POST">
	
	<textarea name="post" id="search-text" cols="10" rows="3" placeholder="Enter your comments here ... " style="background-color: #ffffff;color:#3D2729; "> </textarea>
	<input type="image" src="images/comment.jpg" alt="Submit" style="height:30px;width:30px"><br>
	<%
	//String wall_pic_id="";
	System.out.println("before comments : y5 = "+y5);
	//session.setAttribute("wall_id_pic",y5);
	//System.out.println("after setting wall_id_pic ",+wall_id_pic);
	%>
	<input type="hidden" name="wall_id_pic" value =<%=y5%> id="wall_id_pic" >
	
	 
	</form>
	</div>
		</td>
		<%
		counter=counter+1;
    	 }
	}

  	 %>
  	     	
	</td>
	<%
}


%>

</tr>
</table>

<%
System.out.println("album name after con="+albumId);
%>
</div>
</div>
</div>
</div>
</div>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
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