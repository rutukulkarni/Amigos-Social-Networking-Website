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
Statement st4=con.createStatement();
Statement st52=con.createStatement();
Statement st53=con.createStatement();
Statement st13=con.createStatement();
Statement st23=con.createStatement();
Statement st5=con.createStatement();

String[] c_leftsidebar=new String[100];
String[] c_rightsidebar=new String[100];

String[] adv=(String[]) session.getAttribute("Adv");

String[] c_lu=(String[]) session.getAttribute("c_lu");
String[] c_lm=(String[]) session.getAttribute("c_lm");
String[] c_ll=(String[]) session.getAttribute("c_ll");
String[] c_ru=(String[]) session.getAttribute("c_ru");
String[] c_rm=(String[]) session.getAttribute("c_rm");
String[] c_rl=(String[]) session.getAttribute("c_rl");

int adv_count=(Integer)session.getAttribute("len");
int len4=(Integer)session.getAttribute("len4");
int len5=(Integer)session.getAttribute("len5");
int len6=(Integer)session.getAttribute("len6");
int len7=(Integer)session.getAttribute("len7");
int len8=(Integer)session.getAttribute("len8");
int len9=(Integer)session.getAttribute("len9");
System.out.println("adv_count="+adv_count);

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

int z=0;

c_leftsidebar[z]=c_lu[0];
z++;
c_leftsidebar[z]=c_lm[0];
z++;
c_leftsidebar[z]=c_ll[0];
z++;

int f=0;

c_leftsidebar[f]=c_ru[0];
f++;
c_leftsidebar[f]=c_rm[0];
f++;
c_leftsidebar[f]=c_rl[0];
f++;

%>

<%

int j=0;

for(j=0;j<3;j++)
{
	%>
	<label>
	array  in ad_display::=<%=c_leftsidebar[j] %>
	<br>
	</label>
	
	
<%
System.out.println("array  in ad_display::="+c_leftsidebar[j]);

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
	<div style="border-bottom: 1px solid white;color:#3D2729;" >
	<br>
	
	<label>
	<b>
	<a href="ad_click_controller.jsp?ad_id=<%=ad_id%>">
	<%=name51%>
	</a>
	
	</b>
	</label>
	<br>
	<br>
	<div>
	<div id="left_img_ad" class="left-content">
	<%
	String sql51="select * from image_try where p_id="+p1;
	ResultSet rs51=st51.executeQuery(sql51);
	
	while(rs51.next())
	{
		path51=rs51.getString("img_path");
		
		%>
		<img src="<%=path51 %>" alt="path of ad" width=30px height=40px>
		
		<%
	}
	
	%>

	</div>
	
	<div id="right_desc_ad" class="right-content">
	

	<label>
	<%=desc %>
	</label>
<br>
	</div>
	</div><!-- end of div contening ad+desc of ad div -->
	
<br>
	<label>
	<%=url %>
	</label>
	<br>

	<br>

	
	</div>
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

%>

<%
int v=0;

for(v=0;v<3;v++)
{
	%>
	<label>
	array  in ad_display::=<%=c_rightsidebar[v] %>
	<br>
	</label>
<%

System.out.println("array  in ad_display::="+c_rightsidebar[v]);

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
	<div style="border-bottom: 1px solid white;color:#3D2729;" >
	<br>
	
	<label>
	<b>
	<a href="ad_click_controller.jsp?ad_id=<%=ad_id%>">
	<%=name51%>
	</a>
	
	</b>
	</label>
	<br>
	<br>
	<div>
	<div id="left_img_ad" class="left-content">
	<%
	String sql52="select * from image_try where p_id="+p1;
	ResultSet rs52=st52.executeQuery(sql52);
	
	while(rs52.next())
	{
		path51=rs52.getString("img_path");
		
		%>
		<img src="<%=path51 %>" alt="path of ad" width=30px height=40px>
		
		<%
	}
	
	%>

	</div>
	
	<div id="right_desc_ad" class="right-content">
	

	<label>
	<%=desc %>
	</label>
<br>
	</div>
	</div><!-- end of div contening ad+desc of ad div -->
	
<br>
	<label>
	<%=url %>
	</label>
	<br>

	<br>

	
	</div>
	<%
}



String sql8="select * from register_ad where ad_id="+ad_id;
ResultSet rs8=st23.executeQuery(sql8);
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