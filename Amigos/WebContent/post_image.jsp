<%@ page language="java" %>
<HTML>
<head>


  <link rel="stylesheet" href="style.css" />
	 
<script type="text/javascript" src="jq1.js"></script>
	 
<script type="text/javascript" src="jq2.js"></script>

	<title>Amigos</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
   
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
        	    window.location.href="post_image.jsp";
        	}
        	else
        	{
        //		alert("!!!!!!!!!!!!!!!!!!!aat!!!!!!!!!!");
        	response.sendRedirect("uploadfile5.jsp");
        	}
        	
        	}
      return false;
    }); 
});
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

<body>
<div id="menu">
	<div id="menu-wrapper">
		<ul>
			<li class="current_page_item"><a href="home.jsp">Homepage</a></li>
			<li><a href="prof.jsp">Profile</a></li>
			<li><a href="album1.jsp">Gallery</a></li>
			<li><a href="message.jsp">Messages</a></li>
			<li><a href="#">Groups</a></li>
			<li><a href="selectAdType.jsp">Create ad!</a></li>
			<li><a href="login.jsp">Sign-Out</a>
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
<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");
%>


  <div id="home_content_album" style="position:absolute; width:620px; margin:0px auto;height:400px;left:370px;">


  <div class="post" >


<FORM ENCTYPE="multipart/form-data" ACTION="uploadfile5.jsp" METHOD=POST>



 

 
<br>
<br>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <center>
<div id="center" class="middle-content" style="background-color:#3E282A;color:white;width:550px;height:300px;">
 
    
   <br>
   <br>
   <br>
   <br>


<center>
<table border="0" bgcolor=#F1EDE4>
<tr>
<center><td colspan="2" align="center"><B>UPLOAD PICTURE</B></center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file" id="uploadImage"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center">
<input type="submit" onclick="album_acc()" class="button" value="Upload File" id="upload" style="color:#F1EDE4"> </td></tr>
<table>
</center>

</FORM>
</table>
</table>
</center>
</FORM>

</div>
</div>
</div>
</div>
</div>
<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>


</body>

</HTML>