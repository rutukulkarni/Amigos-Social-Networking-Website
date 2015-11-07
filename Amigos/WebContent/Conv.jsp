<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
  
  <link rel="stylesheet" href="style.css" />
 <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
    <script>

function check_friend()
{
//alert("aata!");
//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}

</script>

    
    
<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#right_sidebar_adv').load('ad_display_auc2.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds

</script>


<script type="text/javascript">

function refresh(sender)
{
   var retVal = confirm("Do you want to delete this picture ?");
   if( retVal == true ){
      //alert("User wants to delete!");
      window.location.href="Conv.jsp?sender="+sender;
	  return true;
   }
   else{
      //alert("User does not want to delete!");
      //window.location.href="passAlbumName.jsp?album_id="+albumId;
      return false;
   }
}




</script>
<script type="text/javascript">
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
</head>
<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			<li><a href="home.jsp">My Home</a></li>
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

<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->


<div class="post" style="width:500px; margin:0px auto;left:350px;">

<% 
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



String sender=request.getParameter("sender");
System.out.println("sent to conv page="+sender);
%>

<div style="float:right;">
<a href="Conv.jsp?sender=<%=sender%>" class="button">Refresh Conversation</a>

</div>
<br>

<font face="Palatino Linotype" size=4em color="#3D2729">
Conversation with &nbsp;
</font>
<font face="Palatino Linotype" size=4em color="#F6B300" style="text-transform:capitalize">

 <%=sender %> :
</font>
<br>
<br>
<%
int sender_id=0;
System.out.println("in conv.jsp");

String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
Statement st1=con.createStatement();

Statement st2=con.createStatement();
Statement st5=con.createStatement();

Statement st3=con.createStatement();
String sender_name=null;
int pic_id=0;
String sql3="select * from basic_info where username='"+sender+"'";
ResultSet rs3=st3.executeQuery(sql3);
while(rs3.next())
{
	pic_id=rs3.getInt("p_id");
	sender_id=rs3.getInt("uid");
	sender_name=rs3.getString("username");
}

System.out.println("in conv sender_id="+sender_id);

Statement st7=con.createStatement();
String username=null;
int pic_id1=0;
String sql7="select * from basic_info where uid='"+uid+"'";
ResultSet rs7=st7.executeQuery(sql7);
while(rs7.next())
{
	pic_id1=rs7.getInt("p_id");
	username=rs7.getString("username");
}


//ooString cont=request.getParameter("content");
//ooSystem.out.println("cont in conv ="+cont);
//ooSystem.out.println("in conv sender_id="+sender_id);
//ooString sql9="insert into mess_info(sid,rid,sen_name,rec_name,content) values("+uid+","+sender_id+",'"+username+"','"+sender_name+"','"+cont+"')";

//int i=st5.executeUpdate("insert into mess_info(sid,rid,sen_name,rec_name,content) values("+uid+","+sender_id+",'"+username+"','"+sender_name+"','"+cont+"')");
//System.out.println(+i+"rows updated");


//ooSystem.out.println(sql9);

String sql4="select * from mess_info where rid =" +uid+" AND sid="+sender_id+" OR sid =" +uid+" AND rid="+sender_id; 
ResultSet rs1=st.executeQuery(sql4);
System.out.println(sql4);

while(rs1.next())
{
%>

<font face="Palatino Linotype" size=4em color="#F6B300" style="text-transform:capitalize"><%=rs1.getString(4)%> </font> : 

<font face="Palatino Linotype" size=4em color="#3D2729"><%=rs1.getString(6) %></font>

<br><br>

<%
}
%>

<center>

<form method="post" action="ReplyStore.jsp">
<center>

<textarea rows="7" cols="50"  id="content1" name="content1" maxlength="145" >
</textarea><br>

</center>




<input type="hidden" value=<%=sender_name%> name="sender">

<br>
	
	<input type="submit" value="Reply" class="button" style="color:#F6B300">

</form>
</center>
</div>
<%
}
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
	

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>



</body>
</html>