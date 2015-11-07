<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

System.out.println("in post_home.jsp!");
String wallpost=request.getParameter("wallpost");
System.out.println("Wall post ="+wallpost);


String uid123=session.getAttribute("uid").toString();
int uid=Integer.parseInt(uid123);
System.out.println("in post_home UID= "+uid);
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

System.out.println("1");

Statement st1=con.createStatement();

ResultSet rs1=st1.executeQuery("select * from basic_info where uid ="+uid);
String s_name="";

if(rs1.next()){
//System.out.println(rs1.getString("username")+"<br>");
//uid=rs1.getInt("uid");
//System.out.println("uid :: "+uid);
//setting session id to uid...

s_name=rs1.getString("username");

//session.setAttribute("uid", uid);
//System.out.println("Session element in post_wall is : "+uid+"\n");

}


Statement st2=con.createStatement();
ResultSet rs2=st2.executeQuery("select * from basic_info where uid ='"+uid+"'");
String r_name="";
//System.out.println("2");
if(rs2.next()){

r_name=rs2.getString("username");

}



Statement st= con.createStatement();
ResultSet rs;
//String sql=("INSERT into wall_posts (s_id,text_content) VALUES ('"+wallpost+ "') ");
String sql="INSERT INTO wall_posts(s_id,text_content,r_id,s_name,r_name,likes,dislikes) VALUES ('"+uid+"','"+wallpost+"','"+uid+"','"+s_name+"','"+r_name+"',0,0)";
st.executeUpdate(sql);

//System.out.println("after big query");

out.println("this uid posted = "+uid);
out.print("on wall of = "+uid);

response.sendRedirect("home.jsp");
//load("wall1.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>





</body>
</html>