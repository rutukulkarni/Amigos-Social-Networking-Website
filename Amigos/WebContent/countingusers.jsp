<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import = "java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Amigos</title>
 <link rel="shortcut icon" href="images/favicon.ico" />
    <link rel="shortcut icon" href="images/favicon.ico" />
   
   
</head>
<body>

<% 

System.out.println("UID IS : " + session.getAttribute("uid"));
if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");


String interest123=session.getAttribute("categorystring").toString();
System.out.println("categorystring in interest123 = "+interest123);

Class.forName("com.mysql.jdbc.Driver");
Connection con = null;
con=DriverManager.getConnection("jdbc:mysql://localhost:3306/amigos","root","rutuja");

//String gender=session.getAttribute("gender").toString();

String interest="";
int total_count=0;
int count1=0;
int count=0;
String b = "music";
String c="languages";
int count2=0;
String d = "tv_shows";
int count3=0;
String e = "travel";
int count4=0;
String f = "sports";
int count5=0;
String g = "gadgets";
int count6=0;
String h = "books";
int count7=0;
String i1 = "shopping";

int males=0;
int females=0;



Statement st=con.createStatement();
Statement st1=con.createStatement();
Statement st2=con.createStatement();
Statement st3=con.createStatement();
Statement st4=con.createStatement();
Statement st5=con.createStatement();
Statement st6=con.createStatement();
Statement st7=con.createStatement();
Statement st123=con.createStatement();


//-------------------------------------

int l=0;
int m=0;
int tv=0;
int tr=0;
int sp=0;
int gd=0;
int bk=0;
int sh=0;
int od=0;



String mine=null;

String sql123="select count(*) from advanced_personal where music!='"+mine+"' ";
ResultSet rs123=st123.executeQuery(sql123);
while(rs123.next())
{
	 m=rs123.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!M :: "+m);

String sql1234="select count(*) from advanced_personal where sports!='"+mine+"' ";
ResultSet rs1234=st123.executeQuery(sql1234);
while(rs1234.next())
{
	 sp=rs1234.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SPORTS :: "+sp);

String sql12345="select count(*) from advanced_personal where travel!='"+mine+"' ";
ResultSet rs12345=st123.executeQuery(sql12345);
while(rs12345.next())
{
	 tr=rs12345.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! TRAVEL :: "+tr);

String sql123456="select count(*) from advanced_personal where tv_shows!='"+mine+"' ";
ResultSet rs123456=st123.executeQuery(sql123456);
while(rs123456.next())
{
	 tv=rs123456.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! TV SHOWS :: "+tv);


String sql1234567="select count(*) from advanced_personal where languages!='"+mine+"' ";
ResultSet rs1234567=st123.executeQuery(sql1234567);
while(rs1234567.next())
{
	 l=rs1234567.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! LANGUAGES  :: "+l);


String sql12345678="select count(*) from advanced_personal where gadgets!='"+mine+"' ";
ResultSet rs12345678=st123.executeQuery(sql12345678);
while(rs12345678.next())
{
	 gd=rs12345678.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! GADGETS  :: "+gd);


String sql123456789="select count(*) from advanced_personal where books!='"+mine+"' ";
ResultSet rs123456789=st123.executeQuery(sql123456789);
while(rs123456789.next())
{
	 bk=rs123456789.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! BOOKS  :: "+bk);

String sql234="select count(*) from advanced_personal where shopping!='"+mine+"' ";
ResultSet rs234=st123.executeQuery(sql234);
while(rs234.next())
{
	 sh=rs234.getInt("count(*)");
}
System.out.println("NEW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SHOPPING  :: "+sh);






















//-----------------------------------
//System.out.println("categorystring= "+interest123);
String s=interest123;
System.out.println("s= "+s);
String y="";
String[] result=s.split(",");
System.out.println("after splitting s= "+s);
System.out.println("result = "+result);
int count123=0;
for (int x=0; x<result.length; x++) 
{
	y=result[x];
	System.out.println("y ="+y);
	count123++;

//----------------------------------------

if(y.equals("Sports"))
{
	 interest="sports";
}
if(y.equals("Entertainment"))
{
	 interest="music";
}
if(y.equals("Entertainment"))
{
	 interest="tv_shows";
}
if(y.equals("Food"))
{
	 interest="shopping";
}
if(y.equals("Education"))
{
	 interest="books";
}
if(y.equals("Travel"))
{
	 interest="shopping";
}

//---------------------------
Statement st11=con.createStatement();
//int females=0;
String sql11="select count(*)from basic_info where gender='female'";
ResultSet rs11=st11.executeQuery(sql11);
while(rs11.next())
{
	 females=rs11.getInt(1);
}

System.out.println("females = "+females);


Statement st22=con.createStatement();
//int males=0;
String sql22="select count(*)from basic_info where gender='male'";
ResultSet rs22=st22.executeQuery(sql22);
while(rs22.next())
{
	 males=rs22.getInt(1);
}

System.out.println("males = "+males);






//-----------------------------
/*
//IF A GIRL THEN COMPULSORILY COSMETICS AVADLACH PAHIJE TILA!
if(gender.equals("Female"))
{
	 interest="cosmetics";
}
*/

if(y.equals("Business and Technology"))
{
	 interest="gadgets";
}
/*
IF BOY THEN COMPULSORILY AVADLACH PAHIJE!!!!!

if(y.equals("Automobiles"))
{
	 interest="sports";
}

*/

if(y.equals("Electronics"))
{
	 interest="gadgets";
}
/*
if(y.equals("Others"))
{
	 interest="other interests";
}

*/
String a = interest;


//---------------

ResultSet rs=st1.executeQuery("select * from advanced_personal");
//String foo = null;
//if( foo ==null) 
//{
	//System.out.println("foo is null!");
//}


while(rs.next())
{
//   System.out.println("String a is equal to String b");
   
   
	   if (a.equals(b)) 
       {
	   String getmusic=rs.getString("music");
	   System.out.println("music = "+getmusic);
	   if(getmusic==null)
	   		{
		
	   		}
	   else
	   		{
		   count++;
	   		}
	   
	
   		} //end of outer if
   		
	   if (a.equals(c)) 
   		{
	   String getlanguages=rs.getString("languages");
	   System.out.println("language = "+getlanguages);
	   if(getlanguages==null)
	   		{
		
	   		}
	   else
	   		{
		   count1++;
	   		}
	   	  
	
   		}  //end of outer 2nd if
   		
   		
	   if (a.equals(d)) 
   {
	   String gettv=rs.getString("tv_shows");
	   System.out.println("tv shows  = "+gettv);
	   if(gettv==null)
	   {
		
	   }
	   else
	   {
		   count2++;
	   }
	  
	
   }  //end of outer 3rd if
   
   
   
	   if (a.equals(e)) 
   {
	   String gettravel=rs.getString("travel");
	   System.out.println("travel = "+gettravel);
	   if(gettravel==null)
	   {
		
	   }
	   else
	   {
		   count3++;
	   }
	  
	
   }  //end of outer 4th if

   
   
   

if (a.equals(f)) 
{
String getsports=rs.getString("sports");
System.out.println("sports = "+getsports);
if(getsports==null)
{

}
else
{
   count4++;
}


}  //end of 5th outer if



if (a.equals(g)) 
{
String getgadgets=rs.getString("gadgets");
System.out.println("gadgets = "+getgadgets);
if(getgadgets==null)
{

}
else
{
   count5++;
}


}  //end of 6th outer if
  
if (a.equals(h)) 
{
String getbooks=rs.getString("books");
System.out.println("books = "+getbooks);
if(getbooks==null)
{

}
else
{
   count6++;
}


}  //end of outer 7th if
 

if (a.equals(i1)) 
{
String getshopping=rs.getString("shopping");
System.out.println("shopping = "+getshopping);
if(getshopping==null)
{

}
else
{
   count7++;
}


}   //end of outer 8th if


}  //end of while

System.out.println("in counting users.jsp :: count7 = "+count7);
System.out.println("in counting users.jsp :: count7 = "+count6);
System.out.println("in counting users.jsp :: count7 = "+count5);
System.out.println("in counting users.jsp :: count7 = "+count4);
System.out.println("in counting users.jsp :: count7 = "+count3);
System.out.println("in counting users.jsp :: count7 = "+count2);
System.out.println("in counting users.jsp :: count7 = "+count1);
System.out.println("in counting users.jsp :: count7 = "+count);
System.out.println("in counting users.jsp :: count7 = "+males);
System.out.println("in counting users.jsp :: count7 = "+females);


session.setAttribute("count7", sh);
session.setAttribute("count6", bk);
session.setAttribute("count5", gd);
session.setAttribute("count4", sp);
session.setAttribute("count3", tr);
session.setAttribute("count2", tv);
session.setAttribute("count1", l);
session.setAttribute("count", m);
session.setAttribute("males", males);
session.setAttribute("females", females);


} //end of for loop

%>

<% 
if(count7!=0)
{
	total_count=total_count+count7;
System.out.println("count for shopping lovers = "+count7);
		
}

%>

		<%
		if(count6!=0)
		{	total_count=total_count+count6;
			System.out.println("count for book lovers = "+count6);
			
		}
		
%>

<%
if(count5!=0)
{
	total_count=total_count+count5;
System.out.println("count for gadgets lovers = "+count5);

}

%>

<%
if(count4!=0)
{
	total_count=total_count+count4;
System.out.println("count for sports lovers = "+count4);

}

%>

<%
if(count3!=0)
{
	total_count=total_count+count3;
System.out.println("count for travel lovers = "+count3);

}

%>

<%
if(count2!=0)
{
	total_count=total_count+count2;
System.out.println("count for tv show lovers = "+count2);

}

%>

<%
if(count1!=0)
{
	total_count=total_count+count1;
System.out.println("count for lang users = "+count1);

}

%>
<br> </br>
<%
if(count!=0)
{
	total_count=total_count+count;
System.out.println("count for music users = "+count);

}


if(males!=0)
{
	total_count=total_count+males;
System.out.println("count for automobile users = "+males);

}

%>

<br> </br>
<% 
if(females!=0)
{
	total_count=total_count+females;
System.out.println("count for cosmetic users = "+females);

}

//------------------------------------------------------------------



%>
<br> 
<br>
<br>
<label>YOUR AD COULD BE POTENTIALLY VIEWED BY THESE MANY NUMBER OF USERS :: <%=total_count+500%> </label>                                          </label>


</body>
</html>


<%
System.out.println("in a.jsp!!!");
//String i=session.getAttribute("i").toString();

String counta7=session.getAttribute("count7").toString();
String counta6=session.getAttribute("count6").toString();
String counta5=session.getAttribute("count5").toString();
String counta4=session.getAttribute("count4").toString();
String counta3=session.getAttribute("count3").toString();
String counta2=session.getAttribute("count2").toString();
String counta1=session.getAttribute("count1").toString();
String counta=session.getAttribute("count").toString();
String malesa=session.getAttribute("males").toString();
String femalesa=session.getAttribute("females").toString();

System.out.println("count7 = "+counta7);
System.out.println("count7 = "+counta6);
System.out.println("count7 = "+counta5);
System.out.println("count7 = "+counta4);
System.out.println("count7 = "+counta3);
System.out.println("count7 = "+counta2);
System.out.println("count7 = "+counta1);
System.out.println("count7 = "+counta);
System.out.println("count7 = "+malesa);
System.out.println("count7 = "+femalesa);

//System.out.println("i  :"+i);
//double i=double.;
//Double.parseDouble

//String string_to_double="1234.8973737373";

        double db7=Double.parseDouble(counta7);
        System.out.println("Type cast string to double :"+db7);
        
        double db6=Double.parseDouble(counta6);
        System.out.println("Type cast string to double :"+db6);
        
        double db5=Double.parseDouble(counta5);
        System.out.println("Type cast string to double :"+db5);

        double db4=Double.parseDouble(counta4);
        System.out.println("Type cast string to double :"+db4);
        
        double db3=Double.parseDouble(counta3);
        System.out.println("Type cast string to double :"+db3);

        double db2=Double.parseDouble(counta2);
        System.out.println("Type cast string to double :"+db2);

        double db1=Double.parseDouble(counta1);
        System.out.println("Type cast string to double :"+db1);
        
        double db=Double.parseDouble(counta);
        System.out.println("Type cast string to double :"+db);

        double dbmales=Double.parseDouble(malesa);
        System.out.println("Type cast string to double :"+dbmales);

        double dbfemales=Double.parseDouble(femalesa);
        System.out.println("Type cast string to double :"+dbfemales);


%>

<script src="http://code.jquery.com/jquery-1.6.3.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="http://code.highcharts.com/modules/exporting.js"></script>

<script type="text/javascript">
$(document).ready(function () {    
           
            RenderPieChart('container', [
                      ['SHOPPING', <%=db7%>],
                      ['BOOKS', <%=db6%>],
                      ['GADGETS',  <%=db5%>],                         
                      ['SPORTS', <%=db4%>],
                      ['TRAVEL', <%=db3%>],
                      ['TV SHOWS', <%=db2%>],
                      ['LANGUAGE', <%=db1%>],
                      ['MUSIC', <%=db%>],
                      ['AUTOMOBILE', <%=dbmales%>],
                      ['COSMETICS', <%=dbfemales%>]
                  ]);     
     
     $('#btnPieChart').live('click', function(){ 
         var data = [
                      ['SHOPPING', <%=db7%>],
                      ['BOOKS', <%=db6%>],
                      {
                          name: 'BOOKS',
                          y: 14.8,
                          sliced: true,
                          selected: true
                      },
                      ['GADGETS',  <%=db5%>],                         
                      ['SPORTS', <%=db4%>],
                      ['SPORTS', <%=db3%>],
                      ['TV SHOWS', <%=db2%>],
                      ['LANGUAGES', <%=db1%>],
                      ['MUSIC', <%=db%>],
                      ['AUTOMOBILES', <%=dbmales%>],
                      ['COSMETICS', <%=dbfemales%>]
                      
                  ];
             
            RenderPieChart('container', data);
     });
     
            function RenderPieChart(elementId, dataList) {
                new Highcharts.Chart({
                    chart: {
                        renderTo: elementId,
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false
                    }, title: {
                        text: 'Browser market shares at a specific website, 2010'
                    },
                    tooltip: {
                        formatter: function () {
                            return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
                        }
                    },
                    plotOptions: {
                        pie: {
                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                color: '#000000',
                                connectorColor: '#000000',
                                formatter: function () {
                                    return '<b>' + this.point.name + '</b>: ' + this.percentage + ' %';
                                }
                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Browser share',
                        data: dataList
                    }]
                });
            };
        });







</script>
    

<body>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
  <input type="button" id="btnPieChart" value="REFRESH PIE CHART" />

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
