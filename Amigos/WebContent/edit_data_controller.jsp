<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*"%>

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



String uid=session.getAttribute("uid").toString();


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();


String sql1="update basic_info set username='"+request.getParameter("uname")+"',first_name='"+request.getParameter("fname")+"',last_name='"+request.getParameter("lname")+"',email='"+request.getParameter("email")+"',gender='"+request.getParameter("gender")+"',country='"+request.getParameter("country")+"' where uid="+uid;
System.out.println(sql1);
st1.executeUpdate(sql1);


String sql2="update advanced_personal set hometown='"+request.getParameter("hometown")+"',religion='"+request.getParameter("rlgn")+"',relationship_status='"+request.getParameter("relation")+"',languages='"+request.getParameter("languages")+"',music='"+request.getParameter("music")+"',tv_shows='"+request.getParameter("tv_shows")+"',travel='"+request.getParameter("travel")+"',sports='"+request.getParameter("sports")+"',gadgets='"+request.getParameter("gadgets")+"',other='"+request.getParameter("other_interest")+"',books='"+request.getParameter("books")+"',shopping='"+request.getParameter("shopping")+"' where uid="+uid;
System.out.println(sql2);
st2.executeUpdate(sql2);

String sql3="update advanced_professional set high_school='"+request.getParameter("high_school")+"',college='"+request.getParameter("college")+"',university='"+request.getParameter("university")+"',year='"+request.getParameter("year")+"',years_exp='"+request.getParameter("exp_yr")+"',curr_job='"+request.getParameter("curr_job")+"',skill_set='"+request.getParameter("skill_set")+"',experience='"+request.getParameter("experience")+"',achieve='"+request.getParameter("achieve")+"' where uid="+uid;
System.out.println(sql3);
st3.executeUpdate(sql3);

response.sendRedirect("prof.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>


<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>

</html>