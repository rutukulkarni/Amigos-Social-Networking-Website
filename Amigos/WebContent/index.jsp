<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
		<title>Amigos Login Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Pretty Simple Content Slider with jQuery and CSS3" />
        <meta name="keywords" content="jquery,css3, content slider, slide, auto-play"/>
        <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
        <meta name="keywords" content="" />
<link href="http://fonts.googleapis.com/css?family=Arvo|Open+Sans:400,300,700" rel="stylesheet" type="text/css" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" /> 

<link rel="stylesheet" href="jquery-ui-1.9.2.custom.css" />
    <script src="jq1.js"></script>
    <script src="jq2.js"></script>
        
        
        <style>
            *{
                margin:0;
                padding:0;
            }
            body{
                font-family:Arial;
                background:#C1C7D5 url(title.png) no-repeat top center;
            }
            a.back{
                background:transparent url(back.png) no-repeat top left;
                position:fixed;
                width:150px;
                height:27px;
                outline:none;
                bottom:0px;
                left:0px;
            }
            #content{
                margin:150px auto 10px auto;
                float:left;
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
                window.location="/ForgotPassword/login.jsp";
			}
			else {
						{ 
							document.getElementById("forgotAnchorId").href+= "?uname="+ document.getElementById("username").value;
							defaultHref = 1;
						}
				  	//alert(document.getElementById("forgotAnchorId").href);
	              	window.location.href="forgotPassword.jsp?uname="+document.getElementById("username").value;
    	    	 }
		}
	
    	function ad()
		{
		if(document.getElementById("username").value=="admin") 
			{
				if(document.getElementById("pwd").value=="admin")
				{
				 window.location.href= "admin.jsp";	
				}
			}
		else
			{
			//alert("in else part!");
			var name=document.getElementById("username");
			var pwd=document.getElementById("pwd");
			//alert("name= "+name.value);
			//alert("pwd= "+pwd.value);
			window.location.href="check_login.jsp?name="+name.value+"&&pwd="+pwd.value;
			
			}
		}
	</script>
        
        
        
    </head>
    <body>
    
    
	<div id="menu-wrapper" style="height:150px">
	
	<div id="logo p">
				<h1><a href="home.jsp"><span>AMIGOS...</span></a></h1>

</div>
	<div style="font-size:18px;color: white;position:absolute; top:50px; left:700px;width:800px;height:75px">
	   		<a> Username: <input type="text" name="username" id="username"> </a>
			 <a>Password: <input type="password" name="pwd" id="pwd"> </a>
			<input type="button" id="button" value="LOGIN" class="button_up" onclick="ad();" >
	</br>
			&nbsp;&nbsp;&nbsp;<a><input type="button"  value="Forgot Password" id="forgotAnchorId"  style="background:none; text-decoration:underline; color:blue; cursor:pointer left:900px" border=0 onclick="forgotPwd(); "> </a>
	</input>
	</div>
	<a href="Sign_Up.jsp"><font color="#ffffffh">SIGNUP</font></a>

	</div>
	
	<div id="wrapper">
 <div id="page">
 
 <div id="page-bgtop">
<div id="page-bgbtm">
    
    
    
    
        <div id="content">
            <a class="back" href=""></a>

            <div class="rotator">
                <ul id="rotmenu">
                    <li>
                        <a href="rot1">Connect</a>
                        <div style="display:none;">
                            <div class="info_image">1.jpg</div>
                            <div class="info_heading">Connect Personally and Professionally..</div>
                            <div class="info_description">
                            
                            See what’s up with friends, family
							and anything you’re into.
                            Now segregate your personal and professional network and the show 
                            your information accordingly...
                             
                                <a href="#" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot2">Messages</a>
                        <div style="display:none;">
                            <div class="info_image">2.jpg</div>
                            <div class="info_heading">We serve</div>
                            <div class="info_description">
                            Send personal messages to your friends and achieve privacy.
                            
				        <a href="#" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot3">Business</a>
                        <div style="display:none;">
                            <div class="info_image">3.jpg</div>
                            <div class="info_heading">Advertise</div>
                            <div class="info_description">
                            Amigos promises you to view your ad to the user who is intereested in it.
                            Thus you can get maximum clicks and increase your revenue.
                            Now make profit... on AMIGOS!!!...
                                <a href="#" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot4">Groups</a>
                        <div style="display:none;">
                            <div class="info_image">4.jpg</div>
                            <div class="info_heading">We do crazy stuff</div>
                            <div class="info_description">
				 Create your own group and share info to number of people at a time...
                                <a href="#" class="more">Read more</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="rot5">Applications</a>
                        <div style="display:none;">
                            <div class="info_image">5.jpg</div>
                            <div class="info_heading">Working things</div>
                            <div class="info_description">
                                At vero eos et accusamus et iusto odio
				dignissimos ducimus qui blanditiis praesentium 
				voluptatum deleniti atque corrupti quos dolores et 
				quas molestias excepturi sint occaecati cupiditate 
				non provident... 
                                <a href="#" class="more">Read more</a>
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
        <div class="reference">
            <p><a href="http://www.flickr.com/photos/jrparis/106493273/">1 http://www.flickr.com/photos/jrparis/106493273/</a></p>
            <p><a href="http://www.flickr.com/photos/aussiegall/2104652119/">2 http://www.flickr.com/photos/aussiegall/2104652119/</a></p>
            <p><a href="http://www.flickr.com/photos/intherough/4396089594/">3 http://www.flickr.com/photos/intherough/4396089594/</a></p>
            <p><a href="http://www.flickr.com/photos/lightknight/628680053/">4 http://www.flickr.com/photos/lightknight/628680053/</a></p>
            <p><a href="http://www.flickr.com/photos/nguyendai/404631197/">5 http://www.flickr.com/photos/nguyendai/404631197/</a></p>
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
                var slidetime = setInterval(iterate,3000);
				
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
    </div>
    </div>
    </div>
    
    
    </body>
</html>