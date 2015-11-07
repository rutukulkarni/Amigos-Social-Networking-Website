<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*"%>
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


System.out.println("in show_Controller.jsp");
String type=session.getAttribute("type").toString();
String page_slot=session.getAttribute("page_slot").toString();
String cost1234=request.getParameter("cost");
Integer cost=Integer.parseInt(cost1234);
System.out.println("cost in show controller= "+cost);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st1=con.createStatement();
boolean empty=true;
//ResultSet rs=st.executeUpdate("insert into avail_spaces(space_type,ad_type) values (" '"+type +"','"+page_slot +"') ");
String sql11="select * from avail_spaces where space_type='"+page_slot+"'";
ResultSet rs11=st1.executeQuery(sql11);

while(rs11.next())
{
empty=false;	
}

if(empty==true)
{
	

Statement st=con.createStatement();

//ResultSet rs=st.executeUpdate("insert into avail_spaces(space_type,ad_type) values (" '"+type +"','"+page_slot +"') ");
String sql1="INSERT INTO avail_spaces(space_type,ad_type,space_cost) VALUES ('"+page_slot+"','"+type+"',"+cost+")";
st.executeUpdate(sql1);
	
	
	
	
}
else

{

Statement st2=con.createStatement();

//ResultSet rs=st.executeUpdate("insert into avail_spaces(space_type,ad_type) values (" '"+type +"','"+page_slot +"') ");
String sql12="update avail_spaces set space_cost="+cost+" where space_type='"+page_slot+"'";

st2.executeUpdate(sql12);
	
	
	
		
}
//int uid=0;

//if(rs.next()){

//}

response.sendRedirect("admin.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>

</body>
</html>