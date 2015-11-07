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
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


int flag=0;

System.out.println("in new wala post_wall.jsp!");

String wallpost=request.getParameter("wallpost");

System.out.println("Wall post ="+wallpost);
//String getname = request.getParameter("getname");
//String getname=session.getAttribute("getname").toString();
//String wallpost= Document.getElementbyId("wallpost");
System.out.println("Wall post ="+wallpost);
//System.out.println("in post_wall getname = "+getname);

String fuid1=session.getAttribute("fuid1").toString();


String uid1=session.getAttribute("uid123").toString();

int uid=Integer.parseInt(uid1);

int fuid=Integer.parseInt(fuid1);

System.out.println("in post_wall UID= "+uid);
System.out.println("in post_wall FUID= "+fuid);
int flag_res=0;

Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja"); 

Statement st123=con.createStatement();
Statement st9=con.createStatement();
//String sql9="select * from permanent_friend where uid ="+fuid+" and friend_id="+uid; 
String sql9="select * from privacy where uid_to="+uid+" and uid_from="+fuid;

//or uid ="+uid+" and friend_id="+fuid;
System.out.println("sql9 ="+sql9);
ResultSet rs9=st9.executeQuery(sql9);

while(rs9.next())
{

flag_res=1;

}
if(flag_res==1)
{
	//flag=1;
	System.out.println("CANT post!");
	
	Statement st=con.createStatement();
	String sql="insert into notification (uid_to,uid_from,notification)values( '"+fuid+"','"+uid+"','"+wallpost+"') ";
	st.executeUpdate(sql);
	String notification="";
	int uid_to=0;
	int uid_from=0;
	System.out.println("AFTER NOTIFICATION QUERY!");
	response.sendRedirect("prof.jsp");
	
	
}// end of if
else
{
	System.out.println("CAN post!");
	
	//-----------------------------------------------------------
	
	
	System.out.println("POSTING AS ALLOWED!");
	Statement st1=con.createStatement();
	ResultSet rs1=st1.executeQuery("select * from basic_info where uid ='"+uid+"'");
	String s_name="";

	if(rs1.next()){
	//System.out.println(rs1.getString("username")+"<br>");
	//uid=rs1.getInt("uid");
	//System.out.println("uid :: "+uid);
	//setting session id to uid...

	s_name=rs1.getString("username");

	//session.setAttribute("uid", uid);
	//System.out.println("Session element in post_wall is : "+uid+"\n");

	}


	Statement st2=con.createStatement();
	ResultSet rs2=st2.executeQuery("select * from basic_info where uid ='"+fuid+"'");
	String r_name="";
	//System.out.println("2");
	if(rs2.next()){

	r_name=rs2.getString("username");

	}



	Statement st= con.createStatement();
	ResultSet rs;
	//String sql=("INSERT into wall_posts (s_id,text_content) VALUES ('"+wallpost+ "') ");
	String sql="INSERT INTO wall_posts(s_id,text_content,r_id,s_name,r_name,likes,dislikes) VALUES ('"+uid+"','"+wallpost+"','"+fuid+"','"+s_name+"','"+r_name+"',0,0)";
	System.out.println("in post_wall sql = "+sql);
	st.executeUpdate(sql);
	System.out.println("uid in wall_post="+uid);
	System.out.println("fuid in wall_post="+fuid);
	
if(uid==fuid)
{
	System.out.println("flag set! to 1");
	flag=1;

	response.sendRedirect("prof.jsp?searchUid="+fuid);

}
else
{
	flag=0;
	response.sendRedirect("prof1.jsp?searchUid="+fuid);	

}
	//System.out.println("after big query");


	
}


/*
String w="";
Statement st2=con.createStatement();
ResultSet rs3; 

String sql3="select * from basic_info where uid= '"+y+"'";
rs3=st2.executeQuery(sql3);

while(rs3.next())
{
w=rs3.getString("username");
//System.out.println("for wallpost id :: "+wall_id+ "dis person liked it :: "+w);
out.print(""+w+",");

}

count++;
}*/


//end of for loop

//}
//load("wall1.jsp");
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else



%>





</body>
</html>