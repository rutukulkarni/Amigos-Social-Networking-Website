<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.sql.*"  %>
<html>
<body>
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String cont=request.getParameter("rtext");
//out.println("content="+cont);

String sender=request.getParameter("sender");
System.out.println("sent to replystore page="+sender);

//String sender_id1=request.getParameter("sender_id").toString();
//int sender_id=Integer.parseInt(sender_id1);
//System.out.println("sender_id in reply store="+sender_id);

String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
System.out.println("in rpy store ::"+uid);
String reply=request.getParameter("content1");
System.out.println("reply :: "+reply);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); 
//uid which will be equal to sid
//out.println("uid="+uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();

ResultSet rs1=st.executeQuery("select * from basic_info where uid ='" +uid+"'");
String username=null;
while(rs1.next())
{
	
	username=rs1.getString(2);
}

ResultSet rs2=st.executeQuery("select * from basic_info where username ='" +sender+"'");
String recv_name=null;
int sender_id=0;
while(rs2.next())
{
	sender_id=rs2.getInt("uid");
	
	
	recv_name=rs2.getString("username");
}


//out.println("use="+use);

//ResultSet rs2=st1.executeQuery("select * from mess_info where sid="+uid+" and rid="+sender_id+" or sid="+sender_id+" and rid="+uid);


//String poo1=null;
//int p=0;
//while(rs2.next())
//{
	//poo1=rs2.getString(4);
	//p=rs2.getInt("rid");
//}
//out.println("poo1:"+poo1);
//out.println("p:"+p);


String sql11="insert into mess_info(sid,rid,sen_name,rec_name,content) values("+uid+","+sender_id+",'"+username+"','"+recv_name+"','"+reply+"')";
st2.executeUpdate(sql11);
System.out.println("replystore"+sql11);
//System.out.println(+i+"rows updated");
//ResultSet rs2=st2.executeQuery("select * from login where username ='" +pooh+"'");
//int a=0;
//while(rs2.next())
//{
	//a=rs2.getInt(1);
//}

//out.println("a="+a);
//ResultSet rs=st.executeQuery("select * from login where username ='" +pooh+"'");
//int j=0;


//while(rs.next())
//{
	//j=rs.getInt(1);
	
//}
//int i=st3.executeUpdate("insert into mess_info values(1,'"+uid+"','"+a+"','"+use+"','"+pooh+"','"+cont+"')");

//System.out.println(+i+"rows updated");

//out.println(j);,.
response.sendRedirect("Conv.jsp?sender="+recv_name);
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>
</body>
</html>