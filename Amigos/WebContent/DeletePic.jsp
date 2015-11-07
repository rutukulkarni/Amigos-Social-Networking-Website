<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>

<%@ page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
   
</head>
<body>

<%

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


System.out.println("in delete now!!!");

String p_id=null;
String userid1 = session.getAttribute("uid").toString();
int userid=Integer.parseInt(userid1);

String pic_ids=request.getParameter("p_id");
int pic_id=Integer.parseInt(pic_ids);

System.out.println("in delete pic userid="+userid);
System.out.println("in delete_pic p_id="+pic_id);

String album_ids=request.getParameter("album_id");
System.out.println("album id="+album_ids);

int album_ids1=Integer.parseInt(album_ids);

System.out.println("just b4!");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

System.out.println("just after!");

System.out.println("p_id before create con="+pic_id);
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st5=con.createStatement();
Statement st11=con.createStatement();
Statement st33=con.createStatement();
Statement st15=con.createStatement();

String sql="delete from image_try where p_id="+pic_id;
st.executeUpdate(sql);

String sql5="delete from comment_pictures where p_id="+pic_id;
st5.executeUpdate(sql5);

System.out.println("deleted!");

String sql10="SELECT SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) ) FROM album where uid="+userid+" and album_id="+album_ids;

ResultSet rs20=st33.executeQuery(sql10);
while(rs20.next())
{
	 String a=rs20.getString("SUM(LENGTH(p_id) - LENGTH(REPLACE(p_id, ',', '')) )");
	  System.out.println("count="+a);

if(Integer.parseInt(a)==1)
{
	System.out.println("only 1 picture now in album!");
	String sql15="delete from album where album_id="+album_ids;
	st15.executeUpdate(sql15);
	
	System.out.println("delted from album pan!");
	
	response.sendRedirect("album1.jsp");
	
}
else
{

String sql1="select * from album where album_id="+album_ids1;
System.out.println("outside delete!!!!!!");
ResultSet rs=st1.executeQuery(sql1);

while(rs.next())
{
System.out.println("inside rs!");

p_id=rs.getString("p_id");
System.out.println("p_id!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!="+p_id);
}

	int j=1;
	int k=0;
	int index=0;
	String entry=null;
	String t1=null;
	int t2=0;
	
int[] temp1=new int[100];

		String z=null;
		String y1=null;
		int y=0;
		System.out.println("p_ids(path) of album="+p_id);
		String s=p_id;
		System.out.println("s="+s);
		
		String[] result1=s.split(",");
		for (int x=0; x<result1.length; x++) 
		{
			y1=result1[x];
			y=Integer.parseInt(y1);
			index++;
			System.out.println("index:="+index);
			if(y==pic_id)
			{
				if(index==result1.length)
				{
				System.out.println("last element ahe in dat comma split list!");
				
				}
				else
				{
				while(k<result1.length-1)
				{
				t1=result1[k+1];
				t2=Integer.parseInt(t1);
				temp1[k]=t2;
								
				System.out.println("temp1 when bakiche elements are getting copied!="+temp1[k]);
				k++;
				}
				}
				System.out.println("temp1[0]="+temp1[0]);
				System.out.println("temp1[1]="+temp1[1]);
				System.out.println("temp1[2]="+temp1[2]);
				System.out.println("temp1[3]="+temp1[3]);
				
				k=0;
				
				entry=temp1[k]+",";
				System.out.println("temp1[k]="+temp1[k]);
				for(k=1;k<result1.length-1;k++)
				{
					entry=entry+temp1[k]+",";
				}
				System.out.println("entry="+entry);
				
				
				String sql111="update album set p_id='"+entry+"' where album_id="+album_ids;
				st11.executeUpdate(sql111);
				System.out.println("ata out of delete ja rele hain bhai!");
			}
			else
			{
				temp1[k]=y;
				System.out.println("Element jst enterd in temp array="+temp1[k]);
				k++;
			}
				
		}
  	

System.out.println("outside script!");

System.out.println("album_id="+album_ids);
//response.sendRedirect("album1.jsp");

response.sendRedirect("passAlbumName.jsp?album_id="+album_ids);
//response.sendRedirect("passAlbumName.jsp?album_id="+album_ids);
}
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