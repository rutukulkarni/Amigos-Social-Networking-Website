<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Collections.*"%>

    <link rel="shortcut icon" href="images/favicon.ico" />

<%@ page import="java.util.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<FORM action="ad_datastruct_controller.jsp" method="POST">
<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);

Integer userid=(Integer)session.getAttribute("uid");
System.out.println("userid in ad_datastruct:=  "+userid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st4=con.createStatement();
Statement st5=con.createStatement();
Statement st6=con.createStatement();
Statement st7=con.createStatement();
Statement st10=con.createStatement();

String gen=null;
String gender1=null;
String age=null;
String lang=null;
String music=null;
String tv_sho=null;
String travel=null;
String spo=null;
String gadget=null;
String book=null;
String shopping=null;
String others=null;

System.out.println("after con..!");

String sql="select * from advanced_personal where uid="+userid;
ResultSet rs=st.executeQuery(sql);
Integer i=5;
String ad_category=null;
while(rs.next())
{
	String sql7="select * from basic_info where uid="+userid;
	ResultSet rs7=st7.executeQuery(sql7);

	while(rs7.next())
	{
	
	gender1=rs7.getString("gender");
	age=rs7.getString("age");

	System.out.println("gender:="+gender1);
	System.out.println("age:="+age);

	
	while(i<13)
	{
	System.out.println("in while rs.next");
	gen=rs.getString(i);
	System.out.println("colun entry::="+gen);
	
	if(gen!=null)//if some thing present in dat specific column of db table
	{
		System.out.println("gen not null::="+gen);
		if(i==5)
		{
			System.out.println("in i="+i);
			if(ad_category==null)
			{
				ad_category="languages";
				System.out.println("ad_category inside i=5="+ad_category);
				
			}
		
		}
		else if(i==6)
		{
			if(ad_category==null)
			{
				ad_category="music";
			}
			else
			{
				ad_category=ad_category+",music";
					
			}
		}
		else if(i==7)
		{
			if(ad_category==null)
			{
				ad_category="tv_shows";
			}
			else
			{
				ad_category=ad_category+",tv_shows";
					
			}
		}
		else if(i==8)
		{
			if(ad_category==null)
			{
				ad_category="travel";
			}
			else
			{
				ad_category=ad_category+",travel";
					
			}
		}
		else if(i==9)
		{
			if(ad_category==null)
			{
				ad_category="sports";
			}
			else
			{
				ad_category=ad_category+",sports";
					
			}
		}
		else if(i==10)
		{
			if(ad_category==null)
			{
				ad_category="gadgets";
			}
			else
			{
				ad_category=ad_category+",gadgets";
					
			}
		}
		else if(i==11)
		{
			if(ad_category==null)
			{
				ad_category="books";
			}
			else
			{
				ad_category=ad_category+",books";
					
			}
		}
		else if(i==12)
		{
			if(ad_category==null)
			{
				ad_category="shopping";
			}
			else
			{
				ad_category=ad_category+",shopping";
					
			}
		}
		
		System.out.println("ad_category::="+ad_category);
		
	}
	else//null in that column of db table
	{
		
		System.out.println("null in db table");
		
	}
	
	i++;
	System.out.println("i::="+i);
	System.out.println("ad_category::="+ad_category);

	}
	
	
	
	//gen=rs.getString("gender");
	//age=rs.getString("age");
	//lang=rs.getString("languages");
	//music=rs.getString("music");
	//tv_sho=rs.getString("tv_shows");
	//travel=rs.getString("travel");
	//spo=rs.getString("sports");
	//gadget=rs.getString("gadgets");
	//book=rs.getString("books");
	//shopping=rs.getString("shopping");
	//others=rs.getString("other");
	}
	
}



System.out.println("gender:="+gender1);

System.out.println("age:="+age);

System.out.println("ad_category::="+ad_category);

System.out.println("users ad_category now in string ad_category");

String category=null;
String ads_id=null;

int j=0;
int n=0;
int d=0;
int k=0;
String ad[]=new String[100];
String category1=null;

if(ad_category==null)
{
	
	System.out.println("show random ads");
	String sql6="select * from scan_ad_interest";
	ResultSet rs6=st6.executeQuery(sql6);
	
	while(rs6.next())
	{
		System.out.println("inside rs6 loop!");
	category1=rs6.getString("ad_category");
	System.out.println("category1 in ad_datastruct="+category1);
	
	String z5=null;
	String y5=null;
	String s5=category1;
	String[] result5=s5.split(",");
	for (int x=0; x<result5.length; x++) 
	{

		y5=result5[x];

		System.out.println("y5 in ad_datastruct="+y5);
		
		if(y5.contentEquals("Other"))
		{
		
	ads_id=rs6.getString("ad_id");
	System.out.println("advertisement id if random ad_category if no intrest of user:="+ads_id);
	ad[j]=ads_id;
	System.out.println("advertisement id if random ad_category if no ad_category of user added in array :="+ads_id);
	j++;
	n++;
	
	
		}
	for(j=0;j<n;j++)
	{
		System.out.println("array element if randomised ads to be displayed:="+ad[j]);
	}
	
	}
	}
	for(int m=0;m<n;m++)
	{
	%>
	<input type="hidden" name = "loc" value = "<%= ad[m] %>">
	<%
	
	}
	
}
else
{
	String category2=null;
	
	System.out.println("show random ads");
	String sql10="select * from scan_ad_interest where gender='"+gender1+"' or gender='both' and age_from<"+age+" && "+age+" <age_to";
	
	ResultSet rs10=st10.executeQuery(sql10);
	
	while(rs10.next())
	{
		
	category2=rs10.getString("ad_category");
	
	System.out.println("in ad_datastruct page category2="+category2);
	
	String z4=null;
	String y4=null;
	String s4=category2;
	String[] result4=s4.split(",");
	for (int x=0; x<result4.length; x++) 
	{

		y4=result4[x];

		System.out.println("y4 in ad_datastruct="+y4);
		
		if(y4.contentEquals("Other"))
		{
		
	
	
	ads_id=rs10.getString("ad_id");
	System.out.println("advertisement id if random ad_category :="+ads_id);
	ad[j]=ads_id;
	System.out.println("advertisement id if random ad_category added in array nehow:="+ads_id);
	j++;
	n++;
	}
	for(j=0;j<n;j++)
	{
		System.out.println("array element if randomised ads to be displayed:="+ad[j]);
	}
	
	}
	
	}


//for(j=0;j<100;j++)
//{
	//ad[j]=null;
//}

String z=null;
String y=null;
System.out.println("ad_category="+ad_category);
String s=ad_category;
System.out.println("s="+s);

String[] result1=s.split(",");
for (int x=0; x<result1.length; x++) 
{

y=result1[x];

System.out.println("y(useris 1st interest):="+y);

//String 
//String sql4="select * from scan_ad_interest where gender='"+gender1+"' or gender='both' and age_from<"+age+" && "+age+" <age_to";
//ResultSet rs4=st4.executeQuery(sql4);

//boolean e=true;
//while(rs4.next())
//{
//	System.out.println("in while rs4");
//	e=false;
//}
//if(e)
//{
//	System.out.println("no ads sinc age barrier!");
//	String sql3="select * from scan_ad_interest where ad_category='random'";
//	ResultSet rs5=st5.executeQuery(sql3);
	
//	while(rs5.next())
//	{
		
//	ads_id=rs5.getString("ad_id");
//	System.out.println("advertisement id if random ad_category:="+ads_id);
//	ad[j]=ads_id;
//	System.out.println("advertisement id if random ad_category added in array :="+ads_id);
//	j++;
//	n++;
//	}
//	for(j=0;j<n;j++)
//	{
//		System.out.println("array element if random:="+ad[j]);
//	}

	
//}
//else
//{
	
	String sql1="select * from scan_ad_interest where gender='"+gender1+"' or gender='both' and age_from<"+age+" && "+age+" <age_to";
	
	
	ResultSet rs1=st1.executeQuery(sql1);
	
while(rs1.next())

	{
		category=rs1.getString("ad_category");
		ads_id=rs1.getString("ad_id");
	
		
		String z6=null;
		String y6=null;
		String s6=category;
		String[] result6=s6.split(",");
		for (int xx=0; xx<result6.length; xx++) 
		{

			y6=result6[xx];

			System.out.println("y6 in ad_datastruct="+y6);
			
			if(y6.contentEquals("Other"))
			{
			}
			else
			{

		System.out.println("category="+category);
		
		String sql2="SELECT SUM(LENGTH(ad_category) - LENGTH(REPLACE(ad_category, ',', '')) + 1) FROM scan_ad_interest where ad_id="+ads_id;
		ResultSet rs2=st2.executeQuery(sql2);
		while(rs2.next())
		{
			d=0;
			String a=rs2.getString("SUM(LENGTH(ad_category) - LENGTH(REPLACE(ad_category, ',', '')) + 1)");
      		System.out.println("count="+a);
      		
      		if(Integer.parseInt(a)==1)//only 1 category selected by advertiser)
      		{
      			System.out.println("y in integer.parse:="+y);
      			System.out.println("category in intger.parse="+category);
      			
      			if(category.equalsIgnoreCase(y))
      			{
      				System.out.println("y in category==y:="+y);
      				
      				for(k=0;k<n;k++)
      				{
            			System.out.println(ads_id);
          
            			
      					if(Integer.parseInt(ad[k])==Integer.parseInt(ads_id))
      					{
      						System.out.println("array for ads:="+ad[k]);
      						System.out.println("adv_id alrdy added dnt add again inside array mathng ad_id");
      						
      						System.out.println("adv_id alrdy added dnt add again");
      						d=1;
      					}
     
      					
      				}
      				
      				if(d==0)
      				{
            		ad[j]=ads_id;
            		System.out.println("adv_id added"+ads_id);
            		System.out.println(ad[j]);
            		j++;
            		n++;
            		
      				}
      			    
      				     				
      				System.out.println("category 1 but matches!");
      		
      				
      			}
      			else
      			{
      				System.out.println("category only 1 but doesnt match!");
      			}
      		}
      		else
      		{
	     	 	
				String z1=null;
				String y1=null;
				System.out.println("categories="+category);
				String s1=category;
				System.out.println("s1="+s1);
		
				String[] result2=s1.split(",");
  				for (int x1=0; x1<result2.length; x1++) 
  				{
				y1=result2[x1];
				System.out.println("y1="+y1);
				System.out.println("y="+y);
		 
                	if(y.equalsIgnoreCase(y1))
                	{
              
                	for(k=0;k<n;k++)
          				{
                			System.out.println(ads_id);
              
                			
          					if(Integer.parseInt(ad[k])==Integer.parseInt(ads_id))
          					{
          						System.out.println("array for ads:="+ad[k]);
          						System.out.println("adv_id alrdy added dnt add again inside array mathng ad_id");
          						
          						System.out.println("adv_id alrdy added dnt add again");
          						d=1;
          					}
         
          					
          				}
          				if(d==0)
          				{
                		ad[j]=ads_id;
                		System.out.println("adv_id added"+ads_id);
                		System.out.println(ad[j]);
                		j++;
                		n++;
                		
          				}
          				System.out.println("multiple categories but matches user ad_categorys");
          			
                	}
                	else
                	{
                		System.out.println("multiple categories but does not match user ad_categorys");
                		
                		
                	}
	     		
                	
  				} 	          
      		}
      		}
      		
		//}
		}
	}
	}
}
}//end of for 	

	
int q=0;	
		
for(j=0;j<n;j++)
{
	System.out.println("array for ads in ad_datatruct:="+ad[j]);
	q++;
	//session.setAttribute("adv[j]", ad[j]);
}

System.out.println("array for ads length"+q);
System.out.println("p in ad_datastruct="+q);
session.setAttribute("len",q);
session.setAttribute("Adv",ad);



for(j=0;j<q;j++)
{
	System.out.println("array for ads in ad_datatruct no.2:="+ad[j]);

	//session.setAttribute("adv[j]", ad[j]);
}





response.sendRedirect("ad_datastruct_controller.jsp");
		
} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else

		
		
		
%>
<!-- <input type="submit" value="ad display">
-->

</FORM>

</body>
</html>