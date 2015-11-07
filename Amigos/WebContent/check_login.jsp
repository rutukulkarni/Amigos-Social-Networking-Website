<%@ page import="java.sql.*"%>

<html>
<body>
<form action="ad_datastruct.jsp" method="post">
<%
String getname = request.getParameter("username");
session.setAttribute("name",getname);
String name=null;
try
{
	name=(String)session.getAttribute("name");
//String getname = request.getParameter("username");
String getpwd = request.getParameter("pwd");

System.out.println("1st tym name:"+getname);
System.out.println("1st tym pasword:"+getpwd);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st12=con.createStatement();
int flag=0;

Statement st9=con.createStatement();
boolean empty=true;

String sql9="select * from basic_info where username='"+getname+"'";


ResultSet rs9=st9.executeQuery(sql9);
while(rs9.next())
{
	
empty=false;

	
}


if(empty==true)
{
	response.sendRedirect("login1.jsp?flag=1");
}

else
{
String getpwd1="";
String sql1="select DES_DECRYPT(password) from basic_info where username='"+ getname+"'";
///String sql1= "select password from basic_info where username='"+getname+"'";
System.out.println(sql1);
ResultSet rs1=st1.executeQuery(sql1);
int uid=0;
System.out.println("AFTER QUERY !");
String username="";

while(rs1.next())

{

//uid=rs1.getInt("uid");
//username=rs1.getString("username");
	getpwd1=rs1.getString(1);
	
}

System.out.println("getpwd1 = "+getpwd1);
//getpwd=des_decrypt(getpwd1);


String sql12="select * from basic_info where username='"+ getname+"'";
///String sql1= "select password from basic_info where username='"+getname+"'";
System.out.println(sql12);
ResultSet rs12=st12.executeQuery(sql12);
//int uid=0;
System.out.println("AFTER ST12 QUERY !");
//String username="";

while(rs12.next())

{

uid=rs12.getInt("uid");
username=rs12.getString("username");
	//getpwd1=rs1.getString("password");
	
}

//System.out.println("getpwd1 = "+getpwd1);
//getpwd=des_decrypt(getpwd1);















if(getpwd.equals(getpwd1))
{
	System.out.println("matched");



//if(rs1.next()){
//out.println("WELCOME !!!");
//out.println(rs1.getString("username")+"<br>");
//System.out.println("uid :: "+uid);
//setting session id to uid...

session.setAttribute("uid", uid);
session.setAttribute("uid123", uid);
session.setAttribute("name",getname);
System.out.println("Session element is : "+uid+"\n");
System.out.println("Session element is (name): "+username+"\n");

//response.sendRedirect("prof.jsp");
response.sendRedirect("ad_datastruct.jsp");
//}

}




else
{
	//String error="Invalid username or password";
	//session.setAttribute("error", error);
 //    ("Enter valid username and password!!");
	response.sendRedirect("login1.jsp?flag=2");
	
	//out.println("INVALID USERNAME OR PASSWORD!! PLEASE RETRY!!!");

}
%>
<input type="hidden" name="uid" value="<%=uid%>">
<% 
} // end of outer esle

} // end of try
catch(Exception e)
{}


if(name==null)
{
	response.sendRedirect("login.jsp");
}


%>
</form>
</body>
</html>
