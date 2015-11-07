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
System.out.println("in post_status.jsp!");
String wallpost=request.getParameter("wallpost");
System.out.println("Wall post ="+wallpost);
String uid123=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid123);
System.out.println("in post_status UID= "+uid);

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st1=con.createStatement();

ResultSet rs1=st1.executeQuery("select * from basic_info where uid ="+uid);
String s_name="";

if(rs1.next()){
s_name=rs1.getString("username");
}



Statement st= con.createStatement();
ResultSet rs;
//String sql=("INSERT into wall_posts (s_id,text_content) VALUES ('"+wallpost+ "') ");
String sql="INSERT INTO wall_posts(s_id,text_content,r_id,s_name,r_name,likes,dislikes,status) VALUES ('"+uid+"','"+wallpost+"','"+uid+"','"+s_name+"','"+s_name+"',0,0,'"+wallpost+"')";
st.executeUpdate(sql);

//System.out.println("after big query");
System.out.println("status updated by: "+s_name+"  is : "+wallpost);

response.sendRedirect("home.jsp");
//load("wall1.jsp");
%>





</body>
</html>