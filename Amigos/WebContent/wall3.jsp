<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>wall ::</title>

<script>
function like(wall_id)
{
	//alert("hi "+wall_id);   
	window.location.href="like.jsp?wall_id="+wall_id;	
}
</script>

    
</head>
<body>
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");
%>

<FORM name="trywall" action="post_wall.jsp" METHOD="POST">
<p>
Wallpost: <input type="text" name="wallpost" id="wallpost"><br>

<input type="submit" value=" POST WALL">
</FORM>


<form id="like1" >
			
  

<%
Integer a=(Integer)session.getAttribute("a");
System.out.println("in wall3.jsp :: a = "+a);
System.out.println("in wall1.jsp!");
String wallpost=request.getParameter("wallpost");
String getname = request.getParameter("getname");
//String wallpost= Document.getElementbyId("wallpost");
System.out.println("in wall1: Wall post ="+wallpost);
System.out.println("inwall1 :getname = "+getname);
session.setAttribute("wallpost_id",wallpost);

String uid=session.getAttribute("uid").toString();
System.out.println("Session UID= "+uid);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st= con.createStatement();
Statement st1=con.createStatement();

ResultSet rs; 
ResultSet rs1;


//String sql1=("INSERT into wall_posts (text_content) VALUES ('"+wallpost+ "') ");
//rs1=st1.executeQuery(sql1);

//System.out.println("in wall1.jsp!");
//String wallpost=request.getParameter("wallpost");
//String getname = request.getParameter("getname");
//String wallpost= Document.getElementbyId("wallpost");
//System.out.println("in wall1: Wall post ="+wallpost);
//System.out.println("inwall1 :getname = "+getname);
//session.setAttribute("wallpost_id",wallpost);

//Statement st= con.createStatement();
//ResultSet rs;
String sql=null;
sql ="SELECT * from wall_posts order by w_id desc "; 
//where s_id=1 order by w_id desc

 rs=st.executeQuery(sql);
String wall="";
Integer wall_id=0;
while(rs.next())
{
	//System.out.println("in rs.last");
	wall=rs.getString("text_content");
	wall_id=rs.getInt("w_id");
	%>
	
	<br> </br>
	<% 
out.println("wallpost = "+wall ); 


	//session.setAttribute("wall_id",wall_id);
	
	
	if(wall_id==a)
	{
	System.out.println("wall id= a!");
	}
	else
	{
	%>
	
	<input type="button" value="LIKE " onclick="like(<%=wall_id%>);">
	 
<% 		
	}
	
	
	
}


String fuid="";
fuid=session.getAttribute("fuid").toString();
System.out.println("in wall.jsp fuid = "+fuid);
session.setAttribute("fuid",fuid);


} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>	
	
</form>
					
<label>-----------------------------------------------------------------------------</label>

</body>
</html>

