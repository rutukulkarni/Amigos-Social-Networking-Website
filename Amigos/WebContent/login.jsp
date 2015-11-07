<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
		<title>Amigos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Pretty Simple Content Slider with jQuery and CSS3" />
        <meta name="keywords" content="jquery,css3, content slider, slide, auto-play"/>
        <link rel="stylesheet" href="css/slider_style.css" type="text/css" media="screen"/>
        <meta name="keywords" content="" />
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" /> 
<link rel=”shortcut icon” href=”/favicon.ico” type=”image/x-icon” />
<link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    
    <link rel="shortcut icon" href="images/favicon.ico" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
        
        
        <style>
            *{
                margin:0;
                padding:0;
            }
            body{
                font-family:Arial;

            }
            a.back{

                position:fixed;
                width:150px;
                height:27px;
                outline:none;
                bottom:0px;
                left:0px;
            }
            #content{
                margin:10px auto;
                float:left;
                width:100px;
            }
            .reference{
                clear:both;
                width:800px;
                margin:30px auto;
            }
            .reference p a{
                text-transform:uppercase;
                text-shadow:1px 1px 1px #fff;
                color:#666;
                text-decoration:none;
                font-size:10px;
            }
            .reference p a:hover{
                color:#333;
            }
        </style>
        
        
        
        <script type="text/javascript">
		var defaultHref = 0;
		function forgotPwd() {
			if (document.getElementById("username").value == "") {
				alert("Please enter username");
				return false;
                //window.location="login.jsp";
			}
			else {
						//alert("in else");
							document.getElementById("forgotAnchorId").href+= "?uname="+ document.getElementById("username").value;
							defaultHref = 1;
						  //	alert(document.getElementById("forgotAnchorId").href);
	              	//window.location.href="forgotPassword.jsp?uname="+document.getElementById("username").value;
             	return true;
    	    	 }
		}
	
    	function ad()
		{
    	//	alert("in ad function");
    		//alert("username = "+document.getElementById("username").value);
    		//alert("password = "+document.getElementById("pwd").value);
		if(document.getElementById("username").value=="admin") 
			{
				if(document.getElementById("pwd").value=="admin")
				{
				 window.location.href= "admin.jsp";
				 return false;
				}
			}
		else if(document.getElementById("username").value=="")
			{
			alert("Enter username!");
			return false;
			//window.location.href="login.jsp";
			}
		
		else
			{
			//alert("in else part!");
			var name=document.getElementById("username");
			var pwd=document.getElementById("pwd");
			//alert("name= "+name.value);
			//alert("pwd= "+pwd.value);
			window.location.href="check_login.jsp?username="+name.value+"&&pwd="+pwd.value;
			
			}
		
		}
	</script>




</head>
    <body onload="load();">
 <div id="page">
 <div id="page-bgtop">
<div id="page-bgbtm">
 <div id="post">   
  
<div id="menu-wrapper" style="height:80px">
	
<div id="logo p" style="float:left;">
			<h1><a href="home.jsp"><img src="images/Amigos.png" width=100px height=80px></img></a></h1> 
</div>

<div style="float:right; left:600px; width:1000px">
<center>
	<h1><font color="#F6B300" face="Elephanta" size="5em"><b>Amigos in news..</b></font></h1>
	</center>
	<a><marquee behaviour="alternate"><font color="#F6B300" face="Palatino Linotype" size="3em">Amigos.. launched in March 2013 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Amigos... Best companies to work with by S&P. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Amigos... over 1 billion users now.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </font></marquee></a>
</div>



</div>

 
		
	<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">
<div class="post" style="height:350px">
<br>
<br>

<div style="float: left;">


    
 <!-- slider code -->   
    
    
        <div id="content" height="400px">
            <a class="back" href=""></a>

            <div class="rotator" style="width:600px; height:300px" >
                <ul id="rotmenu">
                    <li>
                        <a href="rot1">Connect</a>
                        <div style="display:none;">
                            <div class="info_image">social-media.jpg</div>
                            <div class="info_heading">Connect Personally 
                            and Professionally..</div>
                            <div class="info_description">
                            
                            See whats up with friends, family<br>
							and anything you âre into.Now segregate your<br>
							personal and professional network..<br>
                             
                                <a href="help.jsp#find_friend" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="message.jsp">Messages</a>
                        <div style="display:none;">
                            <div class="info_image">messages.jpg</div>
                            <div class="info_heading">We serve</div>
                            <div class="info_description">
                            Send personal messages to your<br>
                            friends and achieve privacy.<br>
                            
				        <a href="help.jsp#messages" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot3">Business</a>
                        <div style="display:none;">
                            <div class="info_image">business.jpg</div>
                            <div class="info_heading">Advertise</div>
                            <div class="info_description">
                            Amigos promises you to view your <br>
                            ad to the user who is interested <br>
                            in it.Get maximum clicks and <br>
                            increase your revenue.
                            <a href="help.jsp#advertisements" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="">Media</a>
                        <div style="display:none;">
                            <div class="info_image">groups.jpg</div>
                            <div class="info_heading">We do crazy stuff</div>
                            <div class="info_description">
				 			Create your own group and share info to <br>
				 			number of people at a time...<br>
                                <a href="help.jsp#groups" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="Events.jsp">Events</a>
                        <div style="display:none;">
                            <div class="info_image">events.jpg</div>
                            <div class="info_heading"></div>
                            <div class="info_description">
                           Send Event invited to your friends<br>
                            and invite them ... <br>
                                <a href="help.jsp#events" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                </ul>
                <div id="rot1">
                    <img src="" width="800" height="300" class="bg" alt=""/>
                    <div class="heading">
                        <h1></h1>
                    </div>
                    <div class="description">
                        <p></p>

                    </div>    
                </div>
            </div>
        </div>
        <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
        <script type="text/javascript" src="jquery.easing.1.3.js"></script>
        <script type="text/javascript">
            $(function() {
                var current = 1;
                
                var iterate		= function(){
                    var i = parseInt(current+1);
                    var lis = $('#rotmenu').children('li').size();
                    if(i>lis) i = 1;
                    display($('#rotmenu li:nth-child('+i+')'));
                }
                display($('#rotmenu li:first'));
                var slidetime = setInterval(iterate,5000);
				
                $('#rotmenu li').bind('click',function(e){
                    clearTimeout(slidetime);
                    display($(this));
                    e.preventDefault();
                });
				
                function display(elem){
                    var $this 	= elem;
                    var repeat 	= false;
                    if(current == parseInt($this.index() + 1))
                        repeat = true;
					
                    if(!repeat)
                        $this.parent().find('li:nth-child('+current+') a').stop(true,true).animate({'marginRight':'-20px'},300,function(){
                            $(this).animate({'opacity':'0.7'},700);
                        });
					
                    current = parseInt($this.index() + 1);
					
                    var elem = $('a',$this);
                    
                        elem.stop(true,true).animate({'marginRight':'0px','opacity':'1.0'},300);
					
                    var info_elem = elem.next();
                    $('#rot1 .heading').animate({'left':'-420px'}, 500,'easeOutCirc',function(){
                        $('h1',$(this)).html(info_elem.find('.info_heading').html());
                        $(this).animate({'left':'0px'},400,'easeInOutQuad');
                    });
					
                    $('#rot1 .description').animate({'bottom':'-270px'},500,'easeOutCirc',function(){
                        $('p',$(this)).html(info_elem.find('.info_description').html());
                        $(this).animate({'bottom':'0px'},400,'easeInOutQuad');
                    })
                    $('#rot1').prepend(
                    $('<img/>',{
                        style	:	'opacity:0',
                        className : 'bg'
                    }).load(
                    function(){
                        $(this).animate({'opacity':'1'},600);
                        $('#rot1 img:first').next().animate({'opacity':'0'},700,function(){
                            $(this).remove();
                        });
                    }
                ).attr('src','images/'+info_elem.find('.info_image').html()).attr('width','800').attr('height','300')
                );
                }
            });
        </script>
    
    </div>
    
    <%
    
    %>
    
    
    
    
<form method=post action="check_login.jsp" onsubmit="return ad();">
        <%
    
        
        String error1=null;
        String uname_error=null;
        if(request.getParameter("uname")!=null)
        {
        //	 error1=session.getAttribute("error").toString();
        	uname_error=request.getParameter("unmae");
        }
        
        
        
        
        session.setAttribute("uname_available","available");
        session.setAttribute("flag","0");
        %>
    <input type="hidden" value=<%=uname_error %> id=error></input>
    <div style="float:right;left:1000px;background: #3E282A;width:300px;height:320px;" id="post">
<center>
	   <br>
	   
	   <br>
	   
	   
	   		<br>
	   		<br>
	   		<a><input type="text" name="username" id="username" placeholder="Username" style="border-radius: 5px;height:30px;width:200px;"> </a>
	   		<br>
	   		<br>
	   		<br></br>
	   		 <a><input type="password" name="pwd" id="pwd"  placeholder="Password" style="border-radius: 5px;height:30px;width:200px;"> </a>
				<br>
			
			
	<!-- ><input type="button" -->
	<br>
	<br>

			<%
			String uname=null;
			if(request.getParameter("uname")!=null)
			{
				uname=request.getParameter("uname");
			}
			%>
			<input type="hidden" id="uname" value=<%=uname %> ></input>
		<!-- <input type="button" id="button" value="LOGIN" class="button_up" onclick="return ad();" >
			 -->
<input type="submit" id="button" value="LOGIN" class="button_up">

			<br>
				<br>
				<br>
	
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="forgotPassword.jsp" id="forgotAnchorId"  style="text-decoration:underline; cursor:pointer; left:900px;  color: #F6B300; background-color:#3E282A;" border=none border-decoration=none onclick="return forgotPwd();"></input>Forgot Password?</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Sign_Up.jsp" style="text-decoration:underline; cursor:pointer; left:900px;  color: #F6B300; background-color:#3E282A;" border=none border-decoration=none>New User?</font></a>
			<br>
			<br>
			<br>
	
</center>
	</form>
    </div>
    
    </div>
   </div>

</div>
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