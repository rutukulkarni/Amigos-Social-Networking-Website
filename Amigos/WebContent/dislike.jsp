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

//System.out.println("in like.jsp");
//String wall_id=request.getAttribute("wallpost_id").toString();
//String wallpost1=request.getParameter("wallpost1");
String wall_id=request.getParameter("wall_id");
System.out.println("wall_id = "+wall_id);

String flag=session.getAttribute("flag").toString();
//Integer wallpostid= 0;
//wallpostid=Integer.parseInt(wallpost);
//System.out.println("in like.jsp: wallpost1 = "+wallpost1);
//String wallpost=request.getParameter("wallpost_id");

//String getname = request.getParameter("getname");
//String wallpost= Document.getElementbyId("wallpost");
//System.out.println("wallpost_id= "+wall_id);
//System.out.println("likes ="+wallpost);
//System.out.println("in like.jsp : getname = "+getname);

String uid=session.getAttribute("uid123").toString();
System.out.println("in dislike.jsp: Session UID= "+uid);
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
String sql="UPDATE wall_posts set dislikes=concat(dislikes,',','"+uid+"'   ) WHERE w_id="+i;
//System.out.println("fwded wallpost_id :"+Integer.parseInt(wall_id));

System.out.println("After update query  :"+uid);

//String sql="INSERT into wall_posts (s_id,likes) VALUES ('"+uid+ "','"+uid+"')";

st.executeUpdate(sql);
		
		//System.out.println("After executequery  :"+uid);
  
//String sql1="SELECT * FROM wall_posts order by time desc";
//rs1=st1.executeUpdate(sql1);

//String sql="SELECT * FROM wall_posts where s_id="+Integer.parseInt(uid);
//
%>

<%
//sql1="SELECT * from wall_posts order by time desc";
//ps1=con.prepareStatement(sql1);
//rs1=ps1.executeQuery();


//sql ="SELECT * from wall_posts where s_id=1 order by time desc"; 
//ps=con.prepareStatement(sql);
//rs=ps.executeUpdate();

	


//}
System.out.println("in dislike sid="+Integer.parseInt(uid));

//Statement st1=con.createStatement();
//ResultSet rs1=st1.executeQuery("select * from basic_info where username ='"+getname+"'");
//int uid=0;

//if(rs1.next()){
//System.out.println(rs1.getString("username")+"<br>");
//uid=rs1.getInt("uid");
//System.out.println("uid :: "+uid);
//setting session id to uid...
//session.setAttribute("uid", uid);
//System.out.println("Session element in post_wall is : "+uid+"\n");

//}
//System.out.println("in dislike sid="+Integer.parseInt(uid));

System.out.println("in dislike.jsp flag ="+flag);
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