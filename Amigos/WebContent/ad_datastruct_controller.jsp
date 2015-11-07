<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Collections.*"%>

<%@ page import="java.util.*"%>
<%@ page import="java.util.Arrays"%>
<%@ page import="java.util.List"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ad datastruct cha splitting</title>
</head>
<body>

<%

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);

String userid1=session.getAttribute("uid").toString();
int userid=Integer.parseInt(userid1);

System.out.println("userid in ad_datastruct:=  "+userid);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");
Statement st=con.createStatement();

//array b is for guaranteed
//array c is for auctioned
String[] adv=(String[]) session.getAttribute("Adv");
		
String[] b_lu=new String[100];
String[] b_lm=new String[100];
String[] b_ll=new String[100];

String[] c_lu=new String[100];
String[] c_lm=new String[100];
String[] c_ll=new String[100];
String[] c_ru=new String[100];
String[] c_rm=new String[100];
String[] c_rl=new String[100];


//String ad_temp[]=(String[])session.getAttribute("Adv");

int adv_count=(Integer)session.getAttribute("len");

System.out.println("adv_count="+adv_count);

int j;
for(j=0;j<adv_count;j++)
{
	System.out.println("array  in ad_datastruct_controller page::="+adv[j]);
}
j=0;
int k=0;//for left upper on guaranteed
int k1=0;
int p=0;//for left upper on auctiond
int p1=0;
int a=0;//for left middle on guaranteed
int a1=0;
int m=0;//for left middle on auct
int m1=0;
int y=0;//left lower on guara
int y1=0;
int z=0;//left lower on auctiond
int z1=0;
int s=0;//right upper on auctiond
int s1=0;
int t=0;//right middle on auctiond
int t1=0;
int h=0;//right lower on auctiond
int h1=0;


String ads_id=null;
String space_type=null;
int type=0;
for(j=0;j<adv_count;j++)
{
String sql="select * from register_ad where ad_id="+adv[j];
ResultSet rs=st.executeQuery(sql);

while(rs.next())
{
	ads_id=rs.getString("ad_id");
	space_type=rs.getString("space_type");
	type=rs.getInt("type");
	System.out.println("ads_id="+ads_id);
		System.out.println("space_type="+space_type);
		System.out.println("type="+type);
		
		if(space_type.contentEquals("left_upper"))
		{
			//left upper wali ad ahe
			if(type==1)
			{
				b_lu[k]=ads_id;
				System.out.println("ad_id added to b_lu[]="+ads_id);
				k++;
				k1++;
			}
			else//if type==2 auc
			{
				c_lu[p]=ads_id;
				System.out.println("ad_id added to c_lu[]="+ads_id);
				p++;
				p1++;
			}
		}
		else if(space_type.contentEquals("left_centre"))
		{
			//left middle wali ad ahe
			if(type==1)
			{
				b_lm[a]=ads_id;
				System.out.println("ad_id added to b_lm[]="+ads_id);
				a++;
				a1++;
			}
			else//if type==2 auc
			{
				c_lm[m]=ads_id;
				System.out.println("ad_id added to c_lm[]="+ads_id);
				m++;
				m1++;
			}
		}
		else if(space_type.contentEquals("left_lower"))
		{
			//left lower wali ad ahe
			if(type==1)
			{
				b_ll[y]=ads_id;
				System.out.println("ad_id added to b_ll[]="+ads_id);
				y++;
				y1++;
			}
			else//if type==2 auc
			{
				c_ll[z]=ads_id;
				System.out.println("ad_id added to c_ll[]="+ads_id);
				z++;
				z1++;
			}
		}
		else if(space_type.contentEquals("right_upper"))
		{
			//right upper wali ad ahe
			if(type==2)
			{
				c_ru[s]=ads_id;
				System.out.println("ad_id added to c_ru[]="+ads_id);
				s++;
				s1++;
			}
		
		}
		else if(space_type.contentEquals("right_centre"))
		{
			//right middle wali ad ahe
			if(type==2)
			{
				c_rm[t]=ads_id;
				System.out.println("ad_id added to c_rm[]="+ads_id);
				t++;
				t1++;
			}
		
		}
		else if(space_type.contentEquals("right_lower"))
		{
			//right lower wali ad ahe
			if(type==2)
			{
				c_rl[h]=ads_id;
				System.out.println("ad_id added to c_rl[]="+ads_id);
				h++;
				h1++;
			}
		
		}
		
		
}
}//end of for loop of no. of advertisements

//displaying the created 9 arrays for auctiond nd gauranteed and then setting them in sessions alonwith their length

for(k=0;k<k1;k++)
{
	System.out.println("array for ads in ad_datastruct b_lu:="+b_lu[k]);
	
}
session.setAttribute("len1",k1);
session.setAttribute("b_lu",b_lu);

for(p=0;p<p1;p++)
{
	System.out.println("array for ads in ad_datastruct c_lu:="+c_lu[p]);

}
session.setAttribute("len4",p1);
session.setAttribute("c_lu",c_lu);

for(a=0;a<a1;a++)
{
	System.out.println("array for ads in ad_datastruct b_lm:="+b_lm[a]);
	
}
session.setAttribute("len2",a1);
session.setAttribute("b_lm",b_lm);

for(m=0;m<m1;m++)
{
	System.out.println("array for ads in ad_datastruct c_lm:="+c_lm[m]);
	
}
session.setAttribute("len5",m1);
session.setAttribute("c_lm",c_lm);

for(y=0;y<y1;y++)
{
	System.out.println("array for ads in ad_datastruct b_ll:="+b_ll[y]);
	
}
session.setAttribute("len3",y1);
session.setAttribute("b_ll",b_ll);


for(z=0;z<=z1;z++)
{
	System.out.println("array for ads in ad_datastruct c_ll:="+c_ll[z]);
}
session.setAttribute("len6",z1);
session.setAttribute("c_ll",c_ll);

for(s=0;s<=s1;s++)
{
	System.out.println("array for ads in ad_datastruct s_ru:="+c_ru[s]);
	
}
session.setAttribute("len7",s1);
session.setAttribute("c_ru",c_ru);

for(t=0;t<=t1;t++)
{
	System.out.println("array for ads in ad_datastruct c_rm:="+c_rm[t]);
	
}
session.setAttribute("len8",t1);
session.setAttribute("c_rm",c_rm);

for(h=0;h<=h1;h++)
{
	System.out.println("array for ads in ad_datastruct c_rl:="+c_rl[h]);

}
session.setAttribute("len9",h1);
session.setAttribute("c_rl",c_rl);


//creating friends list
String friend_list="0";
int my_friend_id=0;
Statement st13=con.createStatement();
String sql13="select * from permanent_friend where uid="+userid+" or friend_id="+userid;
ResultSet rs13=st13.executeQuery(sql13);
int uid1=0;
int friend_id1=0;
while(rs13.next())
{
	uid1=rs13.getInt("uid");
	friend_id1=rs13.getInt("friend_id");


if(uid1==userid)

	my_friend_id=friend_id1;

else
	my_friend_id=uid1;

System.out.println("my_friend_id in ad_datastruct_controller="+my_friend_id);
if(friend_list.contentEquals("0"))
	friend_list=my_friend_id+",";

else
	friend_list=friend_list+my_friend_id+",";


}


System.out.println("friend_list in ad_datstruct controller="+friend_list);
session.setAttribute("friend_list",friend_list);
response.sendRedirect("home_try.jsp");






} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else




%>
</body>
</html>