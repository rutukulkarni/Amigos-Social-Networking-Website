<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<HTML>

<head>
<title>Amigos</title>
   <link rel="shortcut icon" href="images/favicon.ico" />
   
<link rel="stylesheet" href="style.css" />
<style>
	
	p.p2
	{
	text-align: right;
	color: blue;
	font-size: 18px;
	}
	

</style>

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
  <div id="content">
<div class="post">


<%

//String username=request.getParameter("uname1");
//System.out.println("IN uploadfile4 :: "+username);
//request.setAttribute("username",username);

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



String userid1= session.getAttribute("uid").toString();
int userid=Integer.parseInt(userid1);

System.out.println("in uploadfile4::uid in session ::"+userid);

String saveFile="";
//String saveFile1="";

String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0))
{
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while(totalBytesRead < formDataLength)
{
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
int ch=0;
System.out.println("in uploadfile4 ga saveFile="+saveFile);
if(saveFile.contentEquals(""))
{
System.out.println("Please select an image File!");	
ch=1;
}
else
{


java.io.File file1 = new File(abs+"images/"+userid+"/uploaded/");

if(!file1.exists())
  file1.mkdirs();

saveFile="images/"+userid+"/uploaded/"+saveFile;

System.out.println("filecha path appended wala! ::"+saveFile);



File ff = new File(saveFile);


System.out.println("filecha path::"+ff);



FileOutputStream fileOut = new FileOutputStream(abs+ff);


fileOut.write(dataBytes, startPos, (endPos - startPos));


fileOut.flush();
fileOut.close();


Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/amigos";
PreparedStatement psmnt = null;
PreparedStatement psmnt1 = null;


try
{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "rutuja");
	Statement st=connection.createStatement();
	Statement st1=connection.createStatement();
	Statement st5=connection.createStatement();
	Statement st2=connection.createStatement();
	Statement st3=connection.createStatement();
	Statement st4=connection.createStatement();
	Statement st41=connection.createStatement();
	Statement st42=connection.createStatement();
	Statement st43=connection.createStatement();
	Statement st44=connection.createStatement();
	Statement st444=connection.createStatement();

	Statement st48=connection.createStatement();
	psmnt = connection.prepareStatement("insert into image_try(img_path) values(?)");
	%>

	
<%
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
  	
  	st48.executeUpdate("insert into wall_posts(s_id,r_id,text_content,likes,type,dislikes) values('"+userid+"','"+userid+"',"+id1+",0,1,0)");
  	
  	
	System.out.println("select zala wd updated lik!"+id1);
  	String sql41="update image_try set likes=0 where p_id="+id1;
  	st41.executeUpdate(sql41);
  	System.out.println("select zala wd updated lik!"+id1);
  	
 	System.out.println("select zala wd updated lik!"+id1);
  	String sql42="update image_try set dislikes=0 where p_id="+id1;
  	st42.executeUpdate(sql42);
  	System.out.println("select zala wd updated like!"+id1);
  	
  	 String sql6=("select * from album where uid="+userid+" and album_names='uploaded'");
     
     ResultSet rs3=st5.executeQuery(sql6);
	 boolean empty=true;
	 while(rs3.next())
	 {
		 empty=false;
	 }
	 
     if(empty)
     {
   	  System.out.println("no  picture has been added in uploaded album by user!");
   
	String sql1="insert into album(uid,album_names,p_id)values('"+userid+"','uploaded','"+id1+"')";
	st1.executeUpdate(sql1);
	
	System.out.println(" PICTURE ADDED!!");

     }

     else
     {
	String sql1 ="update album set p_id=concat(p_id,',','"+id1+"') where uid="+userid+" and album_names='uploaded'"; 
	st2.executeUpdate(sql1);


	System.out.println("updated!");
	
	  }


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


response.sendRedirect("album1.jsp");

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



}
%>
</div>
</div>
</div>
</div>
</div>
</div>

</body>
</HTML>


