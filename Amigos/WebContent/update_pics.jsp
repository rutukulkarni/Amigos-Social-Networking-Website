<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
//String uid=request.getParameter("uid");

//System.out.println("albumcha name of logger::="+album_name);
//System.out.println("id of logger::="+uid);

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String album_name="trial";
System.out.println("albumcha name:"+album_name);

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
int uid=1;

saveFile="images/"+uid+"/albums/"+saveFile;

System.out.println("filecha path appended wala! ::"+saveFile);

File ff = new File(saveFile);

System.out.println("filecha path::"+ff);


FileOutputStream fileOut = new FileOutputStream(abs+ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));

fileOut.flush();
fileOut.close();
%>


<br><table border="2"><tr><td><b>You have successfully upload the file:</b>
<%out.println(saveFile);%></td></tr></table>
<%


PreparedStatement psmnt = null;

PreparedStatement psmnt1 = null;

//PreparedStatement psmnt2 = null;

//Statement st1= con.createStatement(); 
//Statement st2=con.createStatement();


System.out.println("in try jatoy!");
		
try{
	
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");



PreparedStatement ps=null;

psmnt = con.prepareStatement("insert into image_try(img_path) values(?)");


	psmnt.setString(1, ff.getPath());
int s = psmnt.executeUpdate();
	System.out.println("after inserting in image_try path!");
	
	 Statement st=con.createStatement();
	 String s1=null;
      
    ResultSet rs=st.executeQuery("select * from image_try where p_id=last_insert_id();");

	while(rs.next())
	{
	%>
	<label><%=rs.getString(1)%></label>
<%
	s1=rs.getString(1);
	
 }
	System.out.println("after selct :="+s1);
	

	
	String sql ="update album set p_id=concat(p_id,',','"+s1+"') where album_id=1"; 
	ps=con.prepareStatement(sql);
	ps.executeUpdate();


	System.out.println("updated in album for album id =1!");
		
		%>
		
	
	Absolute Path is:<%= getServletContext().getRealPath("/")%> 
	
<%
	if(s>0)
	{
	System.out.println("Updated successfully !");
	
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

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>

</body>
</html>