<%@ page language="java" import="java.sql.*"  %>
<html>
<head>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page language="java" import="java.sql.*"  %>
  <%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.lang.*" %>
     <%@ page import= "java.text.SimpleDateFormat"%>
 
 
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
  <script src="jquery-ui-timepicker-addon.js"></script>
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

<script>

function check_event()
{

document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;

}

</script >


<script>
function valid()
{
	var a=document.getElementById("eventname").value;
	
	var b=document.getElementById("date_event").value;
	
	var x = document.getElementById("d1").value;

	var chks = document.getElementsByName('friend[]');
	var hasChecked = false;
	for (var i = 0; i < chks.length; i++)
	{
		if (chks[i].checked)
		{
			hasChecked = true;
			break;
		}
	}
	if (hasChecked == false)
	{
		alert("Please select at least one invite !! ");
		return false;
	}
	
	
		
	if(a=="")
	{
	alert("Enter eventname!");

	document.events.eventname.focus();
	a.focus;
	return false;
	}
				else  if(x>b)
			 		{
			 			alert("Enter valid event date!!");
			 			
			 			//alert("returning false!");
			 			document.events.date_event.focus();
			 			return false;
			 		}

			
			else{
					return true;
					}
	
}

</script>
<style>
	
	p.p1
	{
	text-align: center;
	}
	</style>
	
	<script>
	function printAll() {

var str="",i;

for (i=0;i<events.sender.options.length;i++) {
    if (myForm.myOption.options[i].selected) {
        str = str + i + " ";
    }
}

//alert("Options selected are " + str);
}
</script>


 <script>

function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;
}
<script type="text/javascript" src="jq1.js"></script>
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

<script type="text/javascript" src="jq1.js"></script>
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
	

</script>
<!--  <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>
  
  <script>
  $(function() {
    $( "#timepicker" ).timepicker();
  });
  </script>
-->
 </head>
<body>






<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
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
<div id="wrapper">
 <div id="page">

 <div id="page-bgtop">
<div id="page-bgbtm">

<div id="left_sidebar_adv" style="width: 220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div>
<div id="right_sidebar_adv" style="width:220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->

<%

System.out.println("just b4 uid from seesion");

if(session.getAttribute("name")!=null)
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!! OLD WALA SESSION!!! ");

String uid1=session.getAttribute("uid").toString();
int uid=Integer.parseInt(uid1);


%>


<%
SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal1 = Calendar.getInstance();
String d1 = dateformat1.format(cal1.getTime());
System.out.println("curr date in new event.jsp  ="+d1);



%>	
<input type="hidden" value=<%=d1 %> id="d1">




<br>

<label><center><font color="#F6B300" face="Palatino Linotype" size="6em">Create Event</font></center></label>
<br>


<form name="events" method="post" action="EventControl.jsp?flag=0" >

<div class="post" style=" width:500px; margin:0px auto;left:350px;">

<center>
<div class="post">



<font face="Palatino Linotype" size="2em" color="#F6B300">	
Mandatory Fields have been marked with a 
</font>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.
<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.

<font color="#F6B300" face="Palatino Linotype" size="4em">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name : <input type="text" id="eventname"name="eventname" style="border-radius: 5px;height:30px;width:150px;"></font><br><br><br>

<font color="#F6B300" face="Palatino Linotype" size="4em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Details:<input type="text" name="details" style="border-radius: 5px;height:30px;width:150px;"></font><br><br><br>

<font color="#F6B300" face="Palatino Linotype" size="4em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Where:<input type="text" name="place" style="border-radius: 5px;height:30px;width:150px;"></font><br><br><br>


<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.

<font color="#F6B300" face="Palatino Linotype" size="4em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Date: <input type="date" id="date_event" name="date_event" style="border-radius: 5px;height:30px;width:150px;" /></font><br><br><br>
 <br>
<!-- <font color="#F6B300" face="Palatino Linotype" size="4em">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Time: <input type="text" name="when" style="border-radius: 5px;height:30px;width:150px;" id="timepicker" /></font><br><br><br> -->

</div> 
</center>
 <% 
 Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();
Statement st2=con.createStatement();
String mess_list="";
String pname="";
int n=0;
int use=0;
int i=0;

int mess[]=new int[100];

String mess_name[]=new String[100];



String frnd="select * from permanent_friend where uid =" +uid+" OR friend_id="+uid;
System.out.println(frnd);
ResultSet rs11=st.executeQuery(frnd);
while(rs11.next())
{
	if(rs11.getInt(2)==uid)
	{
		use=rs11.getInt(3);
	}
	else
	{
		use=rs11.getInt(2);
	}
	mess[i]=use;

	ResultSet rs22=st2.executeQuery("select * from basic_info where uid =" +mess[i]);
	while(rs22.next())
	{

		pname=rs22.getString("username");
	
		mess_name[i]=pname;
		System.out.println("mess array element :: "+mess_name[i]);
		
	}
	
	i++;
	n++;
}//end of rs11 while
	
	
%>
 
  
     
 </select></font>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.

<font face="Palatino Linotype" size=4em color=#3D2729>
Invite Friends :
</font>
<br>
<% 

Statement st11=con.createStatement();

System.out.println("uid in new event ahe="+uid);
String sql11="select * from permanent_friend where  uid='"+uid+"'or friend_id='"+uid+"'";
ResultSet rs111=st11.executeQuery(sql11);
System.out.println(sql11);

%>

<% 

int friend_id=0;
while(rs111.next())
{
	if(rs111.getInt("uid")==uid)
		friend_id=rs111.getInt("friend_id");
	else
		friend_id=rs111.getInt("uid");
	
	System.out.println("friend id ahe in event new="+friend_id);

	%>
	<br>

	
	<% 
	
	String sql21="select * from basic_info where uid="+friend_id;
	Statement st21=con.createStatement();
	ResultSet rs21=st21.executeQuery(sql21);
	String fname=null;
	String lname=null;
	int pic_id=0;
	while(rs21.next())
	{
	
		fname=rs21.getString("first_name");
		lname=rs21.getString("last_name");
		pic_id=rs21.getInt("p_id");
		
	}
	
	%>
	<div style="width:480px;border-bottom:1px solid;border-bottom-color:#FFFFFF;height:80px;">
	
	<div style="float:left;width:210px;">
	
	<div style="float:left;width:110px;">
			
			<div style="float:left">
	
			<input type="checkbox" name="friend[]" value=<%=friend_id %> >
		</div>
		
		<div style="float:right;width:80px;">
			<%
			if(pic_id==0)
			{ 
			%>
			<img src="images/default.jpg" width="60px" height="60px">
			<%	
			}
			else
			{
			Statement st111=con.createStatement();
			String sql111="select * from image_try where p_id="+pic_id;
			ResultSet rs1111=st111.executeQuery(sql111);
			String path=null;
			
			while(rs1111.next())
			{
			path=rs1111.getString("img_path");	
			}
			
			%>		
			<img src="<%=path%>" width="60px" height="60px">
			<%
			}//end of else
		%>
		</div>
		</div><!-- end of chcekbox image -->
		
		
	
		<div style="float:right;width:100px;left:70px">
		
		<label style="font-face:Elephanta;font-size:20px;color:#F6B300;text-transform:capitalize;">
			<%=fname %>&nbsp;<%=lname %> 
			</label>
			
			</div>
			
			</div><!-- end of chckbox+img+naav -->
			

<div style="float:right;width:150px;">
			
			

			</div>
		
			</div><!-- end of 1 div!" -->
	<%

}


%>
<center>
<input type="submit" value="Invite" class="button_up" onclick="return valid();">
</center>
</div>
</form>
</div>
</div>
</div>
</div>


    <%

}

    else
    {
    
    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!! NEW WALA SESSION!!! ");
    response.sendRedirect("login.jsp");
    }
    %>
<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>

</body>
</html>