<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
  <link rel="stylesheet" href="style.css" />
<link rel="stylesheet" media="screen" type="text/css" href="zoomimage.css" />
<link rel="stylesheet" media="screen" type="text/css" href="custom.css" />
<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="eye.js"></script>
<script type="text/javascript" src="utils.js"></script>
<script type="text/javascript" src="zoomimage.js"></script>
<script type="text/javascript" src="layout.js"></script>
 
    
  <link rel="shortcut icon" href="images/favicon.ico" />
   
  
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




<%
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



System.out.println("in album1.jsp");
String searchUid1 = request.getParameter("searchUid");
int searchUid=Integer.parseInt(searchUid1);

session.setAttribute("searchUid",searchUid);
String getname = (String) session.getAttribute("name");

String getpwd = request.getParameter("pwd");

System.out.println("in album1.jsp 1st uid="+searchUid+"\n");

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

      
  <h3>Profile Pictures</h3>
  

  
    <%
    
    counter=0;
    Statement st6=con.createStatement();
    Statement st7=con.createStatement();
    Statement st8=con.createStatement();
    Statement st10=con.createStatement();
    
    Statement st11=con.createStatement();
    Statement st28=con.createStatement();

    Statement st12=con.createStatement();
    Statement st17=con.createStatement();
    Statement st18=con.createStatement();
    %>
    <table>
    <tr>
    <%

   
          		int album_id3=0;
    	        String sql8=("select * from album where uid="+searchUid+" and album_names='profile'");
      	        
      	        ResultSet rs19=st18.executeQuery(sql8);
      	        
      	        boolean empty=true;
      	        while(rs19.next())
      	        {
      	        	empty=false;
      	        	
      	        }
      	        
      	        if(empty==true)
      	        {
      	        out.println("no profile pictres as yet!!!");
      	        System.out.println("no prof pictures by user!");
      	        }
      	        else
      	        {
      	        
      	        	
      	        	String sql28=("select * from album where uid="+searchUid+" and album_names='profile'");
          	        
          	        ResultSet rs29=st28.executeQuery(sql28);
          	        String name2=null;
      	        while(rs29.next())
      	        {
      	        	album_id3=rs29.getInt("album_id");
      	        	name2=rs29.getString("p_id");
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
    	    	 <a href="passAlbumName1.jsp?album_id=<%=album_id3 %>" >
    	       
    	         	 <img src="<%=z %>" width=250px height=200px  style="border:double 12px #3D2729;">
    	         	 <br>
    	         	
    	         
    	   
    	         Profile
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
     
    
 <FORM action="passAlbumName1.jsp" method="POST">
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
    <%String sql="select * from album where uid="+searchUid+" and album_names!='profile'";
    ResultSet rs=st.executeQuery(sql);
    boolean empty1=true;
    
    while(rs.next())
    {
    	empty1=false;
    }
    
    if(empty1)
    {
    	out.println("no albums created till now!");
    	
    }
    else
    {

        String sql22="select * from album where uid="+searchUid+" and album_names!='profile'";
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
    	    	String sql1=("select * from album where uid="+searchUid+" and album_names='"+an+"'");
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
    	         	 <a href="passAlbumName1.jsp?album_id=<%=album_id %>" >
    	       
    	         	 <img src="<%=z1 %>" width=250px height=200px  style="border:double 12px #3D2729;">
    	         	 <br>
    	         	
    	         
    	         <center>
    	         	 <%=an %>
    	         	 </center>
    	         
    	  
    	         	
    	         	 
    	         	 </a>
    	         	  </div>
				</td>
					
				<%
    	    	
    	    	
    	    	
    	    }
    	    else
    	    {
    	    	%>
    	    <td>	
    	    <%
    	String sql1=("select * from album where uid="+searchUid+" and album_names='"+an+"'");
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
         	 <a href="passAlbumName1.jsp?album_id=<%=album_id %>" >
       
         	 <img src="<%=z1 %>" width=250px height=200px  style="border:double 12px #3D2729;">
         	 <br>
         	 	
         	
         
         
    	         <center>
    	         	 <%=an %>
    	         	 </center>
         	
         	 </a>
         	 	 </div>
        
         	 </td>
   

         
    	<%
    	count_al++;
    	    }
    }
    }
    
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





    
    
    
    
    
     %>
   </tr>
   </table>
   
     </FORM>  
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