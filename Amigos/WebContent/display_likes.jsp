<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>


    
</head>
<body>
<form id="like1" >
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//System.out.println("in display_likes.jsp!");
//String wall_id1=session.getAttribute("wall_id1").toString();
//String wall_id1=session.getAttribute("wall_id1").toString();
//System.out.println("wall _id1= "+wall_id1);
String wallpost=request.getParameter("wallpost");
String getname = request.getParameter("getname");
//String wallpost= Document.getElementbyId("wallpost");
System.out.println("in display_likes: Wall post ="+wallpost);
session.setAttribute("wallpost_id",wallpost);

String wall_id1=request.getParameter("wall_id1");
System.out.println("in display_likes: wall id1 ="+wall_id1);

String uid=session.getAttribute("uid").toString();
System.out.println("Session UID= "+uid);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st= con.createStatement();
Statement st1=con.createStatement();

ResultSet rs; 
ResultSet rs1;
String sql=null;
sql ="SELECT * from wall_posts order by w_id desc "; 
//where s_id=1 order by w_id desc

 rs=st.executeQuery(sql);
String wall="";
String wall_id="";
while(rs.next())
{
	wall=rs.getString("text_content");
	wall_id=rs.getString("w_id");
	out.println("usernames who liked this :: ");
 

String sql2="select * from wall_posts where w_id='"+wall_id+"'";
ResultSet rs2=st1.executeQuery(sql2);  
  	 String name=null;
     while(rs2.next())
     {
     	name=rs2.getString("likes");
     	
     }
String s=name;
String y="";
String [] names;
String[] result=s.split(",");
int count=0;
for (int x=0; x<result.length; x++) 
{
y=result[x];


String w="";
Statement st2=con.createStatement();
ResultSet rs3; 

String sql3="select * from basic_info where uid= '"+y+"'";
rs3=st2.executeQuery(sql3);

while(rs3.next())
{
w=rs3.getString("username");
//System.out.println("for wallpost id :: "+wall_id+ "dis person liked it :: "+w);
out.print(""+w+",");

}

count++;
}
//end of for loop

}
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>	
	
</form>
					
<label>-----------------------------------------------------------------------------</label>

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>

