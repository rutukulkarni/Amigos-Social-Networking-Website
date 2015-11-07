<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import ="java.sql.*" %>
      <%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%!
public int nullIntconvert(String str){
int num=0;
if(str==null) {
str="0";
}
else if((str.trim()).equals("null")) {
str="0";
}
else if(str.equals("")) {
str="0";
}
try{
num=Integer.parseInt(str);
}
catch(Exception e) { }
return num;
}
%>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

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
  


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Amigos</title>
     <link rel="stylesheet" href="style.css" />
     
     <link rel="shortcut icon" href="images/favicon.ico" />
<style>
body 
{
background-color:"#3D2729";
}

</style>
<script>

function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}


</script>
<script>
function like(wall_id)
{
	//alert("hi "+wall_id);   
	window.location.href="like.jsp?wall_id="+wall_id;	
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
//var v=document.getElementById("wall_comment").value;
//alert("v="+v);
//var w=document.getElementById("comment1");
//alert("wall id= "+wall_id);
//alert("comment = "+comment);
//alert("comment="+document.getElementById("comment1").value);
//alert("wall id="+document.getElementById("wall_comment").value);
window.location.href="comment.jsp?wall_id="+wall_id;
		//+"&comment="+document.getElementById("comment1").value; 
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
			<li class="current_page_item" ><a href="prof.jsp">My Profile</a></li>
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


  
<div style="background:#3D2729;color:#F1EDE4;width:550px;">




<form id="like1" name="like1" action="comment.jsp" method="POST">
			   

<%
System.out.println("in WALL123 !!!!!!!!!!!!!!!!!!!!!!");
//Integer a=(Integer)session.getAttribute("a");
Integer a=(Integer)session.getAttribute("a");
System.out.println("a = "+a);
//Integer a=Integer.parseInt("a1");
//System.out.println("a1 = "+a);
System.out.println("in wall123.jsp :: a = "+a);

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);

System.out.println("Session UID= "+uid);
session.setAttribute("uid",uid);
System.out.println("before con in wall.jsp !");
session.setAttribute("flag",4);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
///------------------------
ResultSet rs1 = null;
ResultSet rs2 = null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;

Statement st15=con.createStatement();
String sql15="select * from basic_info where uid="+uid;
ResultSet rs15=st15.executeQuery(sql15);
String fname=null;
String lname=null;
//int pic_id=0;
while(rs15.next())
{
fname=rs15.getString("first_name");
lname=rs15.getString("last_name");
//pic_id=rs15.getInt("p_id");
}

%>
<font face="Palatino Linotype" size=5em color=#F6B300 style="text-transform:capitalize">
<%=fname%>'s Wall ::
</font>
<br>
<br>
<%
String wall="";
Integer wall_id=0;
Integer type=0;
Integer p=0;
String likes123="";
String dislikes123="";

int showRows=10;
int totalRecords=10;
int totalRows=nullIntconvert(request.getParameter("totalRows"));
int totalPages=nullIntconvert(request.getParameter("totalPages"));
int iPageNo=nullIntconvert(request.getParameter("iPageNo"));
int cPageNo=nullIntconvert(request.getParameter("cPageNo"));

int startResult=0;
int endResult=0;
if(iPageNo==0) {
iPageNo=0;
}
else{
iPageNo=Math.abs((iPageNo-1)*showRows);
}
String query1="SELECT SQL_CALC_FOUND_ROWS * FROM wall_posts order by w_id desc limit "+iPageNo+","+showRows+"";
ps1=con.prepareStatement(query1);
rs1=ps1.executeQuery();

String query2="SELECT FOUND_ROWS() as cnt";
ps2=con.prepareStatement(query2);
rs2=ps2.executeQuery();
if(rs2.next()) {
totalRows=rs2.getInt("cnt");
}
int s_id=0;
String s_name="";
String status="";
while(rs1.next()) {
	
	status=rs1.getString("status");
	s_id=rs1.getInt("s_id");
	System.out.println("s_id in wall123="+s_id);
	s_name=rs1.getString("s_name");
	System.out.println("s_name in wall123="+s_name);
	

Statement st25=con.createStatement();
String sql25="select * from basic_info where uid="+s_id;
ResultSet rs25=st25.executeQuery(sql25);
//String fname=null;
//String lname=null;
int pic_id=0;
while(rs25.next())
{
//fname=rs25.getString("first_name");
//lname=rs25.getString("last_name");
pic_id=rs25.getInt("p_id");
}

	System.out.println("pic_id jst b4 pic_id if els="+pic_id);
	
	if(pic_id==0)
	{
%>
<tr>
<td><img src="images/default.jpg" width=50px height=50px ></td>
	<%
	}
	else
	{
	Statement st9=con.createStatement();
	String sql9="select * from image_try where p_id="+pic_id;
	System.out.println("in wall123 sql9 = "+sql9);
	ResultSet rs9=st9.executeQuery(sql9);
	String path123="";
	while(rs9.next())
	{
		path123=rs9.getString("img_path");
		
	}
%>
<tr>
<td><img src="<%=path123%>" width=50px height=50px ></td>
<%
	}
	
	if(status!=null)
	{
System.out.println("status is not null");
	
		%>
			
	<font color="#FFFFFF" face="Palatino Linotype" size="3em"> has recent update as  
	<font face="Palatino Linotype" size=3em color="#58ACFA">
	<b><%=status %></b></font>

		<% 
	}// end of  if status null

	
	else
	{
	
%>

<td><font face="Palatino Linotype" size=3em color="#01DF01" style="text-transform:capitalize"><%=s_name%></font></td>
<font face="Palatino Linotype" size=2em color="#FFFFFF">posted</font> 
<td><font face="Palatino Linotype" size=3em color="#F6B300" ><%=rs1.getString("text_content")%></font></td>
<font face="Palatino Linotype" size=2em color="#FFFFFF"> on wall of</font>  
<td><font face="Palatino Linotype" size=3em color="#01DF01" style="text-transform:capitalize"><%=rs1.getString("r_name")%></font></td>
</tr>
<%
	} // end of else
int checker=1;
int checker1=1;
likes123=rs1.getString("likes");
dislikes123=rs1.getString("dislikes");

System.out.println("in wall123  likes = "+likes123);
System.out.println("in wall123  dislikes = "+dislikes123);

wall=rs1.getString("text_content");
wall_id=rs1.getInt("w_id");
type=rs1.getInt("type");
p=rs1.getInt("image_content");

if(type==0)
{
	
//System.out.println("wall = "+wall);
%>
<br> </br>
<% 
if(wall_id==a)
{
System.out.println("wallpost = "+wall+ "and wall id= "+wall_id);
%>
	<form name="trial" action="comment.jsp" method="POST">
<table width="100%" cellpadding="0" cellspacing="0" border="1" >
<tr>
<td>WALL POST</td>
<td>SENDER NAME</td>
<td>RECIPIENT NAME</td>
<td>LIKES</td>

</tr>
<br>
<textarea name="post" id="post" cols="25" rows="5" > </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px"  width="50px" class="button" style="height:40px ;width:50px">
	<% 	
	String s9=likes123;
	String y9="";
	String [] names9;
	String[] result9=s9.split(",");
	for (int x=0; x<result9.length; x++) 
	{
		y9=result9[x];
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
	

<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/likes1.png" height="30px" width="30px"></a>
<br>
<%
		}
%>
	<% 	
	String s8=dislikes123;
	String y8="";
	String [] names8;
	String[] result8=s8.split(",");
	for (int x=0; x<result8.length; x++) 
	{
		y8=result8[x];
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
	%><a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislikes1.png" height="30px" width="30px"></a>
<br>
<%
		}
%>
</form>
<%
//-------------------------------------------------------------------------------------------------------------------------------------
%>
	<% 
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
     
     if(name999==null)
     {
    	 
     }
     else
     {	 
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
if(name9998==null)
{
	
}
else
{
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
		if(result999.length==0)
		{
			
		}
		else
		{
	%>
	<br>
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
  	
  	}
  	}
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






<% 
//---------------------------------------------------------------------------------------------------------------------------------------
 }   // end of wallid=a
	else
{
	System.out.println("wallpost = "+wall+ "and wall id= "+wall_id);

%>

	<form name="trial" action="comment.jsp" method="POST">
<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
<br>
<label><%=wall %></label><br>
	<textarea name="post" id="post" cols="15" rows="2"> </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px" width="50px" class="button" style="height:40px ;width:50px">
<br>
	<% 
	String s9=likes123;
	String y9="";
	String [] names9;
	String[] result9=s9.split(",");
	for (int x=0; x<result9.length; x++) 
	{
		y9=result9[x];
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

<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/likes1.png" height="30px" width="30px"></a>
<%
		}
%>
	<% 	
	String s8=dislikes123;
	String y8="";
	String [] names8;
	String[] result8=s8.split(",");
	for (int x=0; x<result8.length; x++) 
	{
		y8=result8[x];
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

<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislikes1.png" height="30px" width="30px"></a>
<%
		}
//---------------------------------------------------------------------------------------------------------------------------------
	
	String name9998="";
   	Statement st999=con.createStatement();
   	String sql999="select * from wall_posts where w_id='"+wall_id+"'";
ResultSet rs999=st999.executeQuery(sql999);  
  	 String name999=null;
     while(rs999.next())
     {
     	name999=rs999.getString("likes");
     	System.out.println("name 999  "+name999);
        name9998=rs999.getString("dislikes");   
        System.out.println("name 9998  "+name9998);
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
		if(result999.length==0)
		{
			
		}
		else
		{
	%>
	<br>
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
<%


//----------------------------------------------------------------------------------------------------------------------------------

%>

<br>
<br>
</form>

<br> </br>
<% 
}//end of else

} //end of if type=0
else
{ 
	
	//type=1
			Statement st1=con.createStatement();
			String sql2="select * from image_try where p_id="+p;
			ResultSet rs22=st1.executeQuery(sql2);
			
			String path=null;
			
			while(rs22.next())
			{
			path=rs22.getString("img_path");
			%>
			
			<img src="<%=path %>" alt="wall picture" width=200px height=200px>

			<input type="button" value="LIKE " onclick="like(<%=wall_id%>);">
			<input type="button" value="DISLIKE " onclick="dislike(<%=wall_id%>);">
			<br>
<br>
<br>
<br>
<br>

		 	<textarea name="post" id="post" cols="25" rows="5" > </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px"  width="50px" class="button" style="height:40px ;width:50px">
		 
	   	<%
			} // end of rs2
} // end of else type=1







} // end of while rs1
 
try{
if(totalRows<(iPageNo+showRows)) {
endResult=totalRows;
}
else{
endResult=(iPageNo+showRows);
}
startResult=(iPageNo+1);
totalPages=((int)(Math.ceil((double)totalRows/showRows)));
}
catch(Exception e){
e.printStackTrace();
}
//-----------------



%>	
<% 	
int i=0;
int cPage=0;
if(totalRows!=0) {
cPage=((int)(Math.ceil((double)endResult/(totalRecords*showRows))));

int prePageNo=(cPage*totalRecords)-((totalRecords-1)+totalRecords);
if((cPage*totalRecords)-(totalRecords)>0){
%>
<a href="wall1.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
<%
}

else if((cPage*totalRecords)-(totalRecords)>0){
%>
<a href="wall123.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
<%
}
for(i=((cPage*totalRecords)-(totalRecords-1));i<=(cPage*totalRecords);i++){
if(i==((iPageNo/showRows)+1)){%>
<a href="wall1.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
<%
}
else if(i<=totalPages){
%>
<a href="wall123.jsp?iPageNo=<%=i%>"><%=i%></a>
<%
}
}
if(totalPages>totalRecords && i<totalPages){
%>
<a href="wall123.jsp?iPageNo=<%=i%>&cPageNo=<%=i%>"> >> Next</a>
<%
}
}
%>
<b>Rows <%=startResult%> - <%=endResult%> Total Rows <%=totalRows%> </b>
</div>
</td>
</tr>
</table>
<br> </br>
	
</form>




</div>
</div>
</div>
</div>
</div>
</div>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
</div>
</body>
</html>

<%
try{
if(ps1!=null){
ps1.close();
}
if(rs1!=null){
rs1.close();
}

if(ps2!=null){
ps2.close();
}
if(rs2!=null){
rs2.close();
}

if(con!=null){
con.close();
}
}
catch(Exception e)
{
e.printStackTrace();
}
%>





