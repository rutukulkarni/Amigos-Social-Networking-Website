<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<html lang="en">
<head>
   
	<style>
	body
	{
	background-image: url('bg1.bmp');
	}
	p.p1
	{
	text-align:center;
	color:purple;

	}
	p.p2
	{
	text-align: right;
	color: blue;
	font-size: 18px;
	}
	#left
{
float:left;
}
#right
{
float:right;
}
	#center
{

margin:auto;
}
	
	</style>
	
    <title>profile page</title>
    
    <link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
    
       
    <script>
    $(function() {
        $( "#tabs" ).tabs();
    });
    </script>
  
      
</head>
<body>





<p class=p1>


<script type="text/javascript">
		function check_friend()
{
//String firstname=document.getElementById("searchFirstname").value;
//String lastname=document.getElementById("searchLastname").value;
 window.location.href="listOfFriends.jsp?firstname="+document.getElementById("searchFirstname").value+"&lastname="+document.getElementById("searchLastname").value;
}
</script>


</p>
<p class=p2>
<a href="login.jsp"><font color="blue"> Sign-Out</font></a>

<br>
<br>
<br>
<br>
</p>

<br>

 
 <a href="images_try2.jsp"><font size=3px><font color=blue>Change profile picture..</font></font></a>
<div id="mydiv2">
	<div id="left" class="left-content" title="Subdivision Div Element1" style="font-size:16px;color: purple; border: 1px solid white;width:200px;height:150px">
      <%
      String saveFile="";
      String contentType = request.getContentType();
      if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0)){
      DataInputStream in = new DataInputStream(request.getInputStream());
      int formDataLength = request.getContentLength();
      byte dataBytes[] = new byte[formDataLength];
      int byteRead = 0;
      int totalBytesRead = 0;
      while(totalBytesRead < formDataLength){
      byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
      totalBytesRead += byteRead;
      }
      String file = new String(dataBytes);
      saveFile = file.substring(file.indexOf("filename=\"") + 10);
      saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
      saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
      int lastIndex = contentType.lastIndexOf("=");
      String boundary = contentType.substring(lastIndex + 1,contentType.length());
      int pos;
      pos = file.indexOf("filename=\"");
      pos = file.indexOf("\n", pos) + 1;
      pos = file.indexOf("\n", pos) + 1;
      pos = file.indexOf("\n", pos) + 1;
      int boundaryLocation = file.indexOf(boundary, pos) - 4;
      int startPos = ((file.substring(0, pos)).getBytes()).length;
      int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

      String abs=getServletContext().getRealPath("/");
      int id=1;

      saveFile="images/"+id+"/profile/"+saveFile;


      System.out.println("filecha path appended wala! ::"+saveFile);


      File ff = new File(saveFile);

      System.out.println("filecha path::"+ff);


      FileOutputStream fileOut = new FileOutputStream(abs+ff);
      fileOut.write(dataBytes, startPos, (endPos - startPos));

      fileOut.flush();
      fileOut.close();
      %>
      <%System.out.println(saveFile);%></td></tr></table>
      <%
      Connection connection = null;
      String connectionURL = "jdbc:mysql://localhost:3306/amigos";
      PreparedStatement psmnt = null;
      try{
      	Class.forName("com.mysql.jdbc.Driver").newInstance();
      	connection = DriverManager.getConnection(connectionURL, "root", "rutuja");
      	psmnt = connection.prepareStatement("insert into image_try(img_path) values(?)");
      	Statement st=connection.createStatement();
      	Statement st1=connection.createStatement();
      	Statement st2=connection.createStatement();
      	Statement st3=connection.createStatement();
      	Statement st4=connection.createStatement();
   
      	
      	System.out.println("Absolute Path is: "+ getServletContext().getRealPath("/"));
      	
      	
      	psmnt.setString(1, ff.getPath());
      	int s = psmnt.executeUpdate();
      	
      	ResultSet rs=st.executeQuery("select * from image_try where p_id=last_insert_id()");
      	String id1=null;
      	String path=null;
      	
      	while(rs.next())
      	{
      		id1=rs.getString("p_id");
      		path=rs.getString("img_path");
      	}
      	System.out.println("select zala!"+id1);
      	
      	//ResultSet rs4=st4.executeQuery("select * from image_try where p_id="+id1);

      	//String imag1=null;
      	//while(rs4.next())
      	//{
      	//	imag1=rs4.getString("img_path");
      	//}
      	//System.out.println("in img on profile from image_try"+imag1);
         	
      	//ResultSet rs1=st1.executeUpdate("Update album set p_id=concat(p_id,',','"+id1+"') where uid=1 and album_name='prof'");
   %>
      	
      	<img src="<%=path%>" alt="display_prof img" width="150px" height="150px">
      	<%
      	
      	
      	if(s>0)
      	{
      		System.out.println("Uploaded successfully !");
      	}	
      	    
      	else
      	{
      		System.out.println("Error!");	
      	}
      	}
      catch(Exception e){
          e.printStackTrace();
      }

      }

      %>
    
    </div>
        
        
    <div id="left" class="left-content" title="Subdivision Div Element1" style="background-color:white;font-size:16px;color: purple; border: 1px solid purple;width:200px;height:150px">
    <br>
    <label for="Gender">Gender :</label><br>
	<label for="Dob">Date of Birth :</label><br>
	<label for="mood">Mood :</label><br>
	<label for="mood">At :</label><br>
    
    </div>
	
  	<div id="right" class="right-content" title="Subdivision Div Element3" style="font-family: Helvetica;background-color:white;font-size:16px;color: purple; border: 1px solid black;width:350px;height:150px"> 

	<form name="home" action="home.jsp" method="post" id="home">
	<p class=p1>
	<input type="submit" value="Home"  style="color:purple;font-size:16px">
	</p>
	</form>
	
	
	<FORM name="login" action="otherProfile.jsp" METHOD="POST">
	<p class=p1>
	<label>First Name:</label>
	<input type="text" name="searchFirstname" id="searchFirstname">
	<br>
	<label>Last Name:</label>
	<input type="text" name="searchLastname" id="searchLastname">  
	<br><br>
	<input type="button" value="search friend"  style="color:purple;font-size:16px" name="visit_profile" onclick="check_friend()">
	</p>
 	</FORM>
  	</div>
  
  	<div id="center" class="middle-content" title="Subdivision Div Element2" style="color:white;font-family: Helvetica;background-color:purple;font-size:16px;color: purple; border: 1px solid black;width:300px;height:150px">

	<p class=p1>
	<a href="home.jsp"><font color="white"> My Home! </font></a>
	<br>
	<br>
	<a href="message.jsp"><font color="white"> My Messages! </font></a>
	<br>
	<br>
	<a href="Groups"><font color="white"> My Groups !</font></a>
	<br>
	<br>
	<a href="view_album.jsp"><font color="white"> My Albums! </font></a>
	
	</p>
  	</div>

</div>

<br>
<div id="whole_div" style="color: blue; border: 1px solid white;">
 
  <div id="left" class="left-content" title="Subdivision Div Element" style="background-color:purple;font-size:16px;color: white; border: 1px solid black;width:200px;height:500px">
    <p>Advertisement Space</p>
  </div>
  
    <div id="right" class="right-content" title="Subdivision Div Element" style="background-color:purple;font-size:16px;color: white; border: 1px solid black;width:150px;height:500px">
    <p>Advertisement Space</p>
  </div>
  
  <div id="center" class="middle-content" title="Subdivision Div Element" style="font-size:16px;color: blue; border: 1px solid white;width:700px;height:500px">
  
 <div id="tabs" >
    <ul>
        <li><a href="#tabs-1">Personal</a></li>
        <li><a href="#tabs-2">Professional</a></li>
        <li><a href="#tabs-3">Wall</a></li>
    </ul>
    
    <div id="tabs-1"> 
    <script>
 	 $("#tabs-1").load("personal.jsp");
	</script>
      
    </div>   
    
    
    <div id="tabs-2">
    <script>
 	$("#tabs-2").load("professional.jsp");
	</script>
    
    </div>
         
   	
    <div id="tabs-3">
    <script>
 	$("#tabs-3").load("wall.jsp");
	</script>       
    </div>
    
        
</div>
</div>
</div>

</body>
</html>


