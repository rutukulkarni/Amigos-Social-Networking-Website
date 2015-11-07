<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<html>
<head>

 <meta charset="utf-8" />
  <title>Amigos-My Gallery</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
       
  <link rel="stylesheet" href="style.css" />
<link rel="stylesheet" media="screen" type="text/css" href="zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="custom.css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="eye.js"></script>
<script type="text/javascript" src="utils.js"></script>
<script type="text/javascript" src="zoomimage.js"></script>
<script type="text/javascript" src="layout.js"></script>

  <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    	
    	
    	
    	
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
 
 <script>
 function album_check()
 {
	 if(document.getElementById("uploadAlbumName").value=="")
		 {
		 alert("please enter an album name!");
		 
	 return false;
 		}
 }
 </script>

    <script>
  $(function() {
    $( document ).tooltip({
      position: {
        my: "center bottom-20",
        at: "center top",
        using: function( position, feedback ) {
          $( this ).css( position );
          $( "<div>" )
            .addClass( "arrow" )
            .addClass( feedback.vertical )
            .addClass( feedback.horizontal )
            .appendTo( this );
        }
      }
    });
  });
  </script>
  
    <style>
  .ui-tooltip, .arrow:after {
    background: #3D2729;
    border: 2px solid #F6B300;
  }
  .ui-tooltip {
    padding: 10px 20px;
    color: #F6B300;
    border-radius: 20px;
    font:  11px "Helvetica Neue", Sans-Serif;
    text-transform: uppercase;
    box-shadow: 0 0 7px #3D2729;
  }
  .arrow {
    width: 50px;
    height: 16px;
    overflow: hidden;
    position: absolute;
    left: 50%;
    margin-left: -35px;
    bottom: -16px;
  }
  .arrow.bottom {
    top: auto;
    bottom: -16px;
  }
  .arrow.left {
    left: 20%;
  }
  .arrow:after {
    content: "";
    position: absolute;
    left: 20px;
    top: -20px;
    width: 25px;
    height: 25px;
    box-shadow: 6px 5px 9px -9px black;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    -o-transform: rotate(45deg);
    tranform: rotate(45deg);
  }
  .arrow.top:after {
    bottom: -20px;
    top: auto;
  }
 
 </style>

 <script>
function confirm_del_album(album_id)
{
   var retVal = confirm("Do you want to delete this album ?");
   if( retVal == true ){
     // alert("User wants to delete!");
      window.location.href="deleteAlbum.jsp?albumId="+album_id;
	  return true;
   }
   else{
      //alert("User does not want to delete!");
      //window.location.href="album1.jsp?album_id="+album_id;
      return false;
   }
}

</script>

<script type="text/javascript">
     var auto = setInterval(    function ()
     {
          $('#right_sidebar_adv').load('ad_display_auc2.jsp').fadeIn("slow");
     }, 5000); // refresh every 5000 milliseconds

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
<script>

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
			<li class="logo"><img src="images/Amigos.png" alt="amigos" height="30" width="50"></li>		
			<li><a href="home_try.jsp">My Home</a></li>
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



<%
System.out.println("in album1.jsp");

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);

String userid1 = session.getAttribute("uid123").toString();
int userid=Integer.parseInt(userid1);

String getname = (String) session.getAttribute("name");

String getpwd = request.getParameter("pwd");

System.out.println("in album1.jsp 1st uid="+userid+"\n");

System.out.println("in album1.jsp 1st name="+getname+"\n");
int counter=0;
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 
Statement st23=con.createStatement();
Statement st13=con.createStatement();
Statement st22=con.createStatement();
Statement st16=con.createStatement();
Statement st26=con.createStatement();
Statement st50=con.createStatement();
Statement st51=con.createStatement();

System.out.println("in album1.jsp after con");
%>


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
 <div class="post">

<FORM ENCTYPE="multipart/form-data" ACTION="uploadfile4.jsp" METHOD=POST>
    
<center>
<table border="0">
<tr>
<center><td colspan="2" align="center"><B>WANT TO UPLOAD IMAGE??</B></center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b>Choose the file To Upload:</b></td>
<td><INPUT NAME="file" TYPE="file" id="uploadImage"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center">
<input type="submit" style="color:#F6BA00" value="Upload Picture" id="upload" class="button"> </td></tr>
<table>
</center>

</FORM>

</table>
</table>
</center>
</FORM>

<table>

<tr>

<%
String sql26="select * from album where uid="+userid+" and album_names='uploaded'";
ResultSet rs26=st26.executeQuery(sql26);

boolean empty3=true;
while(rs26.next())
{
	empty3=false;
}

if(empty3==false)
{

String sql10="SELECT SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) + 1) FROM album where uid="+userid+" and album_names='uploaded'";

ResultSet rs20=st13.executeQuery(sql10);
while(rs20.next())
{
	 String a=rs20.getString("SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) + 1)");
	  System.out.println("count="+a);


if(Integer.parseInt(a)==1)//only 1 picture (p_id) in profile folder of user)
	{
		%>
		<td>
		<%
		System.out.println("in else of if(empty) in if(a==1)");
		
	    String sql8=("select * from album where uid="+userid+" and album_names='uploaded'");
      
      ResultSet rs21=st23.executeQuery(sql8);
      String name1=null;
      while(rs21.next())
      {
      	name1=rs21.getString("p_id");
        System.out.println("only a single picture in profile folder!="+name1);
      }
		
		String sql21=("select * from image_try where p_id="+name1);
		
 	ResultSet rs22=st22.executeQuery(sql21);
	String path=null;
		 while(rs22.next())
 {
	 
	 path=rs22.getString("img_path");
	 %>
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 

		    	 
		    		 
	  <a href="<%=path %>" title="picture" class="example2"> 
    <img src="<%=path%>" alt="profile picture" width="150" height="150">
    </a>

 <%
 System.out.println("only a single picture in profile folder!");
 }
		 %>
		 </td>
		 <%
		
	}
	else
	{
		System.out.println("in else of if(empty) in else(a==1)");
			
		    String sql23=("select * from album where uid="+userid+" and album_names='uploaded'");
	        
	        ResultSet rs23=st23.executeQuery(sql23);
	        String name2=null;
	        while(rs23.next())
	        {
	        	name2=rs23.getString("p_id");
	          System.out.println("only a single picture in profile folder!="+name2);
	        }
			
	  		     	 	
		String z=null;
		String y=null;
		System.out.println("names="+name2);
		String s=name2;
		System.out.println("s="+s);
		
		String[] result1=s.split(",");
		int result21=result1.length-1;
		
  	for (int x=result21; x>0; x--) 
  	{
		y=result1[x];


		if(counter!=3)
		{
	     String sql3=("select * from image_try where p_id="+y);
	     ResultSet rs4=st16.executeQuery(sql3);
	     
	     while(rs4.next())
	     {
	    	z=rs4.getString("img_path"); 
	    	%>
	    	<td>
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	
	    	 <a href="<%=z %>" title="picture" class="example2"> 
	    	<img src="<%=z%>" alt="album_wala" width="150" height="150">
	    	</a>
			</td>
			<%
			counter=counter+1;
			
	     }
		}
		else
		{
			counter=0;
			
			%>
			</tr>
			<tr>
			<%
			String sql3=("select * from image_try where p_id="+y);
	     	ResultSet rs4=st16.executeQuery(sql3);
	     
	    	 while(rs4.next())
	    	 {
	    	z=rs4.getString("img_path"); 
	    	%>
	    	<td>
	    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	    	 <a href="<%=z %>" title="picture" class="example2"> 
	    	<img src="<%=z%>" alt="album_wala" width="150" height="150">
			</a>
			</td>
			<%
			counter=counter+1;
	    	 }
	    	
		}
	  
  	}
  	%>
  	</tr>
  	
  	<%
   	
	}
		
}

%>
</table>
<%
}
else
{
	System.out.println("no uploaded pictures by user!");
}%>

</div>



 
<div class="post">

      
  <h3>Profile Pictures</h3>
  

  
    <%
    
    counter=0;
    Statement st6=con.createStatement();
    Statement st7=con.createStatement();
    Statement st8=con.createStatement();
    Statement st10=con.createStatement();
    
    Statement st11=con.createStatement();

    Statement st98=con.createStatement();
    Statement st12=con.createStatement();
    Statement st17=con.createStatement();
    Statement st18=con.createStatement();
    %>
    <table>
    <tr>
    <%

           		int album_id3=0;
    	        String sql8=("select * from album where uid="+userid+" and album_names='profile'");
      	        
      	        ResultSet rs19=st18.executeQuery(sql8);
      	        
      	        boolean empty=true;
      	        while(rs19.next())
      	        {
      	        	empty=false;
      	        	
      	        }
      	        
      	        if(empty==true)
      	        {
      	        out.println("no profile pictres as yet!!!");
      	        System.out.println("no profile pictures!");
      	        }
      	        else
      	        {
      	        	
   	          	String sql98=("select * from album where uid="+userid+" and album_names='profile'");
        	        
     	        ResultSet rs99=st98.executeQuery(sql98);
        	      
      	        String name2=null;
      	        while(rs99.next())
      	        {
      	        	album_id3=rs99.getInt("album_id");
      	        	name2=rs99.getString("p_id");
      	          System.out.println("multiple picture in profile folder!="+name2);
      	        }
    	  		     	 	
    			String z=null;
    			String y=null;
    			System.out.println("names="+name2);
    			String s=name2;
    			System.out.println("s="+s);
    		
    		String[] result3=s.split(",");
      	for (int x=0; x<result3.length; x++) 
      	{
    		y=result3[x];
    	
      	}
    	
    	     String sql17=("select * from image_try where p_id="+y);
    	     ResultSet rs17=st17.executeQuery(sql17);
    	     
    	     while(rs17.next())
    	     {
    	    	z=rs17.getString("img_path"); 
    	     }
    		
      		%>
   
    				<div>
    	    	
    	    	       <center>
    	    	 <a href="passAlbumName.jsp?album_id=<%=album_id3 %>" >
    	       
    	         	 <img src="<%=z %>" width=250px height=200px  style="border:double 12px #3D2729;">
    	         	 <br>
    	         	
    	         <font size=4px text-transform=capitalize>
    	   
    	         Profile
    	         </font>
    	         	 </center>
    	         
    	  
    	         	
    	         	 
    	         	 </a>
    	   </div>
    	
    			<%
              }
      	//end of for
      	%>
    
      	
 
  </div>
  <br>
  </tr>
  </table>
  </div>
  
  
  <div class="post">
  <h3>Albums!</h3>
     
    
 <FORM action="passAlbumName.jsp" method="POST">
  <%
Statement st= con.createStatement(); 
Statement st1= con.createStatement(); 
Statement st2= con.createStatement(); 
Statement st3= con.createStatement();
Statement st27= con.createStatement();

Statement st36= con.createStatement();

    %>
    <table>
    <tr>
    <%
        String sql="select * from album where uid="+userid+" and album_names!='profile' and album_names!='uploaded'";
    ResultSet rs=st.executeQuery(sql);
    boolean empty1=true;
    
    while(rs.next())
    {
    	empty1=false;
    }
    
    if(empty1==true)
    {
    	%>
    	<label>No albums!!</label>
    	<%
    }
    else
    {

        String sql22="select * from album where uid="+userid+" and album_names!='uploaded' and album_names!='profile'";
            ResultSet rs22=st.executeQuery(sql22);
 	   
    String an=null;
    Integer a_id=null;
    String album_id=null;
    int count_al=0;
    
  
    while(rs22.next())
    {
    	an=rs22.getString("album_names");
    	album_id=rs22.getString("album_id");
    	%>
    	
    	
    
    	<%
    	
    	  if(count_al==2)
    	    {
    	    	count_al=1;
    	    	%>
    	    	</td>
    	    	</tr>
    	    	<tr>
    	    	<td>
    	    	<%
    	    	String sql1=("select * from album where uid="+userid+" and album_names='"+an+"'");
    	    	ResultSet rs3=st2.executeQuery(sql1);
    	    	
    	    	 String name3=null;
    	    	 
    	         while(rs3.next())
    	         {
    	         	name3=rs3.getString("p_id");
    	   
    	         	
    	         }
    	         
    	        String z1=null;
    	        String z2=null;
    	        String y1=null;
    	        String y2=null;
    	        
    	        String s1=name3;
    	        String[] result1=s1.split(",");
    	       	int x=0;

    	    	   
    	        y1=result1[x];
    	          	         
    	        String sql3=("select * from image_try where p_id="+y1);
    	        ResultSet rs4=st3.executeQuery(sql3);
    	         	     
    	        while(rs4.next())
    	        {
    	         		z1=rs4.getString("img_path"); 
    	         		System.out.println("path to image:1="+z1);
    	         	          	     
    	        }
    	         	 
    				
    	        	
    	        
    	         	  %>
    	         	    	 <div>
    	         	    	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    	         	 <a href="passAlbumName.jsp?album_id=<%=album_id %>" >
    	       
    	         	 <img src="<%=z1 %>" width=220px height=170px  style="border:double 12px #3D2729;">&nbsp;&nbsp;
    	         	 <br>
    	         	 </a>
    	         	
    	         <div>
    	         <div style="float:left">
    	         	  <a href="passAlbumName.jsp?album_id=<%=album_id %>" >
    	       
         	    	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    	         	<font size=4px style="text-transform: capitalize;"><b> <%=an %></b></font>
    	         </a>
    	         </div>
    	         
    	        <div style="float:right">
    	         
				<a class="1" onclick="confirm_del_album(<%=album_id%>)">
				<img src="images/trash.jpg" height="30px" width="30px" title="Delete this Album">
				</a>
    	         </div>
    	         
    	         </div>
    	             	
    	         </div>
				</td>
					
				<%
    	    	
    	    	
    	    	
    	    }
    	    else
    	    {
    	    	%>
    	    <td>	
    	    <%
    	String sql1=("select * from album where uid="+userid+" and album_names='"+an+"'");
    	ResultSet rs3=st2.executeQuery(sql1);
    	
    	 String name3=null;
    	 
         while(rs3.next())
         {
         	name3=rs3.getString("p_id");
   
         	
         }
         
        String z1=null;
        String z2=null;
        String y1=null;
        String y2=null;
        
        String s1=name3;
        String[] result1=s1.split(",");
       int x=0;

    	   
        	y1=result1[x];
        	
        	
         
         
             String sql3=("select * from image_try where p_id="+y1);
             ResultSet rs4=st3.executeQuery(sql3);
         	     
         	 while(rs4.next())
         	{
         		z1=rs4.getString("img_path"); 
         		System.out.println("path to image:1="+z1);
         	          	     
         	}
         	 
			
         	  %>
         	    	 <div>
         	    	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         	 <a href="passAlbumName.jsp?album_id=<%=album_id %>" >
       
    		 <img src="<%=z1 %>" width=220px height=170px  style="border:double 12px #3D2729;">&nbsp;&nbsp;
    	         	 <br>
    	         	 </a>
    	         	
    	         <div>
    	         <div style="float:left">
    	         	  <a href="passAlbumName.jsp?album_id=<%=album_id %>" >
    	       
         	    	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    	         	<font size=4px style="text-transform: capitalize;"><b> <%=an %></b></font>  </a>
    	         </div>
    	         
    	        <div style="float:right">
    	         
				<a class="1" onclick="confirm_del_album(<%=album_id%>)">
				<img src="images/trash.jpg" height="30px" width="30px" title="Delete this Album">
				</a>
    	         </div>
    	         
    	         </div>
    	             	
    	         </div>
				         	 </td>
   

         
    	<%
    	count_al++;
    	    }
    }
    }
    
%>    

   </tr>
   </table>
   
     </FORM>  
  </div>
  
   

  <div class="post">
  <h3>Create albums</h3>
 
      
 
 <FORM ACTION="uploadfile1.jsp" METHOD=POST onsubmit="return album_check();">
	  	  Album Name:
	  	  <input type="text" name="album_name1" id="uploadAlbumName">
	<input type="submit" value=" Upload Photos" style="color:#F6BA00 " id="uploadAlbum" class=button>
	
	

 </FORM>
</div>


</div>
    </div>
     </div>
 
 	</div>
 
 	</div>
 
  <%
  
  }

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



  
  %>
<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
     
</body>
</html>