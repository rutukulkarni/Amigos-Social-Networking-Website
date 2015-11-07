<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>


<%@ 
page import="java.sql.*"
%>
<body>
<%
String uid = session.getAttribute("uid").toString();
System.out.println("in personal.jsp uid= "+uid);
//session.setAttribute("userid",userid);
session.setAttribute("uid", uid);
System.out.println("Session uid in personal.jsp is : "+uid+"\n");

Connection connection = null;

Statement statement = null;

ResultSet rs = null;

Class.forName("com.mysql.jdbc.Driver").newInstance();

connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

statement = connection.createStatement();

rs = statement.executeQuery("Select * from advanced_personal where uid="+Integer.parseInt(uid));

%>
<div style="color:#F1EDE4">

<%
while(rs.next())
{	
	String religion=rs.getString("religion");
	String relationship_status=rs.getString("relationship_status");
	String hometown=rs.getString("hometown");
	String languages=rs.getString("languages");
	String tv_shows=rs.getString("tv_shows");
	String music=rs.getString("music");
	String travel=rs.getString("travel");
	String sports=rs.getString("sports");
	String gadgets=rs.getString("gadgets");
	String books=rs.getString("books");
	String shopping=rs.getString("shopping");
	String other=rs.getString("other");
	String about_me=rs.getString("about_me");
	System.out.println("hometown in personal is :"+hometown);
%>

	<%
	if(rs.getString("hometown")=="")
	{
		System.out.println("hometown is  null!");
	%>
	<label for="hometown"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Hometown :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font></label><br>

 <% 
	}
	else
	{
		System.out.println("hometown is not null!");
		%>
<label for="hometown"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Hometown :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=hometown%></font></label><br>		
<% 				
	}
	%>
	<% 
	if(religion!=null)
	{
	%>
	<label for="religion"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Religion :</b>  </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(3)%></font> </label><br>
 <% 
	}
	else
	{
		%>
		<label for="religion"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Religion :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font></label><br>
<% 				
	}
	%>
	<% 
	if(relationship_status!=null)
	{
	%>
	<label for="relationsip_status"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Relationship status :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(4)%></font> </label><br>
 <% 
	}
	else
	{
		%>
<label for="relationsip_status"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Relationship status :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font> </label><br>		
<% 				
	}
	%>
	
	<% 
	if(languages!=null)
	{
	%>
	<label for="languages"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Languages :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(5)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
			<label for="languages"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Languages :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font> </label><br>	
<% 			
	}
	%>

<% 
	if(music!=null)
	{
	%>
    <label for="music"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Music :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(6)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	    <label for="music"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Music :</b> </font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>


<% 
	if(tv_shows!=null)
	{
	%>
    <label for="tvshow"><font color="#F6B300" face="Palatino Linotype" size="4em"><b> TV Shows :</b></font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(7)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="tvshow"><font color="#F6B300" face="Palatino Linotype" size="4em"><b> TV Shows :</b></font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>



<% 
	if(travel!=null)
	{
	%>
    <label for="Travel"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Travel :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(8)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="Travel"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Travel :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font> </label><br>
<% 			
	}
	%>

<% 
	if(sports!=null)
	{
	%>
    <label for="sports"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Sports :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(9)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="sports"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Sports :</b> </font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>


<% 
	if(gadgets!=null)
	{
	%>
    <label for="gadgets"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Gadgets :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(10)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="gadgets"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Gadgets :</b> </font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>

<% 
	if(books!=null)
	{
	%>
    <label for="books"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Books :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(11)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="books"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Books :</b> </font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>


<% 
	if(shopping!=null)
	{
	%>
    <label for="Shop"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Shopping :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(12)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="Shop"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Shopping :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified</font> </label><br>
<% 			
	}
	%>


<% 
	if(other!=null)
	{
	%>
    <label for="other_intrst"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Other Interests :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(13)%></font> </label><br>	
 <% 
	}
	else
	{
		%>
	<label for="other_intrst"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>Other Interests :</b> </font><font color="" face="Palatino Linotype" size="4em"> Not Specified</font> </label><br>
<% 			
	}
	%>


<% 
	if(about_me!=null)
	{
	%>
     <label for="abt_me"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>About Me :</b> </font><font color="" face="Palatino Linotype" size="4em"> <%=rs.getString(13)%></font>	
 <% 
	}
	else
	{
		%>
	 <label for="abt_me"><font color="#F6B300" face="Palatino Linotype" size="4em"><b>About Me :</b> </font><font color="" face="Palatino Linotype" size="4em">Not Specified></font>
<% 			
	}
	%>
    
 <%
}
%>	
</div>
</body>
</html>