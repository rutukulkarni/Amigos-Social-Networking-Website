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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>wall ::</title>

   <link rel="shortcut icon" href="images/favicon.ico" />
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
<div style="color: #F1EDE4;">



<FORM name="trywall" action="post_wall.jsp" METHOD="post">

<div style="width:530px;height:50px;">
<div style="float:left;width:400px">
<font face="ELephanta" size=5em  color="#F6B300">
Wallpost:</font> <input type="text" name="wallpost" id="wallpost" style="border-radius: 5px;height:30px;width:250px;">
</div>
<div style="float:right;width:130px;">

<input type="submit" value=" POST WALL" class="button_up" style="height:40px; width:120px;font-size:12px">
</div>
</div>

</FORM>
<br>
<form id="like1" name="like1" action="comment.jsp" method="POST">
			   

<%
System.out.println("in WALL1 !!!!!!!!!!!!!!!!!!!!!!");
//Integer a=(Integer)session.getAttribute("a");
Integer a=(Integer)session.getAttribute("a");
System.out.println("a = "+a);
//Integer a=Integer.parseInt("a1");
//System.out.println("a1 = "+a);
System.out.println("in wall3.jsp :: a = "+a);

String uid=session.getAttribute("fuid1").toString();
System.out.println("Session UID= "+uid);
session.setAttribute("uid",uid);
//session.setAttribute("fuid1",uid);
System.out.println("before con in wall.jsp !");

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
///------------------------
ResultSet rs1 = null;
ResultSet rs2 = null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
Statement st99=con.createStatement();
Statement st9999=con.createStatement();

String wall="";
Integer wall_id=0;
Integer type=0;
Integer p=0;

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
String query1="SELECT SQL_CALC_FOUND_ROWS * FROM wall_posts where s_id='"+uid+"'or r_id='"+uid+"' order by w_id desc limit "+iPageNo+","+showRows+"";
//String query1="SELECT SQL_CALC_FOUND_ROWS * FROM wall_posts where s_id='"+uid+"' order by w_id desc limit "+iPageNo+","+showRows+"";
ps1=con.prepareStatement(query1);
rs1=ps1.executeQuery();

String query2="SELECT FOUND_ROWS() as cnt ";
ps2=con.prepareStatement(query2);
rs2=ps2.executeQuery();
if(rs2.next()) {
totalRows=rs2.getInt("cnt");
}

int sender_uid=0;

while(rs1.next()) {

sender_uid=rs1.getInt("s_id");
String sql9999="select * from basic_info where uid="+sender_uid;
ResultSet rs9999=st9999.executeQuery(sql9999);

	while(rs9999.next())
	{
%>
<div style="height:250px;width:600px;border-bottom:1px solid;border-bottom-color:#FFFFFF">
<tr>

<td>
<a href="checkfriend.jsp?uid=<%=rs9999.getInt("uid")%>">
<br>
<%
int pic_id=0;
pic_id=rs9999.getInt("p_id");

if(pic_id==0)
{
	%>
	<img src="images/default.jpg" width=50px height=50px>
	<%
}
else
{
	String sql99="select * from image_try where p_id="+pic_id;
	ResultSet rs99=st99.executeQuery(sql99);
	String path=null;
	while(rs99.next())
	{
		path=rs99.getString("img_path");
		
	}
	%>
	<img src="<%=path%>" width=50px height=50px>
	<%
}
	}//end of while of basic_info tbl
%>
</a>
</td>


<td><a href="checkfriend.jsp?uid=<%=rs1.getInt("s_id")%>" style="text-transform:capitalize">
<font face="Palatino Linotype" size=4em color="#01DF01">
<%=rs1.getString("s_name")%> &nbsp;&nbsp;:
</font></a></td> 
<td>

<font face="Palatino Linotype" size=4em color="#58ACFA">

<%=rs1.getString("text_content")%></td>

</font>
<%
if(rs1.getInt("s_id")==rs1.getInt("r_id"))
{

}
else
{

%>



<font face="Palatino Linotype" size=3em color="#FFFFFF">
on wall of 
</font>
<td>
<a href="checkfriend.jsp?uid=<%=rs1.getInt("r_id")%>" style="text-transform:capitalize">

<font face="Palatino Linotype" size=4em color="#01DF01">
<%=rs1.getString("r_name")%>
</font>
</a>
</td>
<%
} //END OF ELSE PART
%>
</tr>

<%
wall=rs1.getString("text_content");
wall_id=rs1.getInt("w_id");
type=rs1.getInt("type");
p=rs1.getInt("image_content");

if(type==0)
{
	
//System.out.println("wall = "+wall);
%>
<% 
if(wall_id==a)
{
System.out.println("wallpost = "+wall+ "and wall id= "+wall_id);
%>
	<form name="trial" action="comment.jsp" method="POST">
	<%
	session.setAttribute("flag",2);
	%>
<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
<input type="hidden" name="iPageNo" value="<%=iPageNo%>">
<input type="hidden" name="cPageNo" value="<%=cPageNo%>">
<input type="hidden" name="showRows" value="<%=showRows%>">
<table width="100%" cellpadding="0" cellspacing="0" border="1" >
<tr>
<td>WALL POST</td>
<td>SENDER NAME</td>
<td>RECIPIENT NAME</td>
<td>LIKES</td>

<%


%>
</tr>

<textarea name="post" id="post" cols="25" rows="5" > </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px"  width="50px" class="button" style="height:40px ;width:50px">
<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/likes1.png" height="30px" width="30px"></a>

<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislikes1.png" height="30px" width="30px"></a>

</form>


<% 
 }   // end of wallid=a
	else
{
	System.out.println("wallpost = "+wall+ "and wall id= "+wall_id);

%>

	<form name="trial" action="comment.jsp" method="POST">
<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
<br>

	<textarea name="post" id="post" cols="15" rows="2"> </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px" width="50px" class="button" style="height:40px ;width:50px">
<br>
<a href="like.jsp?wall_id=<%=wall_id %>"><img src="images/likes1.png" height="30px" width="30px"></a>
<a href="dislike.jsp?wall_id=<%=wall_id %>"><img src="images/dislikes1.png" height="30px" width="30px"></a>
<br>

</form>
<% 
}//end of else
//-------------------------------------------------------------------------------------------------------------

//-------------------

//-------------------------------------------------------------
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


	if(result999.length==0)
	{
		
	}
	else
	{

System.out.println("printing likes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!="+result999.length);
%>
		<a href="home2.jsp?wall_id=<%=wall_id%>" style="color:#FFFFFF"><%=result999.length-1%><label> LIKES</label></a>
			<%
	} // end of else result999.length==0
	
	if(result9998.length==0)
	{
		
	}
	else
	{
%>
<br>
				<label style="font-color:#F6B300"><a href="home3.jsp?wall_id=<%=wall_id%>"><%=result9998.length-1%><label> DISLIKES</label></a></label>
			<%
	} // end of else result9998.length==0
	%>
	
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
	<br>
	<label><a href="home1.jsp?wall_id=<%=wall_id%>"><%=no_of_comments123%> COMMENTS</a>   </label>
	
	
	
	
	
	
	
	
	
	
	
</div>
	<% 
//-----------------------------------------------------------
 	
//-----------------------------------------------------------------------------------------------------------------	
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
		 	<textarea name="post" id="post" cols="25" rows="5" > </textarea>
<input type="image" src="images/comment.jpg" alt="Submit" height="40px"  width="50px" class="button" style="height:40px ;width:50px">
<% 
//-------------------

//-------------------------------------------------------------
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


	if(result999.length==0)
	{
		
	}
	else
	{

System.out.println("printing likes!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!="+result999.length);
%>
		<a href="home2.jsp?wall_id=<%=wall_id%>" style="color:#FFFFFF"><%=result999.length%><label> LIKES</label></a>
			<%
	} // end of else result999.length==0
	
	if(result9998.length==0)
	{
		
	}
	else
	{
%>
<br>
				<label style="font-color:#F6B300"><a href="home3.jsp?wall_id=<%=wall_id%>"><%=result9998.length-1%><label> DISLIKES</label></a></label>
			<%
	} // end of else result9998.length==0
%>
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
	<br>
	<label><a href="home1.jsp?wall_id=<%=wall_id%>"><%=no_of_comments123%> COMMENTS</a>   </label>





	</div>
	<% 
//-----------------------------------------------------------
%>





//---------------------------
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
if((cPage*totalRecords)-(totalRecords)==1){
%>
<a href="wall1.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
<%
}



if((cPage*totalRecords)-(totalRecords)>0){
%>
<a href="wall123.jsp?iPageNo=<%=prePageNo%>&cPageNo=<%=prePageNo%>"> << Previous</a>
<%
}
for(i=((cPage*totalRecords)-(totalRecords-1));i<=(cPage*totalRecords);i++){
if(i==((iPageNo/showRows)+1)){%>
<a href="wall123.jsp?iPageNo=<%=i%>" style="cursor:pointer;color: red"><b><%=i%></b></a>
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

</body>
</html>


