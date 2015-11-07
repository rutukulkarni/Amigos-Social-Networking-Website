<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

String wall_id=request.getParameter("wall_id");
System.out.println("wall_id = "+wall_id);

String flag=session.getAttribute("flag").toString();
System.out.println("flag in like.jsp = "+flag);
String uid=session.getAttribute("uid123").toString();
System.out.println("in like.jsp: Session UID= "+uid);
Integer i=Integer.parseInt(wall_id);
System.out.println("i= "+i);
Class.forName("com.mysql.jdbc.Driver");
Connection con=null;

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

ResultSet rs=null;
Statement st=con.createStatement();
 //String uid1=uid.toString();
 //System.out.println("uid1 :: "+uid1);
 
 Statement st999=con.createStatement();
 ResultSet rs999=null;
 rs999=st999.executeQuery("select * from wall_posts where w_id = '"+i+"' ");
 int type=0;
 while(rs999.next())
 {
	type=rs999.getInt("type"); 
	
 
 }
	 
//String sql="UPDATE wall_posts set likes='"+uid1+"' WHERE w_id="+Integer.parseInt(wall_id);
String sql="UPDATE wall_posts set likes=concat(likes,',','"+uid+"'   ) WHERE w_id="+i;
//System.out.println("fwded wallpost_id :"+Integer.parseInt(wall_id));

System.out.println("After update query  :"+uid);

//String sql="INSERT into wall_posts (s_id,likes) VALUES ('"+uid+ "','"+uid+"')";

st.executeUpdate(sql);
		
		%>

<%

//}
System.out.println("in like sid="+Integer.parseInt(uid));


if(flag.contentEquals("2"))
{
	response.sendRedirect("prof1.jsp");
}
else if(flag.contentEquals("1"))
	
{
response.sendRedirect("prof.jsp");	
}
 else if(flag.contentEquals("4"))
{
	response.sendRedirect("wall123.jsp");
}
else
{
response.sendRedirect("home.jsp");
}

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



//response.sendRedirect("home.jsp?uid="+uid);
%>


</body>
</html>