<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


    <%@ page import="java.sql.*"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />


<script>
function later()
{
	
	window.location.href="login.jsp";
	}


</script>



</head>
<body>


<div id="menu">
	<div id="menu-wrapper">
		<ul>
		<li><img src="images/Amigos.png" width=50px height=50px></li>
	
			<li  class="current_page_item"><a href="Sign_Up.jsp">Sign Up</a></li>
		
		</ul>
	</div>
	<!-- end #menu -->
</div>

<div id="wrapper">
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">



			

<%
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");




String uid=session.getAttribute("uid").toString();


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();

String sql1="select * from basic_info where uid="+uid;
System.out.println(sql1);

ResultSet rs1=st1.executeQuery(sql1);

String username=null;


while(rs1.next())
{

	String gender1=rs1.getString("gender");
	String sql2="select * from advanced_personal where uid="+uid;
	System.out.println(sql2);
	ResultSet rs2=st2.executeQuery(sql2);
	while(rs2.next())
	{

		String sql3="select * from advanced_professional where uid="+uid;
		System.out.println(sql3);
		ResultSet rs3=st3.executeQuery(sql3);
		
		while(rs3.next())
		{
			
		
%>
<div>

<center>
<div id="home_content_album" style="position:absolute; width:350px; margin:0px auto;left:100px;">
<div class="post" style="height:900px; width:250px;">
					
					<center>
<form action="edit_data_controller.jsp" method="POST" id="reg1"  >






	<h1>Basic Information:</h1>
	<br>
	<br><br>
	Username:<br>
	
	<input type="text" style="height:30px;width:150px;" name="uname"  value="<%=rs1.getString("username")%>"><br><br>
		<br>
	First Name<br>
		
	<input type="text" style="height:30px;width:150px;" name="fname" value="<%=rs1.getString("first_name")%>"><br><br>
	<br>
	Last Name<br>
	<input type="text" style="height:30px;width:150px;" name="lname" valuer="<%=rs1.getString("last_name")%>"><br><br>
	<br>
	Email<br>
	<input type="text" style="height:30px;width:150px;" name="email" value="<%=rs1.getString("email")%>"><br><br>
	<br>
	
	Gender: <br>
	<%
	System.out.println("gender1 in edit _profile="+gender1);
	if(gender1.contentEquals("male"))
	{

		System.out.println("inside male");
		%>
		<input type="radio" name="gender" value="male" checked>Male<br><br>
		<input type="radio" name="gender" value="female" >Female<br><br>
		<input type="radio" name="gender" value="others">Others<br><br><br>
		<%
		
	}
	
	
	
	else
				if(gender1.contentEquals("female"))
		{

					System.out.println("inside female");
			%>
			<input type="radio" name="gender" value="male">Male<br><br>
			<input type="radio" name="gender" value="female" checked >Female<br><br>
			<input type="radio" name="gender" value="others">Others<br><br><br>
			<%
			
		}
				else
				{
					System.out.println("inside other");
					%>
					<input type="radio" name="gender" value="male">Male<br><br>
					<input type="radio" name="gender" value="female" >Female<br><br>
					<input type="radio" name="gender" value="others" checked>Others<br><br><br>
					<%
					
				}
		
		%>
		
		
Country<br>
	 <input type="text" style="height:30px;width:150px;" name="country" value="<%=rs1.getString("country")%>"><br><br><br>


<!-- additional -data-->

</div> <!-- end of post div -->
</div> <!--  end of home content div -->


<div id="home_content_album" style="position:absolute; width:350px; margin:0px auto;left:500px;">
<div class="post" style="height:900px;">

<center>
<h1>Personal Information </h1>

</center>
<center><br>
Hometown <br>:<input type="text" style="height:25px;width:150px;" name="hometown" value="<%=rs2.getString("hometown")%>"><br><br>
     <input type="hidden" name="userName" value="<%//=username%>">
Religion :<br><input type="text" maxlength="50" style="height:25px;width:150px;" name="rlgn" value="<%=rs2.getString("religion")%>"><br><br>
	
Relationship Status :<br><input type="text" maxlength="50" style="height:25px;width:150px;" name="relation" value="<%=rs2.getString("relationship_status")%>"><br><br>
Languages Known :<br><input type="text"  maxlength="100" style="height:25px;width:150px;" name="languages" value="<%=rs2.getString("languages")%>"><br>

	<br>
<br>
	<h4>Interests</h4>
	<br>
Music <br>
 <input type="text"  maxlength="100" style="height:25px;width:150px;" name="music" value="<%=rs2.getString("music")%>"><br><br>

Movies & TV Shows <br> <input type="text"  maxlength="100" style="height:25px;width:150px;" name="tv_shows" value="<%=rs2.getString("tv_shows")%>"><br><br>

Travelling<br> 
 <input type="text"  style="height:25px;width:150px;" maxlength="100" name="travel" value="<%=rs2.getString("travel")%>"><br><br>
	
Sports<br>  
<input type="text"  style="height:25px;width:150px;" name="sports" maxlength="100" value="<%=rs2.getString("sports")%>"><br><br>
	
Gadgets<br>
<input type="text"  maxlength="100" style="height:25px;width:150px;" name="gadgets" value="<%=rs2.getString("gadgets")%>"><br><br>

Books<br>  
<input type="text"  maxlength="100" style="height:25px;width:150px;" name="books" value="<%=rs2.getString("books")%>"><br><br>

Shopping<br>
 <input type="text"  maxlength="100" style="height:25px;width:150px;" name="shopping" value="<%=rs2.getString("shopping")%>"><br><br>

Other Interests<br> 
<input type="text"  maxlength="500" style="height:25px;width:150px;" name="other_interest" value="<%=rs2.getString("other")%>"><br><br>

About me <br>	
<input type="text"  maxlength="500"  style="height:25px;width:150px;" name="about_me" value="<%=rs2.getString("about_me")%>"><br><br>
</center>

</div>
</div>



<!-- professional edit -->


<div id="home_content_album" style="position:absolute; width:350px; margin:0px auto;left:900px;">
<div class="post" style="height:900px;">

<center>
<h1>Professional Information:</h1><br><br>
<h4>Education</h4><br>
High School :<br>
<input type="text"  maxlength="100" style="height:30px;width:150px;" name="high_school" value="<%=rs3.getString("high_school")%>"><br><br>
College :<br>
 <input type="text" maxlength="100" style="height:30px;width:150px;"  name="college" value="<%=rs3.getString("college")%>"><br><br>
University :<br> 
<input type="text"  maxlength="100" style="height:30px;width:150px;" name="university" value="<%=rs3.getString("university")%>"><br><br>	
Year :<br> 

<select name="year" id="year">
<option value=1985 >1985 or before</option>
<option value=1986 >1986</option>
<option value=1987 >1987</option>
<option value=1988 >1989</option>
<option value=1989 >1989</option>
<option value=1990 >1990</option>
<option value=1991 >1991</option>
<option value=1992 >1992</option>
<option value=1993 >1993</option>
<option value=1994 >1994</option>
<option value=1995 >1995</option>
<option value=1996 >1996</option>
<option value=1997 >1997</option>
<option value=1998 >1998</option>
<option value=1999 >1999</option>
<option value=2000 >2000</option>
<option value=2001 >2001</option>
<option value=2002 >2002</option>
<option value=2003 >2003</option>
<option value=2004 >2004</option>
<option value=2005 >2005</option>
<option value=2006 >2006</option>
<option value=2007 >2007</option>
<option value=2008 >2008</option>
<option value=2009 >2009</option>
<option value=2010 >2010</option>
<option value=2011 >2011</option>
<option value=2012 >2012</option>
<option value=2013 >2013</option>
<option value=2014 >2014 and above</option>
</select>

<!-- <input type="text"  maxlength="4" style="height:30px;width:150px;" name="year" value="<%//=rs3.getString("year")%>"><br><br>
 
 <input type="text" maxlength="5" style="height:30px;width:150px;" name="year_exp" value="<%//=rs3.getString("years_exp")%>">
 
 -->


<br><br>
<h4>Work</h4><br>
Years of Experience : 
<select name="exp_yr" id="exp_yr">
<option value=1 >1</option>
<option value=2 >2</option>
<option value=3 >3</option>
<option value=4 >4</option>
<option value=5 >5</option>
<option value=6 >6</option>
<option value=7 >7</option>
<option value=8 >8</option>
<option value=9 >9</option>
<option value=10 >10</option>
<option value=11 >11</option>
<option value=12 >12</option>
<option value=13 >13</option>
<option value=14 >14</option>
<option value=15 >15 and above</option>
</select>



<br><br>
Current Job :<br> <input type="text" maxlength="100" style="height:30px;width:150px;" name="curr_job" value="<%=rs3.getString("curr_job")%>"><br><br>
Skill Set :<br> <input type="text"  maxlength="100" style="height:30px;width:150px;" name="skill_set" value="<%=rs3.getString("skill_set")%>"><br><br>
Experience :<br> <input type="text"  maxlength="300" style="height:30px;width:150px;" name="experience" value="<%=rs3.getString("experience")%>"><br><br>
Achievements :<br> <input type="text" maxlength="400" style="height:30px;width:150px;" name="achieve" value="<%=rs3.getString("achieve")%>"><br><br>
</center>



<br>
<div style="height:50px">

<center>
<input type="Submit" value="SAVE CHANGES" class="button" style="color:#F6B300;">

</center>
</div>
</div>
</div>

</div>




	<%
		}
	}
}


} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else






%>
</div>
</div>
</form>



</body>
</html>