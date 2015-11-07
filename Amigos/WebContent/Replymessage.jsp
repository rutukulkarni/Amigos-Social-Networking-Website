<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page language="java" import="java.sql.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
</head>
<body>

<% 
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String my_uid = session.getAttribute("theName").toString();
int uid=Integer.parseInt(my_uid); 

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","pooja");
Statement st=con.createStatement();
ResultSet rs1=st.executeQuery("select distinct(sen_name) from mess_info where rid ='" +uid+"'");

String rep=null;
while(rs1.next())
{
	rep=rs1.getString("sen_name");
%>
	
	<label>To:<%=rep %> </label><br>
	
	<%
	}
	%>
	<form method="post" action="ReplyStore.jsp">
	<textarea name="rtext" id="rtext"rows="5" cols="20">
		</textarea>
	
	<input type="submit" value="Send">
	</form>
<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>	
	
</body>
</html>