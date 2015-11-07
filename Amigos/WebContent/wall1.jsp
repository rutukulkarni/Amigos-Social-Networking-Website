<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
      <%@ page language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<% 
session.setAttribute("like_flag","1");
String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);

System.out.println("Session UID= "+uid);
session.setAttribute("uid",uid);
System.out.println("before con in wall.jsp !");
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st119=con.createStatement();
String sql123="select * from basic_info where uid='"+uid+"'";
System.out.println(sql123);

Statement st123=con.createStatement();
ResultSet rs123=st123.executeQuery(sql123);
String username="";
while(rs123.next())
{

username=rs123.getString("username");
}
session.setAttribute("getname",username);

%>



<%
int count=0;
String text_content="";
String s_name="";
String r_name="";
int wall_id=0;
int sender_uid=0;
String likes123="";
String dislikes123="";
String status="";
%>

<FORM name="trywall" action="post_wall.jsp" METHOD="get">

<div style="width:530px;height:50px;">
<div style="float:left;width:400px">
<font face="ELephanta" size=5em  color="#F6B300">
Wallpost:
</font> <input type="text" name="wallpost" id="wallpost" style="border-radius: 5px;height:30px;width:250px;">
</div>
<div style="float:right;width:130px;">

<input type="submit" value=" POST WALL" class="button_up" style="height:40px; width:120px;font-size:12px">
</div>
</div>

</FORM>

<% 

String sql="select * from wall_posts where s_id='"+uid+"' or r_id='"+uid+"' order by w_id desc";
System.out.println(sql);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(sql);
int type=0;
String text_content1="";
//String text_content="";
while(rs.next())
{
	if(count!=10)
	{
		type=rs.getInt("type");		
		int checker=1;
		int checker1=1;
		
		text_content1=rs.getString("text_content");
		
		likes123=rs.getString("likes");
		dislikes123=rs.getString("dislikes");
		count++;

		
		s_name=rs.getString("s_name");
		sender_uid=rs.getInt("s_id");
		status=rs.getString("status");
		
if(type==1)
{
	System.out.println("to be displayed images!");
	Statement st4=con.createStatement();	
	String sql2="select * from image_try where p_id="+text_content1;
	ResultSet rs4=st4.executeQuery(sql2);

	System.out.println("after query!");
	String path=null;
		
	while(rs4.next())
	{
		path=rs4.getString("img_path");
		System.out.println("path fetched!="+path);
		
		Statement st12=con.createStatement();	
		String sql12="select * from basic_info where uid="+sender_uid;
		ResultSet rs12=st12.executeQuery(sql12);
		String sender_name="";
		int sender_id=0;
		int pic_id=0;
		while(rs12.next())
		{
			sender_id=rs12.getInt("uid");
			pic_id=rs12.getInt("p_id");
	 	    sender_name=rs12.getString("username");
		}
		%>
		
		<div style="height:210px;">
		
		
		<div style="width:700px;">
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
  
<font face="Palatino Linotype" size=3em color="#FFFFFF">
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
   	//---------------------------------------------------------
   	
   	System.out.println("after posted picture label");
   	
   	
   		    	Statement st11=con.createStatement();
		    
	    	ResultSet rs11=st11.executeQuery("select * from image_try where p_id='"+text_content1+"'");
	   String sql1="select * from image_try where p_id='"+text_content1+"'";
	   System.out.println("query for unique likes = "+sql1);

	    	String likes11="";
	    	String dislikes11="";
	    	while(rs11.next())
	    	{
	    		likes11=rs11.getString("likes");
	    		dislikes11=rs11.getString ("dislikes");
	    	}  //end if while rs123
	    	
	    	System.out.println("likes b4 spilt="+likes11);

	    	System.out.println("likes b4 spilt="+dislikes11);
    		String s1231=likes11;
	    	String s12341=dislikes11;
    		String[] result123=s1231.split(",");
    		String[] result1234=s12341.split(",");
			int count123=0;
			int count1234=0;
	    	String a="";
	    	String b="";
    		for (int x123=0; x123<result123.length; x123++) 
    		{
    			
    			a=result123[x123];
    			System.out.println("a="+a);
    			count123++;
    			%>
    			
    			
    			
    			<%
    		
    		}  // end of for x123
    		for (int x1234=0; x1234<result1234.length; x1234++) 
    		{
    			
    			b=result1234[x1234];
    			System.out.println("b="+b);
    			
    			count1234++;
    			
    		
    		}  // end of for x1234
    		
    		String y5=text_content1;
    		String y4=text_content1;
    		int y3=Integer.parseInt(y4);
    		int y2=y3-1-1;
    		int dislikes=result1234.length-1;
    		Statement st1000=con.createStatement();
		    
	    	ResultSet rs1000=st1000.executeQuery("select count(*) from comment_pictures where p_id='"+text_content1+"'");
	    	int comment_count=0;
	    	while(rs1000.next())
	    	{
	    		comment_count=rs1000.getInt("count(*)");
	    		System.out.println("COUNT OF COMMENTS for p_id ::"+text_content+"is "+comment_count);
	    	}
    		
	    %>	
	    	</a>
	   


				<form name="trial" action="comment_pic1.jsp" method="POST">

<!-- 	<textarea name="post" id="search-text" cols="25" rows="5" placeholder="Enter your comments here ... " style="background-color:#ffffff;color:#3D2729; "> </textarea>  -->
<textarea name="post" id="search-text" cols="15" rows="2" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;width:150px;color:#3D2729; "></textarea>


<input type="hidden" value=<%=y5 %> name="wall_id_pic">

<input type="image" src="images/comment.jpg" alt="Submit"  style="height:30px ;width:30px"><br>


<% 	
String s9=likes11;
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

<a href="like_pic1.jsp?p_id=<%=text_content1%>"><img src="images/likes1.png" height="30px" width="30px"></a>
<%
	}
%>

<% 	
String s8=dislikes11;
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

<a href="dislike_pic1.jsp?p_id=<%=text_content1%>"><img src="images/dislikes1.png" height="30px" width="30px"></a>

	<br>
<%
	} // end of else

	if ((count123-1)!=0)
	{

	%>
	<a href="show_pic_likes.jsp?p_id=<%=y2%>&p_id123=<%=y5%>"><%=count123-1%><label> LIKES</label></a>
	<br>
	<% 
	}

	%>
	 

	<% 
	if(dislikes!=0)
	{
		%>
	<a href="show_pic_dislikes.jsp?p_id=<%=y2%>&p_id123=<%=y5%>"><%=dislikes%><label> DISLIKES</label></a>
	    		<% 
	}


if(comment_count!=0)
{
    
	%>

<br>	
<a href="show_pic_comments.jsp?p_id=<%=y2%>&p_id123=<%=y5%>"><%=comment_count%><label> COMMENTS</label></a> 
	<br>
<% 
}

%>
</form>	    
	<%
	
	int y6=Integer.parseInt(y5);
	if(y6!=pic_id)
			{
	%>
<div>
<%
			} // end of if 
   %>
   	<br>
   	<font color="#FFFFFF">__________________________________________________________________________________________________________________</font>
   	<%
	} //end of rs4
	
} // end of if

else
{
		//------------
	Statement st9999=con.createStatement();
	Statement st99=con.createStatement();
	String sql9999="select * from basic_info where uid="+sender_uid;
ResultSet rs9999=st9999.executeQuery(sql9999);

	while(rs9999.next())
	{
%>

<a href="checkfriend.jsp?fuid=<%=rs9999.getInt("uid")%>">
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

<a href="checkfriend.jsp?fuid=<%=sender_uid%>" style="text-transform:capitalize;size:4em"><font face="Palatino Linotype" size=4em color="#01DF01">
<%=rs.getString("s_name")%> &nbsp;&nbsp;:
</font></a> 

<% 
	//-----------
	r_name=rs.getString("r_name");
	text_content=rs.getString("text_content");
	wall_id=rs.getInt("w_id");
	System.out.println("in wall1 just khup b4 set="+wall_id);
	
	System.out.println(""+s_name+"posted"+text_content+"on "+r_name);
	

		System.out.println("before incrementing count!");

		session.setAttribute("wall_id",wall_id);  
		System.out.println("in wall1 just b4 set="+wall_id);
		
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
		<br>
	<font face="Palatino Linotype" size=2em color=#F6B300 >POSTED</font> 
	<font face="Palatino Linotype" size=4em color=#F6B300 ><%=text_content%></font>
	<<font face="Palatino Linotype" size=2em color=#F6B300 >ON WALL OF </font>
	<font face="Palatino Linotype" size=4em color=#F6B300 ><%=r_name%></font>
	<%
	
		} // end of else status null
	%>
	<br>
	<form name="trial" action="comment.jsp" method="POST">
	<textarea name="post" id="search-text" cols="15" rows="2" placeholder="Enter your comments here ... " style="background-color: #F5F0E7;width:150px;color:#3D2729; "></textarea>
	<%
	System.out.println("in wall1 just inside form="+wall_id);
	
	
	%>
	
<input type="hidden" name="wall_id" value =<%=wall_id%> id="wall_comment" >
	&nbsp;&nbsp;&nbsp;
<input type="image" src="images/comment.jpg" alt="Submit" height="40px"  width="50px" class="button" style="height:40px ;width:50px">
<br>

	<% 	
	System.out.println("in wall1 just b4 likes123 split functn="+wall_id);
	
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
		} // end of else
%>

	<% 	
	System.out.println("in wall1 just b4 dislikescha split="+wall_id);
	
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
<br>
<%
		} // end of else
%>

	
	<% 
	System.out.println("in wall1 just b4 comments qeury="+wall_id);
	
	
	//-----------------------------------------------------------------------------------------
	
	String name9998="";
   	Statement st999=con.createStatement();
   	String sql999="select * from wall_posts where w_id='"+wall_id+"'";
   	System.out.println("sql 999 count of comments="+sql999);
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
   	
		if(result999.length==0)
		{
			
		}
		else
		{
	%>
  			<label><a href="home2.jsp?wall_id=<%=wall_id%>"><%=result999.length-1%><label> LIKES</label></a></label>
  			<%
		} // end of else result999.length==0
  	
  	if(result9998.length==0)
		{
			
		}
		else
		{
	%>
	<br>
  			<label><a href="home3.jsp?wall_id=<%=wall_id%>"><%=result9998.length-1%><label> DISLIKES</label></a></label>
  			<%
		} // end of else result9998.length==0
  	%>
  	
  	
	 <br>
   	
	<%
	System.out.println("in wall1 just b4 comments cha count below likes dis="+wall_id);
	

		Statement st888=con.createStatement();
		String sql888="select count(*) from comments where w_id='"+wall_id+"'";
		System.out.println("comments count query"+sql888);
		ResultSet rs888=st888.executeQuery(sql888);
		int no_of_comments123=0;
		int no_of_comments234=0;
		int no_of_comments=0;
		while(rs888.next())
		{
			no_of_comments123=rs888.getInt("count(*)");
		}
		System.out.println("in wall1 just b4 passing to home1="+wall_id);
		
	System.out.println("count of comments rs8888="+no_of_comments123);
	%>
	
	<label><a href="home1.jsp?wall_id=<%=wall_id%>"><%=no_of_comments123%> COMMENTS</a>   </label>
	<br>
		
	<!-- post ended here(posted on wall of) -->
		 
		<br><label> 
		<font color="#FFFFFF">__________________________________________________________________________________________________________________</font>
   	<%
}
	}//end of if
}//end of rs
//---------------------------------------------------------------------------------------------

%>
<font face="Palatino Linotype" size=5em color=#F6B300 ><a href="wall123.jsp">SEE ALL</a></font>
</body>
</html>