<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.lang.*" %>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos-Sign Up</title>
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<link rel="stylesheet" type="text/css" media="screen" href="../jquery.validate.password.css" />
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script type="text/javascript" src="../lib/jquery.js"></script>
<script type="text/javascript" src="../lib/jquery.validate.js"></script>
<script type="text/javascript" src="../jquery.validate.password.js"></script>
 <link rel="shortcut icon" href="images/favicon.ico" />
   <title>Amigos</title>
<script id="demo" type="text/javascript">
$(document).ready(function() {
	$("#register").validate();
	$("#password").valid();
	
});
</script>


<script>
function later()
{
	
	window.location.href="login.jsp";
	}


</script>


<script>
function check_username()
{
	//alert("in diff fucnt!");
	var username=document.getElementById("uname").value;
	//alert("username = "+username);
	window.location.href="check_username_availibility.jsp?uname="+username;
	}


</script>









<script>
function validate()
{
	//alert("in func!");
	var v=document.getElementById("email");
	var uname=document.getElementById("uname").value;
	var pwd=document.getElementById("pwd").value;
	var fname=document.getElementById("fname").value;
	var lname=document.getElementById("lname").value;
	var selected="none";
	var input=document.getElementsByName("gender");
	for(var i=0;i<input.length;i++){
		if(input[i].checked){
			selected=input[i].value;
		}
	
	}
	
	//var g=document.getElementById("gender").value;
	//alert("gender= "+selected);
	var h=document.getElementById("country").value;
	//alert("country="+h);
	//var i=document.getElementById("question").value;
	var answer=document.getElementById("ans").value;
	var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

//-----
var curr_date = document.getElementById("d").value;
	//alert("curr date print ho.."+curr_date);
	var dob=document.getElementById("dob").value;

	//alert(dob);
	



//-----
	
	if(document.getElementById('terms').checked)
		{
		//alert("checked!");
		}
	else
		{
			alert("Please accept terms and conditions..");
			document.signup.terms.focus();
			return false;
		}
		





	
 if(uname=="")
		{
		alert("Enter username!");

		document.signup.uname.focus();
		a.focus;
		return false;
		}
 if(pwd=="")
	{
	alert("Enter password!");
	document.signup.pwd.focus();
	//window.location.href="Sign_Up.jsp"
	return false;
	}
 if(fname=="")
	{
	alert("Enter first name!");
	document.signup.fname.focus();
	return false;
	}
	
if(lname=="")
	{
	alert("Enter last name!");
	document.signup.lname.focus();
	//window.location.href="Sign_Up.jsp"
	
	return false;
	}

if(v.value=="")
{

alert("Enter email address!");
document.signup.email.focus();
return false;
}
else if (!filter.test(v.value)) {
			alert('Please provide a valid email address');
			document.signup.email.focus();
			return false; 
		}
if(dob=="")
{
		alert("Enter birthdate!!");
		document.signup.dob.focus();
		return false;
}
else if(curr_date<dob)
		{
			alert("Enter valid birthdate!!");
			document.signup.dob.focus();
			return false;
		}

	
	
if(h=="")
		{
		alert("Enter country!!");
		document.signup.country.focus();
		//window.location.href="Sign_Up.jsp"
		return false;
		}
	 		

if(answer=="")
	{
	alert("Enter answer for security question!");
	document.signup.ans.focus();
	//window.location.href="Sign_Up.jsp"
	return false;
	}		
		
	 else{ 
		 //alert("true");
		 return true;
	//window.location.href="registerBasic.jsp?uname="+document.getElementById("uname").value+"&pwd="document.getElementById("uname").value;
	 }
	
}


</script>


<script>

function checkBoxValidation()
{
	
	// rutuja to do this function
	//alert("in function");
	for(var i=0; i<document.terms)
	if(!doucument.getElementById("terms").value.checked)
		{
			alert("Please accept terms and conditions..");
			return false;
		}
	else
		{
		alert("Click to proceed...");
		return true;
		}
	}

</script>

<style>

p.p1{text-align:right;}
input { margin-left: 1em; } 
label.error { display: none !important; }
.password-meter {
	float: left;
}
</style>

</head>


<body>
<div id="menu">
	<div id="menu-wrapper">
		<ul>
		<li><img src="images/Amigos.png" width=50px height=50px></li>
	
			<li  class="current_page_item"><a href="Sign_up.jsp">Sign Up</a></li>
		
		</ul>
	</div>
	<!-- end #menu -->
</div>

<div id="wrapper">
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">



			<div class="post" >

<h1 style="float:center"><label>GET STARTED WITH AMIGOS...</label></h1>
</div>
<div style="width:1100px;">

<div style="float:left;width:600px;">

			
<div class="post" style=" width:600px; margin:0px auto;left:100px;">
<center>
<h3>TERMS  AND  CONDITIONS  OF REGISTRATION </h3>
</center>
<br>
<p>Welcome to the registration to Amigos website and its related services. You may access many areas of our website without registering your details with us.
These Terms and Conditions of Registration are in addition to the general Terms and Conditions of Reading.
<br>
<h1>1. Registration</h1>
1.1 You will keep your username and password safe, and won't share them with anyone.
1.2 You will not pass yourself off as someone else or create multiple, false accounts.
</p>

<h1>2. Term</h1>
<p>
2.1 If you breach these or any of our other terms and conditions we reserve the right to close your account, if we do so, we may close all accounts you have open in your name.
2.2 To deactivate your account please contact our customer services department.
</p>

<h1>3. Administration</h1>
<p>
3.1 You can update your personal details (including your account and marketing preferences) by accessing your account at your Telegraph.co.uk Profile page and making any necessary changes; this will update your details across all services that you have subscribed to.
</p>


<h1>4. Data</h1>
<p>
4.1 Full details of the way in which we use cookies on our website and how we hold and process your information can be found in our Privacy and Cookie Policy
</p>

<h1>5. General</h1>
<p>
5.1 No waiver by us of any breach of these terms shall constitute a waiver of any other prior or subsequent breach and we shall not be affected by any delay. The rights and remedies of is under these terms are independent, cumulative and without prejudice to its rights under the law.
</p>
<p>

<form name="signup" action="registerBasic.jsp" method="POST" id="reg1" onsubmit="return validate();">
<input type="checkbox" name="terms" id="terms">I hereby declare that I accept all the terms and conditions and would like to register to AMIGOS.<p>
</div>			

</div>
<div style="float:right;width:350px;">


				 <div id="home_content_album" style="width:350px; margin:0px auto;left:830px;">
		
		
			
			
					<div class="post">
					
					<center>




<%
String uname="";
	String availability=session.getAttribute("uname_available").toString();
	System.out.println("availability in Sign_Up.jsp = "+availability);
	String flag=session.getAttribute("flag").toString();
	if(flag=="1")
	{
	 uname= session.getAttribute("username_check").toString();
	System.out.println("AFTER FLAG ==1 USERNAME = "+uname);
	}
	%>
	
<font face="Palatino Linotype" size="2em" color="#F6B300">	
Mandatory Fields have been marked with a 
</font>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.
<br>

	Basic Information:
	<br>
	<br>
	
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>	
	<% 
	if(availability=="available")
	{
		
		
		%>
	<input type="text" style="border-radius: 5px;height:30px;width:150px;" value="<%=uname%>" id="uname" name="uname" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username">
		<% 
	}
	// end of if
	else
	{
	%>
	<input type="text" style="border-radius: 5px;height:30px;width:150px;" id="uname" name="uname" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username">
	<%
	} 
	// end of else
	%>
	<input type="button" value="CHECK USERNAME AVAILABILITY" class="button" style="color:#F6B300;"  onclick="check_username();">
	<br>
	<%
	
	if(flag=="1")
	{
	%>
	<label>USERNAME IS :: <%=availability%></label>
	<%
	}
	%>
	<br>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
 	<input type="password" style="border-radius: 5px;height:30px;width:150px;" id="pwd" name="pwd" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password"><br><br>



<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<input type="text" style="border-radius: 5px;height:30px;width:150px;" name="fname" id="fname" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Firstname"><br><br>


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<input type="text" style="border-radius: 5px;height:30px;width:150px;" name="lname" id="lname" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lastname"><br><br>


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<input type="text" style="border-radius: 5px;height:30px;width:150px;" name="email" id="email" placeholder="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email-id"><br><br>


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
Birthday: <input type="date" name="dob" id="dob"><br><br>


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
Gender: 
<input type="radio" name="gender" id="gender" value="male" checked>Male<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" id="gender" value="female">Female<br><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="radio" name="gender" id="gender" value="others">Others<br><br>

	 <input type="text" style="border-radius: 5px;height:30px;width:150px;" id="country" name="country" placeholder="Country"><br><br>
		
		
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
		Security Question: 
	<select name="question" id="question" style="border-radius: 5px;height:30px;width:280px;border:1px;">
  	<option value=1>What is your mothers maiden name?</option>
	<option value=2>What is your pets name?</option>
	<option value=3>What was the name of your first school?</option>
	<option value=4>Where did your parents meet?</option>
	<option value=5>Where were you born?</option>

	
	</select>	
		<br><br>
		
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
	Answer: <input type="text" style="border-radius: 5px;height:30px;width:150px;" name="ans" id="ans">

	
	<br><br>
<%

SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();
//cal.add(Calendar.MONTH, 0);	//Adding 1 month to current date
String d = dateformat.format(cal.getTime());
System.out.println("curr date ="+d);


%>	
<input type="hidden" value=<%=d %> id="d">


<br>
<input type="submit" value="PROCEED"  class="button" style="color:#F6B300;">

 </center>
 
</form>
	
</div>
    
</div>
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