<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View bid</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
     <link rel="stylesheet" href="style.css" />
</head>
<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a>
			</li>			
			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			
			<li> <a href="admin.jsp" height="15px" width="30px">GO BACK TO ADMIN PAGE</a>
						<li>
						</li>
						<li>
						</li>
						<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>


 <div id="wrapper">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">


<div id="home_content_album" style=" width:1100px; margin:0px auto;left:130px;">
<div class="post">
<center>
<% 



Class.forName("com.mysql.jdbc.Driver");
Connection con = null;

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
%>	

<br>
<font face="Palatino Linotype" size=5em color="#F6B300"> FOR RIGHT UPPER</font>
<% 
int count4=0;
Statement st4=con.createStatement();
ResultSet rs4=st4.executeQuery("select count(*) from bid where space_type='right_upper'");
while(rs4.next())
{
	count4=rs4.getInt(1);
}

if(count4!=0)
{
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from bid where space_type='right_upper'");


int ad_id=0;
int cost=0;
String space_type=null;
while(rs.next())
{
	ad_id=rs.getInt("ad_id");
space_type=rs.getString("space_type");
cost=rs.getInt("cost");
%>

<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost%></font>

	<br>
	
<% 	
	
} // end of while

	} // end of outer while
	
	%>
<br>
<br>

<% 
int count44=0;
Statement st44=con.createStatement();
ResultSet rs44=st44.executeQuery("select count(*) from bid where space_type='right_center'");
while(rs44.next())
{
	count44=rs44.getInt(1);
}

if(count44!=0)
{

%>
<font face="Palatino Linotype" size=5em color="#F6B300"> FOR RIGHT CENTER</font>	

<% 
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select * from bid where space_type='right_center'");
int ad_id1=0;
int cost1=0;
String space_type1=null;
while(rs1.next())
{
	ad_id1=rs1.getInt("ad_id");
space_type1=rs1.getString("space_type");
cost1=rs1.getInt("cost");
%>

<br>
<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id1%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost1%></font>


<% 	
	
} // end of while
} // end of outer if
	
%>
<br>
<br>

<% 
int count444=0;
Statement st444=con.createStatement();
ResultSet rs444=st444.executeQuery("select count(*) from bid where space_type='right_lower'");
while(rs444.next())
{
	count444=rs444.getInt(1);
}

if(count444!=0)
{

%>


<font face="Palatino Linotype" size=5em color="#F6B300"> FOR RIGHT LOWER</font>

<% 
Statement st12=con.createStatement();
ResultSet rs12=st12.executeQuery("select * from bid where space_type='right_lower'");
int ad_id12=0;
int cost12=0;
String space_type12=null;
while(rs12.next())
{
	ad_id12=rs12.getInt("ad_id");
space_type12=rs12.getString("space_type");
cost12=rs12.getInt("cost");
%>

<br>

<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id12%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost12%></font>
<% 	
	
} // end of while
	
}
%>


<br>
<br>
<% 
int count445=0;
Statement st445=con.createStatement();
ResultSet rs445=st445.executeQuery("select count(*) from bid where space_type='left_upper'");
while(rs445.next())
{
	count445=rs445.getInt(1);
}

if(count445!=0)
{

%>


<font face="Palatino Linotype" size=5em color="#F6B300"> FOR LEFT UPPER</font>

<% 
Statement st9=con.createStatement();
ResultSet rs9=st9.executeQuery("select * from bid where space_type='left_upper'");
int ad_id9=0;
int cost9=0;
String space_type9=null;
while(rs9.next())
{
	ad_id9=rs9.getInt("ad_id");
space_type9=rs9.getString("space_type");
cost9=rs9.getInt("cost");
%>

<br>
<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id9%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost9%></font>


<% 	
	
} // end of while

	}
	%>
<br>
<br>

<% 
int count4455=0;
Statement st4455=con.createStatement();
ResultSet rs4455=st4455.executeQuery("select count(*) from bid where space_type='left_center'");
while(rs4455.next())
{
	count4455=rs4455.getInt(1);
}

if(count4455!=0)
{

%>

<font face="Palatino Linotype" size=5em color="#F6B300"> FOR LEFT CENTER</font>	

<% 
Statement st99=con.createStatement();
ResultSet rs99=st99.executeQuery("select * from bid where space_type='left_center'");
int ad_id99=0;
int cost99=0;

while(rs99.next())
{
	ad_id99=rs99.getInt("ad_id");

cost99=rs99.getInt("cost");
%>

<br>
<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id99%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost99%></font>

	
<% 	
	
} // end of while
	
}

%>
<br>

<br>
<% 
int count44555=0;
Statement st44555=con.createStatement();
ResultSet rs44555=st44555.executeQuery("select count(*) from bid where space_type='left_lower'");
while(rs44555.next())
{
	count44555=rs44555.getInt(1);
}

if(count44555!=0)
{

%>

<font face="Palatino Linotype" size=5em color="#F6B300"> FOR LEFT LOWER</font>

<% 
Statement st129=con.createStatement();
ResultSet rs129=st129.executeQuery("select * from bid where space_type='left_lower'");
int ad_id129=0;
int cost129=0;

while(rs129.next())
{
	ad_id129=rs129.getInt("ad_id");

cost129=rs129.getInt("cost");
%>

<br>
	<br>
<font face="Palatino Linotype" size=3em color="#3D2729"> AD ID : </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=ad_id129%></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font face="Palatino Linotype" size=3em color="#3D2729"> COST =  </font>
&nbsp;&nbsp;
<font face="Palatino Linotype" size=4em color="#E00000"><%=cost129%></font>

	<% 	
	
} // end of while
}
%>
</center>
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