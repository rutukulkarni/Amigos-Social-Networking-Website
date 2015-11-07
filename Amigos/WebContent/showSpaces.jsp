<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />

 <link rel="shortcut icon" href="images/favicon.ico" />
   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Advertise</title>
   <script type="text/javascript">
   
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}
</script>
  <script type="text/javascript">
          function get_radio_value() {
            var inputs = document.getElementsByName("space_type");
            for (var i = 0; i < inputs.length; i++) {
              if (inputs[i].checked) {
                return inputs[i].value;
              }
            }
          }

          function checkbid() {
            var id = get_radio_value();
            //alert("selected input is: " + id);
            var bid=document.getElementById("bid1").value;
        	//alert("you entered :"+bid);
        	if(id > bid)
        	{
        		alert("Enter Valid BID!!!!!!");
        		return false;
         	}
        	//alert("not in if");
        	return true;

        	
        	
          }
        </script>

   <script type="text/javascript">
   
function check_friend()
{

//window.location.href="listOfFriends.jsp?name="+document.getElementById("search-text").value;


document.getElementById("search-submit").href+="?name="+ document.getElementById("search-text").value;


}
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
</div><div id="wrapper">
	<!-- end #header -->
	<div id="page">
		<div id="page-bgtop">
			<div id="page-bgbtm">
					<div class="post">

<h2><label> These are the only available spaces for bidding. Hurry!!! BUY NOW...</label></h2>
<h3><label> You can be the HIGHEST bidder!!!</label></h3>


<form name="showSpaces" action="registerAd.jsp" method="post" onsubmit="return checkbid()">
<table>
<tr>

<%
String pageType= request.getParameter("adType").toString(); 
System.out.println("type=="+pageType);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();

ResultSet rs= st.executeQuery("select * from avail_spaces where ad_type='"+pageType+"'");
int i=0;
String space_type=null;
String imagepath=null;
int url_id=0;
String url_name=null;
int cost=0;

int counter=0;
%>
<table>
<tr>
<td>
<%
while(rs.next())
{
	i++;
	imagepath=rs.getString("space_type")+".png";
	space_type=rs.getString("space_type");
	System.out.println("image path is : "+imagepath);
	url_id=rs.getInt("url_id");
	String sql=null;

	sql="select max(cost) from bid where space_type='"+rs.getString("space_type")+"'";
	System.out.println(sql);
	if(pageType.equals("auctioned"))
	{
		System.out.println("in if");
		ResultSet rs1=st1.executeQuery(sql);
		while(rs1.next())
		{
			cost= rs1.getInt(1);
		}
		System.out.println("cost in if =="+cost);	
	
			
	}
	else
	{

		cost=rs.getInt("space_cost");	
		System.out.println("cost in else =="+cost);		
	
	}
	
	
	System.out.println("cost=="+cost);		
	ResultSet rs2= st2.executeQuery("select * from ad_url_type where url_id="+url_id);
	while(rs2.next())
	{
		url_name=rs2.getString("url_name");
	}

%>

	<br> 
	<br>
	<img src=<%=imagepath%> alt=path height=100 width=100 hspace=50 > <br>
 	         <input type="radio" name="space_type" value=<%=cost %> id="space_type" ><%=rs.getString("space_type") %> <br>
			 <label> Cost = <%=cost %> </label> <br>
			 <label> URL  = <%=url_name %></label></br></br>

			 <%
			 counter++;
			 if(counter==3)
			 {
				 %>
				 </td>
				 
				 </tr>
				 <tr>
				 <td>
				 <%
			 }
			 else
			 {
				 %>
				 </td>
				 <td>
				 <%
			 }
}

%>
</td>
</tr>
</table>
</tr>
</table>

<input type="hidden" value=<%=pageType %> name="pageType" id="pageType">

<input type="hidden" value=<%=space_type %> name="space_type1" id="space_type1"><br><br>						 


<input type="hidden" value=<%= cost %> name="cost" id="<%=space_type%>">
<%
if(pageType.equals("auctioned"))
{
	%>

<label>Enter Your Bid: <input type="text" name="bid" id="bid1"></label>
	
	
	<%
}

%>

<input type="submit"  value="BUY NOW!!!" class=button_up style="position:center;"><br>

</form>



</div>
</div>
</div>
</div>
</div>

<div id="footer">
	<p>&copy; 2013 Amigos.com. | Photos by <a href="http://fotogrph.com/">Fotogrph</a> | Design by <a href="http://www.freecsstemplates.org">FCT</a>.</p>
</div>

</body>
</html>