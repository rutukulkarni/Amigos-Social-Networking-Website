<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     
     <%@ page import= "java.text.SimpleDateFormat"%>
<%@ page import= "java.util.*" %>
<%@ page import= "java.io.*" %>
<%@ page import= "java.lang.*" %>
     <%@ page import= "java.text.SimpleDateFormat"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<script type="text/javascript">

  // initialise variable to save cc input string
  var cc_number_saved = "";

</script>
<script >


	function checkcc() {
		//alert(document.getElementById("cc_number").value);
		//alert("in function!");
		
		var curr_date = document.getElementById("curr_date").value;
		//alert("curr date print ho.."+curr_date);
		var exp_date=document.getElementById("expiry_date").value;

		//alert(exp_date);
		

	    var re16digit = /^\d{16}$/;
	   
	    if (!re16digit.test(document.getElementById("cc1_number").value))
	    {
	        alert("Please enter your 16 digit credit card number");
	        return false;
	    }
	    else   if(exp_date=="")
	    	{
	    	alert("Enter expiry date!!");
			return false;
	    	}
	    else if(exp_date < curr_date)
	 		{
	 			alert("Enter valid expiry date!!");
	 			return false;
	 		}
	
	else{
			return true;
			}
		
	}

</script>
</head>
<body>
<%
if(session.getAttribute("name")!=null)
{
	System.out.println("!!!!!!!!!!!!!!! OLD WALA SESSION");
String cost1=session.getAttribute("cost12").toString();
int cost=Integer.parseInt(cost1);
System.out.println("cost in cc page="+cost);

String ad_id1=session.getAttribute("ad_id3").toString();
int ad_id=Integer.parseInt(ad_id1);

System.out.println("ad_id in cc page="+ad_id);


%>
<form action="CreditControl.jsp" method="post" onsubmit="return checkcc();">
<div class="post">


<font face="Palatino Linotype" size="2em" color="#F6B300">	
Mandatory Fields have been marked with a 
</font>
<font face="Palatino Linotype" size="2em" color="#E00000">*</font>.
<br>

<br>Credit Card Type:<input type="radio" name="credit" id="credit" value="Visa" checked>Visa <br>
<input type="radio" name="credit" id="credit" value="MC" >Master Card<br><br>
		

<br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
16 digit Credit Card Number(Example: 1111222233334444)<input type="text" size="24" maxlength="20" name="cc1_number" id="cc1_number"> 

<br><br>

<font face="Palatino Linotype" size="2em" color="#E00000">*</font>
Expiry Date(DD-MM-YYYY)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="date" name="ED" id="expiry_date"><br><br>



<%

SimpleDateFormat dateformat1 = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal1 = Calendar.getInstance();
//cal.add(Calendar.MONTH, 0);	//Adding 1 month to current date
String d1 = dateformat1.format(cal1.getTime());
System.out.println("curr date ="+d1);


%>	
<input type="hidden" value=<%=d1 %> id="curr_date">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" value="submit" class="button_up" ><br><br>

</div>
</form><br><br>
<% 
}

    else
    {
    
    System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!! NEW WALA SESSION!!! ");
    response.sendRedirect("login.jsp");
    }
    %>

</body>
</html>