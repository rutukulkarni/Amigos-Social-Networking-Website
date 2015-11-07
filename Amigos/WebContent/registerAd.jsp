<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<title>Register AD</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script type="text/javascript">
function checkBoxValidation()
{
	
	var ad_name=document.getElementById("adName").value;
	var desc=document.getElementById("desc").value;
	var link=document.getElementById("link").value;
	var clicks=document.getElementById("clicks").value;
	var impressions=document.getElementById("impressions").value;
	//alert(ad_name);
	var selected=null;
	var input=document.getElementsByName("gender");
	for(var i=0;i<input.length;i++)
	if(input[i].checked)
	{
			selected=input[i].value;
	}
	//alert("..."+selected);

	
	if(ad_name=="")
	{
		alert("specify ad name! ");
		return false;
	}
	
	if(desc=="")
	{
		alert("specify description of your advertisement!")	;
		return false;
	}
	
	if(link=="")
	{
		alert("specify link of your advertisement!")	;
		return false;
		
		
	}

	if(clicks=="")
	{
		alert("specify clicks of your advertisement!")	;
		return false;
	}

	if(impressions=="")
	{
		alert("specify No. of Impressions for your advertisement!")	;
		return false;
	}
	 else if(selected=="")
	{
		 //document.registerAd.gender.focus();
		 alert("Enter gender!");
		//window.location.href="Sign_Up.jsp"
		return false;
	}

	
	
	for(var i=0; i < document.registerAd.categories.length; i++)
	{
		if(!document.registerAd.categories[i].checked)
		{
			alert("Please Select Your ad category");
			return false;
		}
		else
		{
			alert("Click to proceed.. ");
			return true;
		}
	}

	
}
</script>





<script>
$(function(){
$('#graph_content').load('a.jsp');
});

</script>        



   <script type="text/javascript">
   
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
			<a href="home.jsp">
			<img src="images/Amigos.png" alt="amigos" height="30" width="50">
			</a>
			</li>		
			<li><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			
	 			
			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li class="current_page_item"><a href="ad_home.jsp">Advertise</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>
<div id="wrapper">
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
				
					<div class="post">
<%



System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

%>
<label><h1> BIDDING will BE DONE FOR 1000 IMPRESSIONS PER MONTH... </h1> </label>

<form name="registerAd" action="registerAdController.jsp" method="post" onsubmit="checkBoxValidation()">
<%

String space_type1=request.getParameter("space_type1");
String space_type=request.getParameter("space_type");
//String space_type=session.getAttribute("space_type").toString();

//System.out.println("in registerAd.jsp="+space_type);
//session.setAttribute("space_type", space_type);
System.out.println("in reg ad page space_type="+space_type);
//String cost=request.getParameter("cost");

System.out.println("in reg ad page space_type1="+space_type1);

//System.out.println("cost in reg ad="+cost);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();
String cost=null;


String ad_types=request.getParameter("pageType");
//String cost1=request.getParameter("cost");
System.out.println("ad type="+ad_types);
String bid1=null;
int bid=0;
if(ad_types.equals("guaranteed"))
{
	
	bid1=request.getParameter("cost");
	
	bid=Integer.parseInt(bid1);
System.out.println("guaranteed cost in register ad=="+bid);

}
else
{
	bid1= request.getParameter("bid");
	bid=Integer.parseInt(bid1);

System.out.println("bid= "+bid);
}

System.out.println("Space type after query = "+space_type);
System.out.println("ad type= "+ad_types);

//System.out.println("cost= "+cost);
String space_type_final=null;
if(ad_types.contentEquals("guaranteed"))
{
	Statement st22=con.createStatement();
	String sql22="select * from avail_spaces where ad_type='"+ad_types+"' and final_cost='"+space_type+"'";
	ResultSet rs22=st22.executeQuery(sql22);
	while(rs22.next())
	{
		space_type_final=rs22.getString("space_type");
	}
	System.out.println("finally printing in register ad space type ="+space_type_final);
	
}
else
{
	System.out.println("inside auctioned wala st22 loop");
	Statement st22=con.createStatement();
	String sql22="select space_type from bid where cost='"+space_type+"'";
	System.out.println(sql22);
	ResultSet rs22=st22.executeQuery(sql22);
	while(rs22.next())
	{
		space_type_final=rs22.getString("space_type");
	}
	System.out.println("finally printing in register ad space type auctioned  ="+space_type_final);

	
}


session.setAttribute("space_type123",space_type_final);
Statement st2=con.createStatement();

String sql2="select * from avail_spaces where space_type='"+space_type_final+"' and ad_type='"+ad_types+"'";
System.out.println(sql2);
 ResultSet rs2=st2.executeQuery(sql2);
 int base_price=0;
 
   while(rs2.next())  
 {
	 base_price=rs2.getInt("space_cost");
	 
 }
 
System.out.println("base price="+base_price);



%>

<br>

<p>
<h1>Create your Advertisement :<br> </h1>
<h3>Enter Following details :<br></h3>

<font face="Palatino Linotype" size="2em" color="#F6B300">	
Mandatory Fields have been marked with a 
</font>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.
<br>
<br>
</p> 
<center>
<div style="width:800px;height:120px;">
<div style="float:left;width:400px;">

<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Advertisement Name: </font><input type="text" name="adName" style="border-radius: 5px;height:23px;width:170px;"><br>
<br></br>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Description</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="desc" style="border-radius: 5px;height:23px;width:170px;" maxlength="35">
</input>
</br>
</input>
</br>
</div>

<div style="float:right;width:400px;">

<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>
Link</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;:		  <input type="text" name="link" style="border-radius: 5px;height:23px;width:170px;">
<br><br></br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Clicks Estimated</font> 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text" name="clicks" style="border-radius: 5px;height:23px;width:170px;">
</div>
</div>
</center>

<div style="margin:0px auto;width:500px;">
<%


if(ad_types.equals("guaranteed"))

{
	%>

	<br>
	
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Impressions</font> &nbsp;&nbsp;&nbsp;&nbsp;: <input type="text" name="impressions" style="border-radius: 5px;height:23px;width:170px;"><font face="Palatino Linotype" size=3em color=#3D2729>
(* 1000)</font>	
	<%
}
%>
<br></br>

<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Preferred time Slot </font>:
	<select name="slot">
  	<option value="premium">Premium</option>
	<option value="non premium">Non Premium</option>
</select>

</br>
</input>
</div>
<br>
</div>

<div class="post">

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<p>

<font face="Palatino Linotype" size=4em color=#F6B300><b>SELECT YOUR AUDIENCE :</b></h3>
</p>
<!-- 

<iframe src="a.jsp" style="width:1000px;height:600px">

</iframe>
-->
<br>
<br>
</br>

<div style="margin:0px auto;width:800px;height:250px;left:400px;">

<div style="float:left;width:400px;">

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Select Gender : </font>
<br>
		<input type="radio" name="gender" value="male"><font face="Palatino Linotype" size=3em color=#3D2729>Male</font><br><br>
		<input type="radio" name="gender" value="female"><font face="Palatino Linotype" size=3em color=#3D2729>Female</font><br><br>
		<input type="radio" name="gender" value="others"><font face="Palatino Linotype" size=3em color=#3D2729>Others</font><br><br>
		<input type="radio" name="gender" value="both"><font face="Palatino Linotype" size=3em color=#3D2729>Both</font><br><br>

<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>Select Age group that you want to target:</font>
<br></br>
<select name="age_from">
<option value="18"> 18 </option>
<option value="25"> 25 </option> 
<option value="30"> 30 </option>
<option value="35"> 35 </option>
<option value="40"> 40 </option>
<option value="45"> 45 </option>
<option value="50"> 50 </option>
<option value="55"> 55 </option>

</select>

<select name="age_to">
<option value="25"> 25 </option> 
<option value="30"> 30 </option>
<option value="35"> 35 </option>
<option value="40"> 40 </option>
<option value="45"> 45 </option>
<option value="50"> 50 </option>
<option value="55"> 55 </option>
<option value="60 ">60 </option>


</select>
</div>
<div style="float:right;width:400px">


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
<font face="Palatino Linotype" size=3em color=#3D2729>
	Select categories to which your ad belongs: </font>
<br>
<input type="checkbox" name="adCategory" value="Sports" checked><font face="Palatino Linotype" size=3em color=#3D2729>Sports</font> <br>
<input type="checkbox" name="adCategory" value="Entertainment" ><font face="Palatino Linotype" size=3em color=#3D2729> Entertainment</font><br>
<input type="checkbox" name="adCategory" value="Food"> <font face="Palatino Linotype" size=3em color=#3D2729>Food</font><br>
<input type="checkbox" name="adCategory" value="Education"> <font face="Palatino Linotype" size=3em color=#3D2729>Education</font><br>
<input type="checkbox" name="adCategory" value="Travel"> <font face="Palatino Linotype" size=3em color=#3D2729>Travel</font><br>
<input type="checkbox" name="adCategory" value="Cosmetics"> <font face="Palatino Linotype" size=3em color=#3D2729>Cosmetics</font><br>
<input type="checkbox" name="adCategory" value="Business and Technology"> <font face="Palatino Linotype" size=3em color=#3D2729>
Business and Technology</font><br>
<input type="checkbox" name="adCategory" value="Automobiles"><font face="Palatino Linotype" size=3em color=#3D2729> Automobiles</font><br>
<input type="checkbox" name="adCategory" value="Electronics"><font face="Palatino Linotype" size=3em color=#3D2729> Electronics</font><br>
<input type="checkbox" name="adCategory" value="Shopping"><font face="Palatino Linotype" size=3em color=#3D2729> Shopping</font><br>
<input type="checkbox" name="adCategory" value="Other"><font face="Palatino Linotype" size=3em color=#3D2729> Others</font><br>

</div>
</div>

<br></br>
<center>
<div style="margin:0px auto;width:100px;">

<input type="hidden" value=<%=base_price %> name="base_price">

<input type="hidden" value=<%=bid %> name="bid">
<input type="hidden" value=<%=ad_types %> name="ad_type">
<br></br>

 <input type="submit" value="Proceed" class="button_up">
</div>
<%
String categories[]= request.getParameterValues("adCategory");
if(categories != null)
{
%>
<h4></h4>
<ul>
<%
for(int i=0; i<categories.length; i++)
{
%>
<li><%=categories[i]%></li>
<%
}
%>
</ul>
<%
}
%>

<input type="hidden" value=<%=space_type %> name="space_type" >



</form>

<form name="show_cost">
<input type="hidden" value=impressions name="impressions" >
</form>
<%



} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else

%>
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