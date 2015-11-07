<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
 <link rel="shortcut icon" href="images/favicon.ico" />
   <title>Additional Information</title>
</head>
<body>


<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			<li><a href="#">Additional Information</a></li>
</ul>
</div>
</div>



<form action="registerPersonal.jsp" method="POST">
<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">

<div id="page-bgbtm">

   
   
<center>


<%

System.out.println("additional data!!");
String username=request.getParameter("uname1");
System.out.println("IN ADDITIONAL INFO :: "+username);
//request.setAttribute("username",username);

%>

<div class="post" style="float:left;width:1100px;border-right-color:#454545;">
<b>
<font face="Palatino Linotype" size=4em color="#F6B300">Additional Details needed

<font face="Palatino Linotype" size=2em color="#F6B300">(Optional)
</font>


</font>
</b>
<br>
<label style="font-face:Elephanta;font-size:25px;color:#F6B300;">
<b>Personal Information :</b>
</label>

<div style="height:140px;">
<div style="float:left;width:500px;">

<br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;" >
Hometown</label>
:
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" id="hometwn" name="hometwn" maxlength="50"></input>
     <input type="hidden" name="userName"  value="<%=username%>">
<br>
<br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Relationship Status &nbsp;&nbsp;&nbsp;:</label> <input type="text" style="border-radius: 3px;height:20px;width:150px;" maxlength="50" name="rel_status"></input>
<br><br><br>
<label style="font-face:Elephanta;font-size:20px;color:#F6B300;">Interests:-</label>
<br>

</div>

<div style="float:right;width:600px;left:600px;">

<br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Religion :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
 <input type="text" style="border-radius: 3px;height:20px;width:150px;" maxlength="50" name="rlgn"><br><br>


	<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Languages Known</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="100" name="lang_known"><br>
	

	</div>		
	</div>
<br>

<div>
<div style="float:left;width:500px;">


	<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Music :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
:
 <input type="text" maxlength="100" style="border-radius: 3px;height:20px;width:150px;" name="music">
 <br>
 <br>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Travelling </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
 <input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="100" name="travel">
 
 	<br>
 <br>
 <label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Gadgets </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="gadgets" maxlength="100">
<br>
 <br>
 <label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Shopping </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
 <input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="shopping" maxlength="100">
 <br>
 <br>
 </div>
 
 <div style="float:right;width:600px;">
 <label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Movies & TV Shows :</label> <input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="100" name="tv_shows"><br><br>


	<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Sports </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="sport" maxlength="100"><br><br>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">	
Books </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="100" name="books"><br><br>


<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">	
Other Interests </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="500" name="other_interest"><br><br>
</div>

<div>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
About me </label>&nbsp;:	
<textarea name="about_me"  cols=30 rows=3 maxlength="100"></textarea>
<!-- <input type="text"  style="border-radius: 3px;height:100px;width:250px;" name="about_me">-->
<br><br>
</div> 
</div>
</div>



<div class="post" style="float:left;width:1100px;border-right-color:#454545;">


<center>
<label style="font-face:Elephanta;font-size:25px;color:#F6B300;">
<b>Professional Information :</b></label><br>
<div style="float:left;width:500px;">
<label style="font-face:Elephanta;font-size:20px;color:#F6B300;">Education:</label><br>
<br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
High School  </label>&nbsp;&nbsp;&nbsp;&nbsp;:
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" maxlength="100" name="high_school"><br><br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
College &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:</label>
 <input type="text"  style="border-radius: 3px;height:20px;width:150px;"  name="college" maxlength="100"><br><br>
 
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;"> 
University &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </label>
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="univ" maxlength="100"><br><br>	

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Year of Passing :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </label>

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
 




</div>
<div style="float:right;width:600px">
<center>
<label style="font-face:Elephanta;font-size:20px;color:#F6B300;">Work:</label><br><br>
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Years of Experience&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
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
<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Current Job </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
 <input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="curr_job" maxlength="100"><br><br>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Skill Set </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="skill_set" maxlength="100"><br><br>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Experience </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 
<input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="exp" maxlength="300"><br><br>

<label style="font-face:Palatino Linotype;font-size:15px;color:#3D2729;">
Achievements </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" maxlength="400" style="border-radius: 3px;height:20px;width:150px;" name="ach"><br><br>

<!--  

<label>test:</label><input type="text"  style="border-radius: 3px;height:20px;width:150px;" name="test">
-->
</center>
</div>
</div>

<center>
<br><br><br><br><br><br><br><br><br><br>
<input type="Submit" value="LOGIN !!" class="button" style="color:#F6B300;">
</center>
</div>


</div>
</div>
<%
//response.sendRedirect("arun_save.jsp?username="+username);

%>

</div>
</div>
</div>


</form>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>