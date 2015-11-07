<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

 <%@ page language="java" import="java.sql.*"  %>
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String eid1=request.getParameter("eid");
int eid=Integer.parseInt(eid1);

System.out.println("eid in add_ppl pg="+eid);
session.setAttribute("eid",eid);

String uid1=session.getAttribute("uid123").toString();
int uid=Integer.parseInt(uid1);
System.out.println("uid in add_ppl pg="+uid);



Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");


Statement st=con.createStatement();

String sql="select * from permanent_friend where uid="+uid+" or friend_id="+uid;
ResultSet rs=st.executeQuery(sql);
int uid2=0;
int friend_id1=0;
int my_friend_id=0;

int index=1;
int k=0;

while(rs.next())
{
	uid2=rs.getInt("uid");
	friend_id1=rs.getInt("friend_id");
	


if(uid2==uid)
		my_friend_id=friend_id1;

else
		my_friend_id=uid2;


System.out.println("friend id ahe in add_ppl pg="+my_friend_id);


Statement st4=con.createStatement();
String sql4="select * from event_info where eid="+eid;
ResultSet rs4=st4.executeQuery(sql4);
String members_list=null;
String members_confirm=null;

while(rs4.next())
{
	members_list=rs4.getString("emembers");
	System.out.println("members _list in rs4 in add_ppl="+members_list);
	members_confirm=rs4.getString("emembers_confirm");
	System.out.println("members _confirm in rs4 in add_ppl="+members_confirm);
	
	
int confirm=0;
String z5=null;
String y5=null;
int y6=0;
String entry=null;
String t1=null;
int t2=0;

int[] temp1=new int[100];
int n=1;
String s5=members_list;
String[] result5=s5.split(",");
int flag=0;
int len=result5.length;

for (int x=0; x<result5.length; x++) 
{
	
	System.out.println("inside for taktie=");

	y5=result5[x];
	y6=Integer.parseInt(y5);

	
	if(y6==my_friend_id)
	{
		System.out.println("alrdy ahe frnd id in ivitees list!");
		flag=1;
		System.out.println("flag printed in inviteecha if="+flag);
		
		
		
		
	}
	else
	{
		if(flag==1)
		{
			
		}
		else
		{
			flag=2;
		
		System.out.println("b4 putting in temp for invites printing temp1[k]="+my_friend_id);
		temp1[k]=my_friend_id;
		System.out.println("added to temp1="+temp1[k]);
		
		
		k++;
		index++;
		}
	}
}
		
	

String y7=null;
		
String s7=members_confirm;
String[] result7=s7.split(",");
int y8=0;
int leng=result7.length;

for (int xx=0; xx<result7.length; xx++) 
{

	y7=result7[xx];
	y8=Integer.parseInt(y7);

	index++;
	
	if(y8==my_friend_id)
	{
		System.out.println("name found in confirm so this dude is gng to event!");
		flag=1;
		System.out.println("in confirm="+flag);
	}
	else
	{
		if(flag==1||flag==2)
		{
		}
		else
		{
			flag=2;
		
		System.out.println("b4 putting in temp fro confirm printing temp1[k]="+my_friend_id);
		temp1[k]=my_friend_id;
		System.out.println("added to temp1="+temp1[k]);
		
		k++;
		index++;
		}
	}
}

session.setAttribute("invite",temp1);
session.setAttribute("index",index);
}


}

String index1=session.getAttribute("index").toString();
int index2=Integer.parseInt(index1);

String[] temp3=(String[]) session.getAttribute("temp1");
for(k=0;k<index2;k++)
{
	System.out.println("temp3="+temp3[k]);

}
for(k=0;k<index2;k++)
{
	System.out.println("now printing all ppl"+temp3[k]);
			String sql2="select * from basic_info where uid="+temp3[k];
			Statement st2=con.createStatement();
			ResultSet rs2=st2.executeQuery(sql2);
			String fname=null;
			String lname=null;
			int pic_id=0;
			while(rs2.next())
			{

				fname=rs2.getString("first_name");
				lname=rs2.getString("last_name");
				pic_id=rs2.getInt("p_id");
				
			}
			%>
			<div style="width:480px;border-bottom:1px solid;border-bottom-color:#787878;height:80px;">

			<div style="float:left;width:210px;">

			<div style="float:left;width:110px;">
					
					<div style="float:left">

					<input type="checkbox" name="friend" value=<%=my_friend_id %> >
				</div>
				
				<div style="float:right;width:80px;">
					<%
					if(pic_id==0)
					{
					%>
					<img src="images/default.jpg" width="60px" height="60px">
					<%	
					}
					else
					{
					Statement st111=con.createStatement();
					String sql111="select * from image_try where p_id="+pic_id;
					ResultSet rs111=st111.executeQuery(sql111);
					String path=null;
					
					while(rs111.next())
					{
					path=rs111.getString("img_path");	
					}
					
					%>		
					<img src="<%=path%>" width="60px" height="60px">
					<%}//end of else
				%>
				</div>
				</div><!-- end of chcekbox image -->
				
				

				<div style="float:right;width:100px;left:70px">
				
				<label style="font-face:Elephanta;font-size:20px;color:#3D2729;text-transform:capitalize;">
					<%=fname %>&nbsp;<%=lname %> 
					</label>
					
					</div>
					
					</div><!-- end of chckbox+img+naav -->
					


					</div><!-- end of 1 div!" -->

<%		
			}//end of for


	%>
<br>

<a href="EventControl.jsp?flag=1" class="button">Send an Invite</a>

</body>
</html>