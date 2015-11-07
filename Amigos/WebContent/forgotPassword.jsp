<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="style.css" />
 
 
 <title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
</head>
<body>
<div id="wrapper">
 <div id="page">

 <div id="page-bgtop">
<div id="page-bgbtm">
<div style="margin-bottom: 15px;padding: 30px 40px;border-radius: 8px;width:1000px;height:50px;background-color:#3D2729;">
<h2>
Forgot your Password?</h2>
</div>
<div>
<div style="float:left;left:200px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<img src="images/q3.jpg" width="200px" height="400px">

</div>
<br>
<br>

<br>
<br>
<div class="post" style="float:right;position:absolute; width:400px; margin:0px auto;left:530px;">

	<form id="forgotPassword" action="new_password.jsp" method="post">

			<%

			
			System.out.println("in forgotpassword.jsp!!!!!!!!!!");
				String username = request.getParameter("uname");
				//String username="";
 //username=request.getAttribute("username").toString();
				
 System.out.println("In forgotPassword.jsp::username " +username);

				//String uid = session.getAttribute("uid").toString();

				Class.forName("com.mysql.jdbc.Driver");
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
				Statement st = con.createStatement();
				
				Statement st9 = con.createStatement();
				ResultSet rs9;
				int user_cha_id=0;
				rs9 = st9.executeQuery("SELECT * from basic_info where username='"+username+"'");
				
				boolean empty=true;
				while(rs9.next())
				{
					empty=false;
					user_cha_id=rs9.getInt("uid");
				}
				
				if(empty==true)
				{
					response.sendRedirect("login1.jsp?flag=1");
					
				}
			
				else
				{
				
				System.out.println("in forgot password user cha id is :"+user_cha_id);
				if(user_cha_id==0)
				{
					System.out.println("user cha id is 0");
					response.sendRedirect("login.jsp");
					
					
				}
				else
				{
					System.out.println("user cha id is not 0!!!!");
				ResultSet rs;
				Statement st1 = con.createStatement();
				ResultSet rs1;

				
				rs = st.executeQuery("SELECT uid,question_id,answer FROM basic_info where username='"+username+"'");

				int question_id = 0;
				String uid1=null;
				String answer = null;
				
				while (rs.next()) {
					question_id = rs.getInt("question_id");
					System.out.println("\nQUESTION ID ::" + question_id);
					if(question_id==0)
					{
						System.out.println("in question id ==0 comparison loop!");
						response.sendRedirect("login.jsp");
					}
					else
					{
					uid1 = rs.getString("uid");
					//request.setAttribute("answer",answer);
				
					request.setAttribute("uid", uid1);
					 answer = rs.getString("answer");
					System.out.println("from db::" + answer);
					}
				}
				
				
				
			
			
				

				String sql1 = "Select question from security_question where qid="+ question_id;
				rs1 = st1.executeQuery(sql1);
				String question=null;
				while (rs1.next()) {
					question = rs1.getString("question");
					
				}
			%>
			<center>
			<h3>Answer this Question::</h3>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
			<h4><%= question%></h4>
			<%


				//String uid = rs.getString(1);
				//String pwd=rs.getString(2);
				//System.out.println(pwd);

				//response.sendRedirect("Home1.jsp?fname="+username);
			%>

		
			<br>
			<br> Answer: <input type="text" name="password_answer"	id="password_answer" style="border-radius: 3px;height:20px;width:150px;"><br><br><br>
			
			  <input type="button"  name="submit" value="Proceed" onclick="check()" class="button" style="color:#F1EDE4"> 
</center>
			
<script type="text/javascript">
function check()
{
	//alert("in fucntion check!");
var red = document.getElementById("password_answer").value;
//alert("red = "+red);
var blue = "<%=answer%>";
//alert("blue = "+blue);
var match = null;
if (red == blue) {
match = 'equal';
//alert("match = "+match);
alert("please enter new password!!!");
//window.location.href ="new_password.jsp?ans="+ans;
window.location.href="new_password.jsp";
} else {
match = 'unequal';
//alert("match = "+match);
alert("enter correct answer to security question!");
}


}
</script>
			



			<!--  <form method="POST" action="check_password.jsp"><p>
<input type="Submit" value="Submit" ></p>

-->

			<%
					
				session.setAttribute("uid1", uid1);
System.out.println("Session element in forgotpassword is : "+uid1+"\n");
//response.sendRedirect("prof.jsp");
				} // end of else part of user cha id is 0
			
			
				}		
			%>
			
		
	</form>



	<!--  <a href="new_password.jsp" onclick="check_answer();">Proceed</a><br><br>  -->

	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	

<div id="footer">
	<p> 2013 Amigos.com. |    <a href="about_us.jsp">About us</a>    |     <a href="help.jsp">Help</a>    |     <a href="privacy_about_us.jsp">Privacy</a></p>
</div>
    	
</body>



</html>