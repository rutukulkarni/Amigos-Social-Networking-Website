<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
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




Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st50=con.createStatement();
Statement st51=con.createStatement();
Statement st13=con.createStatement();
Statement st4=con.createStatement();

String[] c_leftsidebar=new String[100];

String[] c_lu=(String[]) session.getAttribute("c_lu");
String[] c_lm=(String[]) session.getAttribute("c_lm");
String[] c_ll=(String[]) session.getAttribute("c_ll");

int len4=(Integer)session.getAttribute("len4");
int len5=(Integer)session.getAttribute("len5");
int len6=(Integer)session.getAttribute("len6");

Random rgen = new Random();  
for (int u=0; u<len4; u++) {
    int randomPosition = rgen.nextInt(len4);
    String temp = c_lu[u];
    c_lu[u] = c_lu[randomPosition];
 	c_lu[randomPosition] = temp;
}
for (int t=0; t<len5; t++) {
    int randomPosition = rgen.nextInt(len5);
    String temp = c_lm[t];
    c_lm[t] = c_lm[randomPosition];
 	c_lm[randomPosition] = temp;
}
for (int r=0; r<len6; r++) {
    int randomPosition = rgen.nextInt(len6);
    String temp = c_ll[r];
    c_ll[r] = c_ll[randomPosition];
 	c_ll[randomPosition] = temp;
}

int z=0;

c_leftsidebar[z]=c_lu[0];
z++;
c_leftsidebar[z]=c_lm[0];
z++;
c_leftsidebar[z]=c_ll[0];
z++;

int j=0;
%>
<center>
<div style="background-color: #3E282A;color:#F6B300;border-radius: 8px;">
<font size="3em">Advertisements</font>
</div>
</center>
<br>
<%

for(j=0;j<3;j++)
{

System.out.println("array  in ad_display_auc1::="+c_leftsidebar[j]);

String ad_id=null;
String name51=null;
String desc=null;
String p1=null;
String url=null;
String path51=null;


String sql50="select * from register_ad where ad_id="+c_leftsidebar[j];
ResultSet rs50=st50.executeQuery(sql50);

while(rs50.next())
{
	ad_id=rs50.getString("ad_id");
	name51=rs50.getString("ad_name");
	desc=rs50.getString("description");
	p1=rs50.getString("p_id");
	url=rs50.getString("link_url");
	%>
	<br>
	<a href='#' onclick="ad_fwd(<%=ad_id%>)">
	
		<div style="background-color:#FFFFCC ;color:#3D2729;height:150px;border-radius: 8px;" >	
	<br>
	
	<center>
	<b>
	<u>
	<font face="monaco"><font size="4em"><font style="text-transform: capitalize;"><%=name51%></font></font></font>
	</u>
	</b>
	</center>

	
	<div style="padding:5px 5px 5px 5px;">
	
	<div id="left_img_ad" class="left-content" style="float:left;width:80px">
	<%
	String sql51="select * from ad_image where p_id="+p1;
	ResultSet rs51=st51.executeQuery(sql51);
	
	while(rs51.next())
	{
		path51=rs51.getString("img_path");
		
		%>
		<img src="<%=path51 %>" alt="path of ad" width=80px height=80px>
		
		<%
	}
	
	%>

	</div>
	
	<div id="right_desc_ad" class="right-content" style="float:right;color:#3D2729;width:100px">
	


	<font face="cursive"><font size="3px"><%=desc %></font></font>
	</div>
	</div><!-- end of div containing ad+desc of ad div -->
	



		</div>
			</a>
		
	<%
}



String sql3="select * from register_ad where ad_id="+ad_id;
ResultSet rs3=st13.executeQuery(sql3);
int impression=0;
while(rs3.next())
{
	impression=rs3.getInt("impressions");
	System.out.println("impressions for ad is="+impression);
		
}
impression=impression-1;
System.out.println("decremented no. of impressions:="+impression);

String sql4="update register_ad set impressions="+impression+" where ad_id="+ad_id;
st4.executeUpdate(sql4);



}
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>

</body>
</html>