<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>

<%@ page import="java.lang.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Register AD</title>
 <link rel="shortcut icon" href="images/favicon.ico" />


       <link rel="stylesheet" href="style.css" />
       <script type="text/javascript" src="jq1.js"></script>
<script type="text/javascript" src="jq2.js"></script>

   <script type="text/javascript">
   
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}
</script>       
	
<script type="text/javascript">
$(document).ready(function() {
    $('#upload').bind("click",function() 
    { 
        var imgVal = $('#uploadImage').val(); 
        if(imgVal=='') 
        { 
            alert("Please select an image file for uploading!"); 

        }
        else
         	
        	{
      
        	if (!imgVal.match(/(?:gif|jpg|png|bmp)$/))
        	{
        	    // inputted file path is not an image of one of the above types
        	    alert("Invalid File format ! Please select an image file for uploading!");
        	    window.location.href="registerAdController.jsp";
        	}
        	else
        	{
        		//alert("!!!!!!!!!!!!!!!!!!!aat!!!!!!!!!!");
        	response.sendRedirect("register_ad_img.jsp");
        	}
        	
        	}
      return false;
    }); 
});
</script> 
 
       
</head>
<body>

<div id="menu" >
	<div id="menu-wrapper">
		<ul>	
			<li class="logo">
			<a href="home.jsp">
			<img src="images/Amigos.png" alt="amigos" height="30" width="50">
			</a>
			</li>		
			<li><a href="home.jsp">My Home</a></li>
			<li><a href="prof.jsp">My Profile</a></li>
			<li><a href="album1.jsp">My Gallery</a></li>
			
	 			
			<li  style="padding-bottom: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px">
			<input type="text" id=search-text name=search-text 	height="25px" width="250px"></li>
			<li> <a href="listOfFriends.jsp" id=search-submit onclick="check_friend();" height="15px" width="30px">
			<img src="images/icon-search1.png" height=20px width=30px style="padding:0px;"></a></li>
			<li class="current_page_item"><a href="ad_home.jsp">Advertise</a></li>
			<li><a href="logout.jsp">Sign-Out</a></li> 
		</ul>
	</div>
	<!-- end #menu -->
</div>


<%
System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


System.out.println("in reg ad controller re!");

String userid1=session.getAttribute("uid123").toString();
int userid=Integer.parseInt(userid1);
String space_type=session.getAttribute("space_type123").toString();

String ad_name=request.getParameter("adName");
String description=request.getParameter("desc");
String link_url=request.getParameter("link");
String slot=request.getParameter("slot");
String ad_type=request.getParameter("ad_type");
//String space_type=request.getParameter("space_type");

String clicks1=request.getParameter("clicks");
System.out.println("clicks=="+clicks1);

int clicks=Integer.parseInt(clicks1);
//String space_type=session.getAttribute("space_type").toString();

String base_price=request.getParameter("base_price");
String age_from=request.getParameter("age_from");
String age_to=request.getParameter("age_to");
//String category=request.getParameter("category");
String gender=request.getParameter("gender");
String category[]=request.getParameterValues("adCategory");
	System.out.println("abcd");
	
System.out.println("space type in reg ad controller="+space_type);

int impressions=0;
String no_of_impression=null;


if(ad_type.equals("guaranteed"))
{


	System.out.println("in if to chk impressions..");
 no_of_impression=request.getParameter("impressions");
 impressions=Integer.parseInt(no_of_impression);

}
else
{
	impressions=1000;
}


int bp=Integer.parseInt(base_price);
int bid=0;
if(ad_type.equals("auctioned"))
{
	

String bid1=request.getParameter("bid");
System.out.println("bid1="+bid1);
 bid=Integer.parseInt(bid1);

	bp=bid;
	
	
}

int age_from1=Integer.parseInt(age_from);
int age_to1=Integer.parseInt(age_to);
int i=0;
java.util.Date expiry_date = new java.util.Date();
String pooja=null;

System.out.println("length=="+category.length);
for(i=0;i<category.length;i++)
{
	System.out.println(category[i]+"Selected");
}

String categorystring="";

for(int k=0;k<category.length;k++)
{
	categorystring+=category[k]+",";
	
} 

System.out.println("Concatenated String = "+categorystring);
session.setAttribute("categorystring",categorystring);
 
System.out.println("name:"+ad_name);
System.out.println("description:"+description);
System.out.println("link_url:"+link_url);
System.out.println("slot:"+slot);
System.out.println("ad type jst before assigning it 1 or 2:"+ad_type);
int adType=0;
if(ad_type.contentEquals("guaranteed"))
{
	System.out.println("in guaranteed setting adType!");
	adType=1;
	
}
else
{
	adType=2;
}
System.out.println("just after setting adtype we are printing in reg ad controller="+adType);
String uid1=session.getAttribute("uid").toString();
int uid=Integer.parseInt(uid1);

int slot_type=0,cost=0;
if(slot.equals("premium") )
{
	cost= bp +(100*impressions * 2)+(2*clicks);
}
else
{
	cost= bp+(impressions)+(2*clicks);
}



System.out.println("cost="+cost);
//out.println(" Ad cost is: "+cost);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
//expiry date after  1 month will be inserted..
SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
          Calendar cal = Calendar.getInstance();
          cal.add(Calendar.MONTH, 1);	//Adding 1 month to current date
          String expirydate = dateformat.format(cal.getTime());
          System.out.println(expirydate);
int checker123=0;
System.out.println("space_type="+space_type);
if(ad_type.equals("guaranteed"))
{

	System.out.println("in guaranteed..");
	String sql1="insert into register_ad(uid,ad_name,description,link_url,type,impressions,preferred_time,cost,space_type,expiry_time,status,clicks) values ("+uid+",'"+ad_name+"','"+description+"','"+link_url+"',"+adType+","+impressions+",'"+slot+"',"+cost+",'"+space_type+"','"+expirydate+"',0,'"+clicks+"')";
System.out.println(sql1);
st1.executeUpdate(sql1);
checker123=1;
session.setAttribute("checker123",checker123);

	String sql3="select * from register_ad where ad_name='"+ad_name+"' and description='"+description+"'";
		ResultSet rs2= st3.executeQuery(sql3);
	
		int ad_id3=0;
		while(rs2.next())
		{
			ad_id3=rs2.getInt("ad_id");
		}
	System.out.println("ad id is in guaranteed ::"+ad_id3);
	session.setAttribute("ad_id3",ad_id3);
//


String sql4="insert into scan_ad_interest(ad_id,gender,ad_category,age_from,age_to) values('"+ad_id3+"','"+gender+"','"+categorystring+"',"+age_from1+","+age_to1+")";
System.out.println(sql4);
st4.executeUpdate(sql4);

//

	
System.out.println("randomly madhe print kelie:cost="+cost);

//
session.setAttribute("cost12",cost);

}
else
{
	if(ad_type.equals("auctioned"))
	{
int cost123=0;
	    System.out.println("in auctioned");		
		cost123=cost;	
		cost=bid;

	    String sql="insert into bid(uid,ad_name,description,link_url,type,impressions,preferred_time,cost,space_type,expiry_time,p_id) values ("+uid+",'"+ad_name+"','"+description+"','"+link_url+"',2,1000,'"+slot+"',"+cost+",'"+space_type+"','"+expirydate+"',0)";
		System.out.println("bid wali query..."+sql);
		
		st1.executeUpdate(sql);

		checker123=2;
		session.setAttribute("checker123",checker123);
	//   put top 20 into register_ad after expiry time...
	
		
		//expiry_date=today+interval(30);
		
	System.out.println("again printed cost in else wala auctioned="+cost123);
	
		String sql2="select * from bid where ad_name='"+ad_name+"' and description='"+description+"'";
		ResultSet rs2= st2.executeQuery(sql2);
	
		int ad_id3=0;
		while(rs2.next())
		{
			ad_id3=rs2.getInt("ad_id");
		}
	System.out.println("ad id is auctioned::"+ad_id3);

	//session.setAttribute("ad_id3",ad_id3);
	
		String sql3="insert into scan_ad_interest_bid values('"+ad_id3+"','"+gender+"','"+categorystring+"',"+age_from1+","+age_to1+")";
		System.out.println(sql3);
		st3.executeUpdate(sql3);
		
		//added by devika on 26th april
		
		Statement st5=con.createStatement();
		String sql5="insert into register_ad(uid,ad_name,description,link_url,type,impressions,preferred_time,cost,space_type,expiry_time,status,clicks) values ("+uid+",'"+ad_name+"','"+description+"','"+link_url+"',"+adType+","+impressions+",'"+slot+"',"+cost+",'"+space_type+"','"+expirydate+"',0,'"+clicks+"')";	
		st5.executeUpdate(sql5);
			//ends
	
		Statement st25=con.createStatement();
			
			String sql25="select * from register_ad where ad_id=last_insert_id()";
			System.out.println(sql25);
			ResultSet rs25=st25.executeQuery(sql25);
			
			while(rs25.next())
			{
				ad_id3=rs25.getInt("ad_id");
			}
			session.setAttribute("ad_id3",ad_id3);
			
			
			session.setAttribute("cost12",cost123);
	}
}


String cost123=session.getAttribute("cost12").toString();
System.out.println("just be4 image_part cost is="+cost123);

%>
<div id="wrapper">
<div id="page">
<div id="page-bgtop">
<div id="page-bgbtm">
<div class="post" style="width:1100px;left:200px;background:#3D2729">

<font face="Palatino Linotype" size=5em color=#F6B300> Ad Cost is : <%=cost123 %></font>

<br>
<br>
<center>
<div style="height:300px;width:900px;background:#F1EDE4">
<br>
<br>
<br>
<FORM ENCTYPE="multipart/form-data" ACTION="register_ad_img.jsp" METHOD=POST>


<center>
<table border="0">
<tr>
<center><td colspan="2" align="center"><b><font face="palatino Linotype" size=3em color="#F6B300">Upload Picture for Ad</font></b></center></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td><b><font face="palatino Linotype" size=3em color="#F6B300">Choose an image:</font></b></td>
<td><INPUT NAME="file" TYPE="file" id="uploadImage"></td>
</tr>
<tr><td colspan="2" align="center"> </td></tr>
<tr><td colspan="2" align="center"> </td></tr>
<br>
<br>

<input type="submit" value="Upload This File" style="color:#F1EDE4" class="button" id="upload"> </td></tr>

<table>
</center>


</table>
</table>
</center>

</FORM>

</div>
</center>
<br>
</div>
</div>
</div>
</div>
</div>

<%
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>
<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    
</body>
</html>