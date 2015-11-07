<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.sql.*"  %>
 
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigoss</title>
</head>
<body>
<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

String eid1=request.getParameter("eid");
int eid=Integer.parseInt(eid1);
String uid1=request.getParameter("uid");
int uid=Integer.parseInt(uid1);

System.out.println("in notgngevent pg eid="+eid);

System.out.println("in notgngevent pg uid="+uid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st4=con.createStatement();
String sql4="select * from event_info where eid="+eid;
ResultSet rs4=st4.executeQuery(sql4);
String members_list=null;
String ename=null;
String creator=null;
String edate=null;
String details=null;
String eplace=null;
int status=0;


while(rs4.next())
{
	eid=rs4.getInt("eid");
	//status=rs4.getInt("status");
	ename=rs4.getString("ename");
	details=rs4.getString("edetails");
	eplace=rs4.getString("eplace");
	edate=rs4.getString("date_event");
	creator=rs4.getString("ecreator");
	members_list=rs4.getString("emembers");
	System.out.println("in rs 4 emembers="+members_list);
}

String z5=null;
String y5=null;
int y6=0;
String entry=null;
String t1=null;
int t2=0;

int[] temp1=new int[100];

int index=0;
int k=0;
String s5=members_list;
String[] result5=s5.split(",");

int len=result5.length;

for (int x=0; x<result5.length; x++) 
{

	y5=result5[x];
	y6=Integer.parseInt(y5);

	index++;
	
	if(y6==uid)
	{
		
		if(index==result5.length)
		{
		System.out.println("last element ahe in dat comma split list!");
		
		}
		else
		{
		while(k<result5.length-1)
		{
		t1=result5[k+1];
		t2=Integer.parseInt(t1);
		temp1[k]=t2;
						
		System.out.println("temp1 when bakiche elements are getting copied!="+temp1[k]);
		k++;
		}
		}
		System.out.println("temp1[0]="+temp1[0]);
		System.out.println("temp1[1]="+temp1[1]);
		System.out.println("temp1[2]="+temp1[2]);
		System.out.println("temp1[3]="+temp1[3]);
		
		k=0;
		
		entry=temp1[k]+",";
		System.out.println("temp1[k]="+temp1[k]);
		for(k=1;k<result5.length-1;k++)
		{
			entry=entry+temp1[k]+",";
		}
		System.out.println("entry="+entry);
		
		
		Statement st11=con.createStatement();
		String sql111="update event_info set emembers='"+entry+"' where eid="+eid;
		st11.executeUpdate(sql111);
		System.out.println("ata out of delete ja rele hain bhai!");
	}
	else
	{
		temp1[k]=y6;
		System.out.println("Element jst enterd in temp array="+temp1[k]);
		k++;
	}
		
}

response.sendRedirect("Events.jsp?flag=0");
		

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else


%>
</body>
</html>