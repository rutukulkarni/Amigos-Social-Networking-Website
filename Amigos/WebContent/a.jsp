
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <link rel="shortcut icon" href="images/favicon.ico" />

<%
System.out.println("in a.jsp!!!");

if(session.getAttribute("uid")!=null) // session has not been invalidated yet or it still exists 
{ 
System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!SESSION OLD WALA!");

//String getname1 = session.getAttribute("name").toString();
//System.out.println("in prof.jsp getname1="+getname1);

//String i=session.getAttribute("i").toString();
String count7=session.getAttribute("count7").toString();
String count6=session.getAttribute("count6").toString();
String count5=session.getAttribute("count5").toString();
String count4=session.getAttribute("count4").toString();
String count3=session.getAttribute("count3").toString();
String count2=session.getAttribute("count2").toString();
String count1=session.getAttribute("count1").toString();
String count=session.getAttribute("count").toString();
String males=session.getAttribute("males").toString();
String females=session.getAttribute("females").toString();
System.out.println("count7 = "+count7);
System.out.println("count7 = "+count6);
System.out.println("count7 = "+count5);
System.out.println("count7 = "+count4);
System.out.println("count7 = "+count3);
System.out.println("count7 = "+count2);
System.out.println("count7 = "+count1);
System.out.println("count7 = "+count);
System.out.println("count7 = "+males);
System.out.println("count7 = "+females);
//System.out.println("i  :"+i);
//double i=double.;
//Double.parseDouble

//String string_to_double="1234.8973737373";

        double db7=Double.parseDouble(count7);
        System.out.println("Type cast string to double :"+db7);
        
        double db6=Double.parseDouble(count6);
        System.out.println("Type cast string to double :"+db6);
        
        double db5=Double.parseDouble(count5);
        System.out.println("Type cast string to double :"+db5);

        double db4=Double.parseDouble(count4);
        System.out.println("Type cast string to double :"+db4);
        
        double db3=Double.parseDouble(count3);
        System.out.println("Type cast string to double :"+db3);

        double db2=Double.parseDouble(count2);
        System.out.println("Type cast string to double :"+db2);

        double db1=Double.parseDouble(count1);
        System.out.println("Type cast string to double :"+db1);
        
        double db=Double.parseDouble(count);
        System.out.println("Type cast string to double :"+db);

        double dbmales=Double.parseDouble(males);
        System.out.println("Type cast string to double :"+dbmales);

        double dbfemales=Double.parseDouble(females);
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

<%

} // end of session wala if

else
{
	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! SESSION NEW WALA!");
	response.sendRedirect("login.jsp");
} // end of session wala else








%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
  <input type="button" id="btnPieChart" value="Pie Chart" />

<form action="Payment.jsp" method="POST">
<input type="submit" value="GO TO PAYMENT">
</form>

</body>
</html>