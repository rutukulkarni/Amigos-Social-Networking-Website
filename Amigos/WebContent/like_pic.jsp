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
String p_id=request.getParameter("p_id");
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!p_id = "+p_id);
String album_id=request.getParameter("album_id");
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!album_id = "+album_id);
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
System.out.println("in like_pic.jsp: Session UID= "+uid);
Integer i=Integer.parseInt(p_id);
System.out.println("i= "+i);
Class.forName("com.mysql.jdbc.Driver");
Connection con=null;

con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

ResultSet rs=null;
Statement st=con.createStatement();
 //String uid1=uid.toString();
 //System.out.println("uid1 :: "+uid1);

	 
//String sql="UPDATE wall_posts set likes='"+uid1+"' WHERE w_id="+Integer.parseInt(wall_id);
String sql="UPDATE image_try set likes=concat(likes,',','"+uid+"'   ) WHERE p_id="+i;
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
System.out.println("in like_pic sid="+Integer.parseInt(uid));

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


if(flag=="1")
 {
 	
 	response.sendRedirect("passAlbumName1.jsp?album_id="+album_id);
 }
 else 
 {
//	 response.sendRedirect("prof.jsp");
 response.sendRedirect("passAlbumName.jsp?album_id="+album_id);	
 }

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



//response.sendRedirect("passAlbumName.jsp?uid="+uid+"&album_id="+album_id);
%>


</body>
</html>