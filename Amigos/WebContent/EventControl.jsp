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
//String eid1=request.getParameter("eid").toString();
//int eid=Integer.parseInt(eid1);


//System.out.println("in eventcontrol store ::"+eid);


System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");



String flag1=request.getParameter("flag");
int flag=Integer.parseInt(flag1);

System.out.println("in event control page flag sent is="+flag);

String etime=request.getParameter("date_event");

System.out.println("etime :"+etime);

String eventdetails = request.getParameter("details");
System.out.println("eventdetails :"+eventdetails);

String name = request.getParameter("eventname");

System.out.println("name :"+name);
String eplace = request.getParameter("place");
System.out.println("eplace :"+eplace);
//String my_uid = session.getAttribute("theName").toString();
//int uid=Integer.parseInt(my_uid); 
String uid1=session.getAttribute("uid123").toString();
Integer uid=Integer.parseInt(uid1);
Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();
Statement st2=con.createStatement();

int i=0;
String members[]=request.getParameterValues("friend[]");
String members1=null;
int m=0;
int n=0;

for(i=0;i<members.length;i++)
{
	System.out.println("members cha array in evnt controller = "+members[i]);
	if(n==0)
	{
	members1=members[i]+",";
	n++;
	System.out.println("members1 in eventcontrol="+members1);
	}
	else
	{
		members1=members1+members[i]+",";

		System.out.println("members1 in eventcontrol="+members1);
		n++;
	}
	m++;
}

ResultSet rs1=st.executeQuery("select * from basic_info where uid ='" +uid+"'");
String username=null;
while(rs1.next())
{
	username=rs1.getString(2);
}

if(flag==0)
{
System.out.println("just b4 insert!");
int p=st2.executeUpdate("insert into event_info(ename,edetails,eplace,emembers,ecreator,date_event,emembers_confirm,status) values('"+name+"','"+eventdetails+"','"+eplace+"','"+members1+"','"+username+"','"+etime+"',0,0)");
System.out.println(+p+"rows updated eventmadheinserted!");
//int p=st2.executeUpdate("insert into event_info(ename,edetails,place,date_event,emembers,ecreator) values('"+name+"','"+eventdetails+"','"+eplace+"','"+etime+"','"+pooja+"','"+use+"')");
//System.out.println(+p+"rows updated");
}

else
{
	String eid2=session.getAttribute("eid").toString();
	int eid3=Integer.parseInt("eid2");
	System.out.println("when creator adds few more members to invitees"+members1+" to event no="+eid3);
	
	Statement st5=con.createStatement();
String sql5="update event_info set emembers=concat(emembers,'"+members1+"',',') where eid="+eid3;
st5.executeUpdate(sql5);


}
response.sendRedirect("Events.jsp?flag=1");

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>


</body>
</html>