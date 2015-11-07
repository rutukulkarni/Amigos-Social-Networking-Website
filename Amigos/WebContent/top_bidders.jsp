<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.sql.*,java.util.zip.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

String space_type=request.getParameter("space_type");
System.out.println("!!!!!!!!!!!!!!!! SPACE TYPE = "+space_type);

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select count(*) from bid where space_type='"+space_type+"'");

int count=0;

while(rs.next())
{
	count=rs.getInt(1);
	System.out.println("in top_bidders.jsp :: count = "+count);
}

Statement st1=con.createStatement();
Statement st2=con.createStatement();
PreparedStatement ps=null;
ResultSet rs1;
ResultSet rs2;

String sql="select * from bid where space_type='"+space_type+"' order by cost desc";
ps=con.prepareStatement(sql);
rs1=ps.executeQuery();
System.out.println("aft ordering by cost");


int count1=0;
int cost_retrieved=0;
Integer result[]={0,0,0,0,0};
rs2=st2.executeQuery("select * from bid  where space_type='"+space_type+"'order by cost desc");
int x=0;
while(rs2.next())
{
		if(count1!=5)
		{
		cost_retrieved=rs2.getInt("cost");
		//System.out.println("cost_retrieved = "+cost_retrieved);
		count1++;
		
			result[x]=cost_retrieved;
			//System.out.println("result["+x+"] = "+cost_retrieved);
			if(x!=5)
			{	
			x++;
			}
		}
		
		
}


%>
<label>TOP 5 BIDS FOR THIS SPACE IS ::</label>
<br>
<% 
for(x=0;x<result.length;x++)
{
	
	//System.out.println(" cost["+x+"] = "+result[x]);
	%>
	<label> <%=result[x]%>  </label> <br>
	<% 
}
//-----



} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else





%>

<form name="top_bidders" action="showSpaces.jsp?adType=auctioned" method="POST">
<input type="submit" value="GO BACK !">
</form>
</body>
</html>