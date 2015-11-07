
 <%@ page import="java.sql.*"%>

<%@ page language="java" %>
<HTML>
<head>

  <link rel="stylesheet" href="style.css" />
	 
<script type="text/javascript" src="jq1.js"></script>
	 
<script type="text/javascript" src="jq2.js"></script>
	 
	 
	<title>Amigos</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
    <script>

function check_friend()
{
document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;
}
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
      
        	if (!imgVal.match(/(?:gif|jpg|JPG|png|bmp)$/))
        	{
        	    // inputted file path is not an image of one of the above types
        	    alert("Invalid File format ! ");
        	    window.location.href="album1.jsp";
        	}
        	else
        	{
        //		alert("!!!!!!!!!!!!!!!!!!!aat!!!!!!!!!!");
        	response.sendRedirect("uploadfile3.jsp");
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


<div id="left_sidebar_adv" style="width: 200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">

<%


%>
</div><!-- end of sidebar -->

<div id="right_sidebar_adv" style="width:200px;height:500px;	padding: 5px 5px 15px 5px;background: #ffffff;border: 1px solid #ffffff;">">

<%


%>
</div><!-- end of sidebar -->


<div class="post" style=" width:580px; margin:0px auto;left:350px;">


  <div class="post" >
  
  <%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

  %>
 <FORM ENCTYPE="multipart/form-data" ACTION="uploadfile3.jsp" METHOD=POST>
    
    <%

String name1 = (String) session.getAttribute("name");

String albumId1=session.getAttribute("albumId").toString();
int albumId=Integer.parseInt(albumId1);
 
System.out.println("album id in uploadfile2.jsp="+albumId);


//String album_name2 = (String) session.getAttribute("album_name1");

//System.out.println("in uploadfile.jsp album name="+album_name2+"\n");

System.out.println("in uploadfile.jsp album id="+albumId+"\n");

 System.out.println("in uploadfile2 page album id="+albumId);
 

 System.out.println("in "+albumId+" insert more pictures:");

 
 Class.forName("com.mysql.jdbc.Driver"); 
 java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

 
String album_name2=null;
String sql11="select * from album where album_id="+albumId;
Statement st11=con.createStatement();
ResultSet rs11=st11.executeQuery(sql11);
while(rs11.next())
{
	album_name2=rs11.getString("album_names");
}

 
 

 %>
<br>
   <label style="font-face:Elephanta;font-size:20px;color:#3E282A;"> 
   Add more photos to </label>
   <label style="font-face:cursive;font-size:30px;color:#F6B300;text-transform:uppercase;">
   <%=album_name2 %>
   </label>
    <label style="font-face:Elephanta;font-size:20px;color: #3E282A;"> 
    album :
   </label>


 

 
<br>
<br>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <center>
<div id="center" class="middle-content" style="background-color:#3E282A;color:white;width:500px;height:300px;">
 
    
   <br>
   <br>
   <br>
   <br>

	<center>
	<table border="0" bgcolor=#F1EDE4>
	<tr>
	<center><td colspan="2" align="center"><B>UPLOAD THE FILE</B></center></td>
	</tr>
	<tr><td colspan="2" align="center"> </td></tr>
	

	
	<tr><td><b>Choose the file To Upload:</b></td>
	<td><INPUT NAME="file" TYPE="file" id="uploadImage"></td>
	</tr>
	<tr><td colspan="2" align="center"> </td></tr>
	<tr><td colspan="2" align="center">
	
	<input type="submit" value="Upload File" onclick="album_acc()" class="button" id="upload" style="color:#F1EDE4"> </td></tr>
	

      

	</center>
	</FORM>
	
	</table>
	</center>
	</div>
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
	