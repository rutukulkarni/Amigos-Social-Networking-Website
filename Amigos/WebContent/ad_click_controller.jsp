<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>

    <link rel="shortcut icon" href="images/favicon.ico" />

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ad Click Controller</title>
<script>


</script>
</head>
<body>
<%

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();

Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st2=con.createStatement();

String ad_id=request.getParameter("ad_id");
System.out.println("in ad_click_controller ad_id="+ad_id);

String sql="select * from register_ad where ad_id="+ad_id;
ResultSet rs=st.executeQuery(sql);
String url=null;
while(rs.next())
	{
	url=rs.getString("link_url");
	System.out.println("url of clicked ad is:"+url);
	}

//response.sendRedirect("url");
//response.encodeURL(url);


String sql3="select * from register_ad where ad_id="+ad_id;
ResultSet rs3=st3.executeQuery(sql3);
int clicks=0;
while(rs3.next())
{
	clicks=rs3.getInt("clicks");
	System.out.println("clicks for ad is="+clicks);
		
}
clicks=clicks-1;
System.out.println("decremented no. of clicks:="+clicks);

String sql4="update register_ad set clicks="+clicks+" where ad_id="+ad_id;
st4.executeUpdate(sql4);




Statement st5=con.createStatement();
String sql5="update register_ad set clicked_users=concat(clicked_users,',','"+uid+"') where ad_id="+ad_id;
st5.executeUpdate(sql5); 







System.out.println("redirecting to correct wala page!");
String redirectURL = "http://"+url;



System.out.println("redirected url="+redirectURL);


response.sendRedirect(redirectURL);

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>

</body>
</html>