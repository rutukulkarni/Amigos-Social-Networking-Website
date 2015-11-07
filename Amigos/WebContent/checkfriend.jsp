<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<html lsearcang="en">
<head>
   
	
</head>
      
      
</head>
<body>

<FORM name="check friend" >
<%
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String currentuseruid1 = session.getAttribute("uid123").toString();
String frienduid2=request.getParameter("fuid");
System.out.println("current="+currentuseruid1);
System.out.println("friend="+frienduid2);

int currentuseruid=Integer.parseInt(currentuseruid1);
int frienduid=Integer.parseInt(frienduid2);
if(currentuseruid==frienduid)
{
	response.sendRedirect("prof.jsp");

}
else
{
System.out.println("users uid= "+currentuseruid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
Statement st1=con.createStatement(); 
Statement st2=con.createStatement();

int frienduid1=0;
ResultSet rs=st.executeQuery("select * from basic_info where uid="+frienduid);
String sql123="select * from basic_info where uid="+frienduid;
System.out.println(sql123);

if(rs.next())
{
 frienduid1=rs.getInt("uid");

}

System.out.println("searched friend uid= "+frienduid);


int friendship=0;
String sql1="select * from permanent_friend where friend_id='"+frienduid1+"' and uid ="+currentuseruid+" or friend_id="+currentuseruid+" and uid="+frienduid1;
System.out.println(sql1);

ResultSet rs1=st1.executeQuery(sql1);


while(rs1.next())
{
friendship = rs1.getInt(1);

}

System.out.println("friendship id= "+friendship);

session.setAttribute("frienduid",frienduid);

ResultSet rs2=st2.executeQuery("select first_name from basic_info where uid='"+frienduid+"' ");
String firstname123="";
while(rs2.next())
{
firstname123=rs2.getString("first_name");
}

if(friendship==0)
{
out.println("not friends!!! can not post to wall! first send friend request!");
response.sendRedirect("prof2.jsp?searchUid="+frienduid);

}
else
{

//out.println(" friends!!!");
//response.sendRedirect("prof.jsp?frienduid="+frienduid);
response.sendRedirect("prof1.jsp?searchUid="+frienduid);

}
}

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else

%>


<!--<input type="button" value="check friendship!!"> -->

</form>



<br>
 

</body>
</html>



