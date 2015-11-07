<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page language="java" import="java.sql.*"  %>
 
 <html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
 <style>
 p.p1
 {s
 text-align:right;
 }
 
 
 </style>

<script type="text/javascript">
function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;
}
</script>
 
<script type="text/javascript">

function go_event(eid,uid)
{
   var retVal = confirm("Do you want to go to this event ?");
   if( retVal == true ){
      //alert("User wants to go!");
      window.location.href="goevent.jsp?eid="+eid+"&uid="+uid;
	  return true;
   }
   else{
      alert("click on dont go!");
      //window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}

function not_go_event(eid,uid)
{
   var retVal = confirm("Do you  not want to go to this event ?");
   if( retVal == true ){
      //alert("User doesnt wants to go!");
      window.location.href="notgoevent.jsp?eid="+eid+"&uid="+uid;
	  return true;
   }
   else{
      alert("click on go!");
      //window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}

</script>


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
</head>
<body >

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
<div id="wrapper">
 <div id="page">

 <div id="page-bgtop">
<div id="page-bgbtm">

<div id="left_sidebar_adv" style="width: 220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:220px;height:500px;padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->

<div class="post" style=" width:500px; margin:0px auto;left:350px;">

<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String flag1=request.getParameter("flag");
int flag=Integer.parseInt(flag1);

if(flag==1)
{
	%>
	<center>
	<font face="Palatino Linotype" size=4em color="#3D2729">
	 You have just created a new event !
	 </font>
	 </center>
	 <%
	 flag=0;
}

%> 
 <div class="post">
 <center>
 <font face="Palatino Linotype" size=4em color="#3D2729">
 
   Want to create a new event?
 
 <br> Vist &nbsp;</font>
 <a href="NewEvent.jsp" style="font-size:2em;color:#F6B300"><u>
  Create Event
 </u></a>
 
</center>
</div>

<% 
//String uid1=session.getAttribute("uid").toString();
//Integer uid=Integer.parseInt(uid1);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); 

String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
System.out.println("uid in events.jsp:"+uid);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st=con.createStatement();
Statement st4=con.createStatement();

String sql4="select * from event_info";
ResultSet rs4=st4.executeQuery(sql4);
String members_list=null;
String ename=null;
String creator=null;
String edate=null;
String details=null;
String eplace=null;
int status=0;
String emembers_confirm=null;
int eid=0;

ResultSet rs1=st.executeQuery("select * from basic_info where uid ='" +uid+"'");
String use=null;
while(rs1.next())
{
	use=rs1.getString(2);
}
System.out.println("use:"+use);
%>
<br>
<%
ResultSet rs2=st2.executeQuery("select * from event_info where ecreator='"+use+"'order by eid desc" );
int r=0;
int eid4=0;

while(rs2.next())
{
	eid4=rs2.getInt("eid");
%>

<font face="Palatino Linotype" size=4m color="#3D2729"><b>You have created :</b></font><br>
<div style="border-bottom:1px solid;width:450px;height:150px;border-bottom-color:#FFFFFF">

<br><b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Name:</font>
<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=rs2.getString("ename") %></font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Date:</font>
<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=rs2.getString("date_event") %></font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Creator:</font> 
<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=rs2.getString("ecreator")%> </font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Details:</font> 
<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=rs2.getString("edetails")%> </font></b><br>
</div>
<br>
<%
//session.setAttribute("even",r);
}
%>
<br><u><b><h3>Upcoming Events:</h3></b></u><br>


<%
while(rs4.next())
{
	eid=rs4.getInt("eid");
	status=rs4.getInt("status");
	ename=rs4.getString("ename");
	details=rs4.getString("edetails");
	emembers_confirm=rs4.getString("emembers_confirm");
	eplace=rs4.getString("eplace");
	edate=rs4.getString("date_event");
	creator=rs4.getString("ecreator");
	members_list=rs4.getString("emembers");
	System.out.println("in rs 4 emembers="+members_list);



String z5=null;
String y5=null;
int y6=0;
String s5=members_list;
System.out.println("printing s5 in event page="+s5);
String[] result5=s5.split(",");

int len=result5.length;

for (int x=0; x<result5.length; x++) 
{
	y5=result5[x];
	y6=Integer.parseInt(y5);
	if(y6==uid)
	{
		%>
		<font face="Palatino Linotype" size=4em color="#F6B300"> You have been invited to :</font>
				
		<%
		
		
		System.out.println("uid gng event alay!!");
%>
<div style="width:450px;height:190px;border-bottom:1px solid;border-bottom-color:#FFFFFF">

<br><b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Name:</font>
<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=ename %></font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Date:</font><font color="#3D2729" face="Palatino Linotype" size="4em">
 <%=edate %></font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Creator:</font> 
<font color="#3D2729" face="Palatino Linotype" size="4em">
 <%=creator%> </font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Place:</font><font color="#3D2729" face="Palatino Linotype" size="4em">
 <%=eplace %></font></b><br>
<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Details</font><font color="#3D2729" face="Palatino Linotype" size="4em">
 <%=details %></font></b><br>

<input type="button" id="going" name="going" value="Going" style="width:100px;height:40px;color:#F6B300" class="button" onclick="return go_event(<%=eid%>,<%=uid%>)">
<input type="submit"  name="notgoing"  id="going" value="Not Going" style="width:100px;height:40px;color:#F6B300" class="button" onclick="return not_go_event(<%=eid%>,<%=uid%>)">

</div>
<br>
<%
		

		System.out.println("eid in events invite on event="+eid);
	}

	else
	{

		
		
	}
}//end of for	
%>
<% 
 
String z7=null;
String y7=null;
int y8=0;
String s7=emembers_confirm;
System.out.println("emembers_Confirm in events page="+emembers_confirm);

if(status==0)
{
	System.out.println("if confirm list is null !");
}
else
{
System.out.println("in events.jsp printing members confirm="+s7);
String[] result7=s7.split(",");

int leng=result7.length;

for (int xx=0; xx<result7.length; xx++) 
{

	y7=result7[xx];
	System.out.println("emembers_Confirm after splittin in events page="+y7);
	y8=Integer.parseInt(y7);
	if(y8==uid)
	{
		%>
		<img src="images/confirm_icon.jpg" width=40px height=40px;>
			<font face="Palatino Linotype" size=4em color="#F6B300"><b>Going</b></font>
	
	<div style="width:450px;height:150px;border-bottom:1px solid;border-bottom-color:#FFFFFF">
	
		<br><b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Name:</font>
		<font color="#3D2729" face="Palatino Linotype" size="4em"> <%=ename %></font></b><br>
		<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Date:</font><font color="#3D2729" face="Palatino Linotype" size="4em">
		 <%=edate %></font></b><br>
		<b><font color="#F6B300" face="Palatino Linotype" size="4em">Event Creator:</font> 
		<font color="#3D2729" face="Palatino Linotype" size="4em">
		 <%=creator%> </font></b><br>
		<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Place:</font><font color="#3D2729" face="Palatino Linotype" size="4em">
		 <%=eplace %></font></b><br>
		<b><font color="#F6B300" face="Palatino Linotype" size="4em"> Event Details</font><font color="#3D2729" face="Palatino Linotype" size="4em">
		 <%=details %></font></b><br>
</div>
<%
		}

		
	else
	{

		
		
	}
	//}
	
}//end of for for events uid is gng to	
}
}

%>
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