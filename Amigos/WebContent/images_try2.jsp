
<%@ page language="java" %>
<HTML>

<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
 
<link rel="stylesheet" href="style.css" />

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

<script type="text/javascript" src="jq2.js"></script>
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
$(document).ready(function() {
    $('#upload').bind("click",function() 
    { 
        var imgVal = $('#uploadImage').val(); 
        if(imgVal=='') 
        { 
            alert("Please select an image file for uploading!"); 

        }
        else
         	
        	{
      
        	if (!imgVal.match(/(?:gif|jpg|png|bmp)$/))
        	{
        	    // inputted file path is not an image of one of the above types
        	    alert("Invalid File format ! Please select an image file for uploading!");
        	    window.location.href="album1.jsp";
        	}
        	else
        	{
        		//alert("!!!!!!!!!!!!!!!!!!!aat!!!!!!!!!!");
        	response.sendRedirect("uploadfile4.jsp");
        	}
        	
        	}
      return false;
    }); 
});
</script> 
 
    


</head>


<body>
<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></a></li>		
			<li><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
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



<%


%>


<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->

<div style="background:#3D2729;width:620px;height:400px;left:350px;margin:0px auto">
<br>
<br>
<br>
<div class="post" style="position:absolute; width:500px; margin:0px auto;height:200px;left:390px;color:#3D2729">
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


%>
<br>
<br>
<br>
<FORM ENCTYPE="multipart/form-data" ACTION="upload_profile.jsp" METHOD=POST>
<center>
<table border="0">
<tr>
<center><td colspan="2" align="center"><font face="Palatino Linotype" size=3em color=#3D2729>UPLOAD NEW PROFILE PICTURE</font></center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b><font face="Palatino Linotype" size=3em color=#3D2729>Choose the file To Upload:</font></b></td>
<td><INPUT NAME="file" TYPE="file" id="uploadImage"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="Send File" style="color:#F1EDE4" class="button" id="upload"> </td></tr>
<table>
</center>

</FORM>
</table>
</table>
</center>
</FORM>
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
</div>

</body>
</HTML>