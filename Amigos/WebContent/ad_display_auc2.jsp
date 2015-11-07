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
Statement st52=con.createStatement();
Statement st22=con.createStatement();
Statement st51=con.createStatement();
Statement st53=con.createStatement();
Statement st50=con.createStatement();
Statement st5=con.createStatement();

String[] c_rightsidebar=new String[100];

String[] c_ru=(String[]) session.getAttribute("c_ru");
String[] c_rm=(String[]) session.getAttribute("c_rm");
String[] c_rl=(String[]) session.getAttribute("c_rl");

int len7=(Integer)session.getAttribute("len7");
int len8=(Integer)session.getAttribute("len8");
int len9=(Integer)session.getAttribute("len9");

Random rgen = new Random();  
for (int d=0; d<len7; d++) {
    int randomPosition = rgen.nextInt(len7);
    String temp = c_ru[d];
    c_ru[d] = c_ru[randomPosition];
 	c_ru[randomPosition] = temp;
}
for (int v=0; v<len8; v++) {
    int randomPosition = rgen.nextInt(len8);
    String temp = c_rm[v];
    c_rm[v] = c_rm[randomPosition];
 	c_rm[randomPosition] = temp;
}
for (int w=0; w<len9; w++) {
    int randomPosition = rgen.nextInt(len9);
    String temp = c_rl[w];
    c_rl[w] = c_rl[randomPosition];
 	c_rl[randomPosition] = temp;
}

int f=0;

c_rightsidebar[f]=c_ru[0];
f++;
c_rightsidebar[f]=c_rm[0];
f++;
c_rightsidebar[f]=c_rl[0];
f++;

int v=0;
%>
<center>
<div style="background-color: #3E282A;color:#F6B300;border-radius: 8px;">
<font size="3em">Advertisements</font>
</div>
</center>
<br>
<%
for(v=0;v<3;v++)
{


System.out.println("array  in ad_display_auc2::="+c_rightsidebar[v]);

String ad_id=null;
String name51=null;
String desc=null;
String p1=null;
String url=null;
String path51=null;


String sql53="select * from register_ad where ad_id="+c_rightsidebar[v];
ResultSet rs53=st53.executeQuery(sql53);

while(rs53.next())
{
	ad_id=rs53.getString("ad_id");
	name51=rs53.getString("ad_name");
	desc=rs53.getString("description");
	p1=rs53.getString("p_id");
	url=rs53.getString("link_url");
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
	

	
	<div style="padding:3px 5px 5px 5px;">
	
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



String sql8="select * from register_ad where ad_id="+ad_id;
ResultSet rs8=st22.executeQuery(sql8);
int impression=0;
while(rs8.next())
{
	impression=rs8.getInt("impressions");
	System.out.println("impressions for ad is="+impression);
		
}
impression=impression-1;
System.out.println("decremented no. of impressions:="+impression);

String sql5="update register_ad set impressions="+impression+" where ad_id="+ad_id;
st5.executeUpdate(sql5);



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