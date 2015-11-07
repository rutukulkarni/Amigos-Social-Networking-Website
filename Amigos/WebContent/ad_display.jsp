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
<title>ad display</title>

<script>
function ad_fwd(ad_id)
{
	//alert("aat alat in ad display"+ad_id);
	window.open("ad_click_controller.jsp?ad_id="+ad_id);	
}
</script>
</head>

<body>
<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

System.out.println("in ad_display!");

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st50=con.createStatement();
Statement st51=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();

String[] b_sidebar=new String[100];


String[] adv=(String[]) session.getAttribute("Adv");

String[] b_lu=(String[]) session.getAttribute("b_lu");
String[] b_lm=(String[]) session.getAttribute("b_lm");
String[] b_ll=(String[]) session.getAttribute("b_ll");




//String ad_temp[]=(String[])session.getAttribute("Adv");

int adv_count=(Integer)session.getAttribute("len");
int len1=(Integer)session.getAttribute("len1");
int len2=(Integer)session.getAttribute("len2");
int len3=(Integer)session.getAttribute("len3");


System.out.println("adv_count="+adv_count);


int j;
for(j=0;j<adv_count;j++)
{
	System.out.println("array  in ad_display::="+adv[j]);
}


System.out.println("no.of advertisements on ad_display:"+adv_count);



Random rgen = new Random();  // Random number generator
//--- Shuffle by exchanging each element randomly
for (int i=0; i<len1; i++) {
    int randomPosition = rgen.nextInt(len1);
    String temp = b_lu[i];
    b_lu[i] = b_lu[randomPosition];
 	b_lu[randomPosition] = temp;
}

for (int p=0; p<len2; p++) {
    int randomPosition = rgen.nextInt(len2);
    String temp = b_lm[p];
    b_lm[p] = b_lm[randomPosition];
 	b_lm[randomPosition] = temp;
}

for (int g=0; g<len3; g++) {
    int randomPosition = rgen.nextInt(len3);
    String temp = b_ll[g];
    b_ll[g] = b_ll[randomPosition];
 	b_ll[randomPosition] = temp;
}



int e=0;

	b_sidebar[e]=b_lu[0];
	e++;
	b_sidebar[e]=b_lm[0];
	e++;
	b_sidebar[e]=b_ll[0];
	e++;
	

	
int i=0;
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

System.out.println("array  in ad_display::="+b_sidebar[j]);

String ad_id=null;
String name51=null;
String desc=null;
String p1=null;
String url=null;
String path51=null;


String sql50="select * from register_ad where ad_id="+b_sidebar[j];
ResultSet rs50=st50.executeQuery(sql50);

while(rs50.next())
{
	ad_id=rs50.getString("ad_id");
	name51=rs50.getString("ad_name");
	desc=rs50.getString("description");
	p1=rs50.getString("p_id");
	url=rs50.getString("link_url");
	String redirectURL1 = "http://"+url;
	%>

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
	
<br>



		</div>
			</a>
		<br>
		<br>
	<%
}



String sql3="select * from register_ad where ad_id="+ad_id;
ResultSet rs3=st3.executeQuery(sql3);
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


//response.sendRedirect("prof.jsp");
//}
%>
</body>
</html>