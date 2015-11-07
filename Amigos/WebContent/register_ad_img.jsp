<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<%@ page import="java.lang.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
</head>
<body>
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


int checker=(Integer)session.getAttribute("checker123");
//int checker=Integer.parseInt("checker1");
int ad_id1=(Integer)session.getAttribute("ad_id3");
System.out.println("checker in register_ad_image page="+checker);
System.out.println("session ad id="+ad_id1);

String userid1=session.getAttribute("uid123").toString();
int userid=Integer.parseInt(userid1);

String saveFile="";
String contentType = request.getContentType();
if((contentType != null)&&(contentType.indexOf("multipart/form-data") >= 0))
{

System.out.println("in content type part re!");

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


System.out.println("absolut path="+abs+"\n");


java.io.File file1 = new File(abs+"images/"+userid+"/advertisement/");

if(!file1.exists())
   file1.mkdirs();

saveFile="images/"+userid+"/advertisement/"+saveFile;

System.out.println("filecha path appended wala! ::"+saveFile);

File ff = new File(saveFile);

System.out.println("filecha path::"+ff);


FileOutputStream fileOut = new FileOutputStream(abs+ff);

fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
%>

  
 
<%System.out.println(saveFile);%>
<%
Connection connection = null;
String connectionURL = "jdbc:mysql://localhost:3306/amigos";
PreparedStatement psmnt = null;
PreparedStatement psmnt1 = null;


try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	connection = DriverManager.getConnection(connectionURL, "root", "rutuja");
	Statement st=connection.createStatement();
	
	
	Statement st11=connection.createStatement();
System.out.println("outside checker1");


	psmnt = connection.prepareStatement("insert into ad_image(img_path) values(?)");

	psmnt.setString(1, ff.getPath());
	int s = psmnt.executeUpdate();
	
	ResultSet rs=st11.executeQuery("select * from ad_image where p_id=last_insert_id()");
  	String id1=null;
  	String path=null;
  	
  	while(rs.next())
  	{
  		id1=rs.getString("p_id");
  		path=rs.getString("img_path");
  	}
  	System.out.println("select zala recently added p_id!"+id1);
  	
  	System.out.println("ad_id in register_ad_img page="+ad_id1);
  	
	if(checker==1)
	{
	String sql11="update register_ad set p_id="+id1+" where ad_id="+ad_id1;
	st11.executeUpdate(sql11);
	}
	else
	{
		if(checker==2)
		{
			System.out.println("b4 update in bid pi_id");

		String sql11="update bid set p_id="+id1+" where ad_id="+ad_id1;
		System.out.println(sql11);
		st11.executeUpdate(sql11);
		

	  	System.out.println("ad_id in register_ad_img  b4 auction wala update entry page="+ad_id1);
	  	
		Statement st12=connection.createStatement();
//added by devika so dat bid eventcha function hoto
System.out.println("ad_id1 = "+ad_id1);
		String sql12="update register_ad set p_id="+id1+" where ad_id="+ad_id1;
	System.out.println(sql12);
		st12.executeUpdate(sql12);
		//-------------------
		
		
		}
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
response.sendRedirect("Payment.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>
</body>
</html>