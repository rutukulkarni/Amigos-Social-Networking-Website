<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>

<form action="login.jsp" method="post">
<%
String hometown=null;
String test=request.getParameter("test");

hometown=request.getParameter("hometwn");   


System.out.println("hometown=="+hometown+"...");

if(hometown=="")
{
	System.out.println("in if of test");
}
else
	System.out.println("in else of test");

String religion=request.getParameter("rlgn"); 
String relationship_status=request.getParameter("rel_status"); 
String languages=request.getParameter("lang_known"); 
String music=request.getParameter("music"); 
String travel=request.getParameter("travel");
String tv_shows=request.getParameter("tv_shows"); 
String sports=request.getParameter("sport");
//String movies=request.getParameter("movies");
String gadgets=request.getParameter("gadgets");
String shopping=request.getParameter("shopping");
String books=request.getParameter("books");
String other=request.getParameter("other_interest");
String about_me=request.getParameter("about_me");
//String uid=request.getParameter("uid");
//String username=request.getParameter("username");

String high_school=request.getParameter("high_school");   
String college=request.getParameter("college"); 
String univ=request.getParameter("univ");
// years added by rutuja
String year=request.getParameter("year");
String exp_yr=request.getParameter("exp_yr"); 
String curr_job=request.getParameter("curr_job"); 
String skill_set=request.getParameter("skill_set");
String exp=request.getParameter("exp");
String ach=request.getParameter("ach");

System.out.println("hometwn in reg_personal="+hometown);

System.out.println("religion in reg_personal="+religion);

System.out.println("other in reg_personal="+other);


//System.out.println(hometown);
String username=request.getParameter("userName");
System.out.println("in save.jsp ::"+username);


Class.forName("com.mysql.jdbc.Driver"); 
Connection con=null;

con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st= con.createStatement(); 
Statement st1= con.createStatement(); 
ResultSet rs;

Statement st2= con.createStatement(); 
ResultSet rs2;

String sql1="Select uid from basic_info where username = '"+username+"'";
rs=st1.executeQuery(sql1);

int uid=0;

//out.println(username);
while(rs.next())
{
uid=rs.getInt(1);
//out.println(j);
}

System.out.println("uid= "+uid);

String sql="INSERT INTO advanced_personal(uid,hometown,religion,relationship_status,languages,music,tv_shows,travel,sports,gadgets,books,shopping,other,about_me)values('"+uid+"','"+hometown+"','"+religion+"','"+relationship_status+"','"+languages+"','"+music+"','"+tv_shows+"','"+travel+"','"+sports+"','"+gadgets+"','"+shopping+"','"+books+"','"+other+"','"+about_me+"')";
st.executeUpdate(sql);

String sql2="INSERT INTO advanced_professional(uid,high_school,college,university,year,years_exp,curr_job,skill_set,experience,achieve)values('"+uid+"','"+high_school+"','"+college+"','"+univ+"','"+exp_yr+"','"+exp+"','"+curr_job+"','"+skill_set+"','"+exp+"','"+ach+"')";
System.out.println(sql2);
st2.executeUpdate(sql2);




session.setAttribute("uid",uid);
response.sendRedirect("login.jsp");
%>


</form>
</body>
</html>