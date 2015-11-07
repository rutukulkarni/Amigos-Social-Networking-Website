
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>

function change(int p)
{
	//alert("in change!");
var p=p+1;
//alert("p ="+p.value);
return true;
}

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int p=0;
%>
<form name="hi" onsubmit="return change(<%=p%>);" >


<input type="submit" value="change" >
<%
System.out.println("p = "+p);
%>
</form>
</body>
</html>