<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>

 <link rel="shortcut icon" href="images/favicon.ico" />

<link rel="stylesheet" href="style.css" />
<script type="text/javascript">

function send_request() {
 
			document.getElementById("sendRequestId").href += "?fname="
					+ document.getElementById("fname").value+"&lname="+document.getElementById("lname").value;
			
		//alert(document.getElementById("sendRequestId").href);
		

}

</script>

     

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

<script type="text/javascript">
   
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}
</script>
      
</head>

<body>

<div id="menu">
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li><a href="home.jsp">My Home</a></li>
			<li  class="current_page_item"><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			<!-- <li><a href="#">Groups</a></li>   -->
			
			
	 			
			<li>
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="50px">
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


<div class="post" style="position:absolute; width:560px; margin:0px auto;left:300px;">

<label style="font-face:Elephanta;font-size:2em;color:#3D2729";>
Related Search Profiles :: </label>
<br>
<br>

<form name="send_friend_request">
<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");






String name = request.getParameter("name");

//System.out.println("in list fname="+fname);
System.out.println("in list name :: "+name);

String s=name;
System.out.println("s= "+s);
String y="";
String[] result=null;
String fname123=null;
String lname123=null;

// finding whether " " exists in name
//

String space=" ";
boolean i=name.contains(" ");
System.out.println("i:: "+i);

if(i==true)
{
result=s.split(" ");
System.out.println("result = "+result);
System.out.println("after splitting s= "+s);
	
	int count=0;
	for (int x=0; x<result.length; x++) 
	{
		y=result[x];
		System.out.println("y ="+y);
		//count++;
	
	}
	fname123=result[0];	

	lname123=result[1];
}
else
{
	fname123=name;	
}

System.out.println("result[0] = "+fname123);
System.out.println("result[1] = "+lname123);





Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st116=con.createStatement();
Statement st5=con.createStatement();

int fuid=0;
int pic_id=0;
String sql123 = "select * from basic_info where first_name='"+fname123+"' AND last_name='"+lname123+"' or first_name='"+fname123+"'";
System.out.println(sql123);
ResultSet rs1=st.executeQuery(sql123);

System.out.println("outside while..");
String username=null;
String email=null;
String hometown=null;
String current_pos=null;
%>
<%
while(rs1.next())
{
	//System.out.println("in while in list");
	fuid=rs1.getInt("uid"); 
	pic_id=rs1.getInt("p_id");
	System.out.println("searched uid in listoffriends.jsp ="+fuid);
	username=rs1.getString("username");
	email=rs1.getString("email");
	lname123=rs1.getString("last_name");	
	ResultSet rs2=st1.executeQuery("select * from advanced_personal where uid="+fuid);
	while(rs2.next())
	{
		hometown=rs2.getString("hometown");
		
	}
	ResultSet rs3=st2.executeQuery("select * from advanced_professional where uid="+fuid);
	while(rs3.next())
	{
		current_pos=rs3.getString("curr_job");
		
	}
	
	
		
	%>

	<input type="hidden" value=<%=fname123%> name="fname" id="fname">
	<input type="hidden" value=<%=lname123%> name="lname" id="lname">
	
	
	<div style="width:700px;height:100px;">
	<div style="float:left;width:420px;">
	<div style="float:left;width:120px";>
	
		<a href="checkfriend.jsp?fuid=<%=fuid %>" >
	<%
	
	
	if(pic_id==0)
	{
    	  System.out.println("no profile picture has been added!");
    	  %>
    	  
    	  <img src="images/default.jpg" alt="no profile" width="90" height="90">
    	  
    	  <%
      }//end of if(empty)
 
      else
      {
  	 	System.out.println("pic id="+pic_id);
     	String sql116="select * from image_try where p_id="+pic_id;
     	ResultSet rs116=st116.executeQuery(sql116);
     	String path=null;
     	while(rs116.next())
     	{
         	path=rs116.getString("img_path");
     	}

     	%>
     	   	     <img src="<%=path%>" alt="profile picture" width="90" height="90">

	     <%

      }
      	  	
     
%>
</a>
	</div>
	<div style="float:right;width:300px;">
	
	
	
	<%System.out.println("friend uid is:"+fuid); %>
		<a href="checkfriend.jsp?fuid=<%=fuid %>" ><h3>
		<label style="font-face:Algerian;font-size:1em;color:#F6B300";><b><u><%=fname123 %>  &nbsp;<%=lname123 %></u></b></label></h3></a>
		<br><label style="font-face:Elephanta;font-size:1em;color:#3D2729";> Email : <%=email %></label> 
		<br> <label style="font-face:Elephanta;font-size:1em;color:#3D2729";>Hometown : <%=hometown %></label>
		<br> <label style="font-face:Elephanta;font-size:1em;color:#3D2729";>Currently Working at : <%=current_pos %></label>
		
	</div>
	
</div>

	<%
	
}
if(fuid==0)
{
	%>
	<br>
		<br>	<br>	<br>
	<label><h1>No search results found!!!</h1></label>
<%
}



} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else

%>
</div>

</form>

		--------------------------------------------------------------------------------------------------------------------

</div>

</div>
</div>
</div>
</div>
</form>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>