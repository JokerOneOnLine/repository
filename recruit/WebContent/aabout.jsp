<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
	<head>
		<title>关于我们</title>
		<link href="style/css/style2.css" rel="stylesheet" type="text/css" media="all" />
		<link href="style/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
		<!-- web-font -->
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
		<link href='http://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<!-- web-font -->
		<!-- js -->
		<script src="style/js/jquery.min.js"></script>
		<script src="style/js/modernizr.custom.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<!-- js -->
		<script src="style/js/modernizr.custom.js"></script>
		<!-- start-smoth-scrolling -->
		<script type="text/javascript" src="style/js/move-top.js"></script>
		<script type="text/javascript" src="style/js/easing.js"></script>
		<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
				});
			});
		</script>
		<!-- start-smoth-scrolling -->
	</head>
	<body>
		<div class="head-bg green">
			<!-- container -->
			<div class="container">
				<div class="head-logo">
					<a href="index.html"><img src="images/logo1.png" alt="" /></a>
				</div>
				<div class="top-nav">
						<span class="menu"><img src="images/menu.png" alt=""></span>
							<ul class="cl-effect-1">
								<li><a href="welcome.jsp">首页</a></li>
								<li><a href="user/redirectPosition.jsp">职位</a></li>
								<li><a href="index.jsp">公司</a></li>
								<li><a href="userlogin.jsp" rel="nofollow">个人用户登录</a></li>
								<li><a href="companyLogin.jsp" rel="nofollow">企业用户登录</a></li>
								<li><a href="register.jsp" rel="nofollow">用户注册</a></li>
								<li><a href="aabout.jsp">关于我们</a></li>
							</ul>
							<!-- script-for-menu -->
							 <script>
							   $( "span.menu" ).click(function() {
								 $( "ul.cl-effect-1" ).slideToggle( 300, function() {
								 // Animation complete.
								  });
								 });
							</script>
						<!-- /script-for-menu -->
					</div>
				<div class="clearfix"> </div>
			</div>
			<!-- //container -->
			</div>
			<!-- about -->
			<div class="about">
				<!-- container -->
				<div class="container">
					<div class="about-info">
						<h3>关于我们</h3>
						<h4>我们来自蓝桥软件学院渭南师范二期
						</h4>
						<p>我们是一群有理想有追求的青年，也许我们目前技术还不到位，也许 <br>
						        第一杯酒敬你，所谓不合适就是你喜欢清风醉酒，我却独爱烈风自由。<br>
						        第二杯酒敬你，岁月里你很干净，比水淡，比酒清。<br>
						        第三杯酒敬你，黄昏时偷来你的肋骨酿酒，百年后醉的有血有肉。<br>
						        第四杯敬你，晚风路过陶坛吹过的酒香，我记得你所有模样。</p>
					</div>
				</div>
				<!-- //container -->
			</div>
			<!-- about -->
			<!-- about-banner -->
			<div class="about-banner">
				<div class="banner-bg">
					<h3>WE OFFER!</h3>
					<div class="read-more">
						<a href="#">SEE THE TOUR</a>
					</div>
				</div>
			</div>
			<!-- about-banner -->
			<!-- team -->
			<div class="team">
				<!-- container -->
				<div class="container">
					<div class="team-info">
						<h3>我们的团队</h3>
					</div>
					<div class="team-grids">
						<div class="team-grid">
							<img src="style/images/zjh.jpg" alt="" />
							<div class="team-grid-info">
								<h4>张金浩</h4>
								<p>大帅哥一个！！！
								</p>
							</div>
						</div>
						<div class="team-grid">
							<img src="style/images/c8.jpg" alt="" />
							<div class="team-grid-info">
								<h4>大胖</h4>
								<p>Class aptent taciti sociosqu ad litora torquent per conu-
									bia nostra, per inceptos himenaeos.
								</p>
							</div>
						</div>
						<div class="team-grid">
							<img src="style/images/004.png" alt="" />
							<div class="team-grid-info">
								<h4>小胖</h4>
								<p>Class aptent taciti sociosqu ad litora torquent per conu-
									bia nostra, per inceptos himenaeos.
								</p>
							</div>
						</div>
						<div class="team-grid">
							<img src="style/images/wx.jpg" alt="" />
							<div class="team-grid-info">
								<h4>三胖</h4>
								<p>Class aptent taciti sociosqu ad litora torquent per conu-
									bia nostra, per inceptos himenaeos.
								</p>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
				<!-- container -->
			</div>
			<!-- //team -->
			<!-- footer -->
			<!-- <div class="footer">
				container
				<div class="container">
					<div class="footer-left">
						<p>Design by <a href="http://w3layouts.com/">W3layouts</a></p>
					</div>
					<div class="footer-right">
						<div class="footer-nav">
							<ul>
								<li><a href="index.html">HOME</a></li>                                                  
								<li><a href="about.html">ABOUT</a></li>  
								<li><a href="booking.html">BOOKING</a></li>  
								<li><a href="news.html">NEWS</a></li>  
								<li><a href="mail.html">MAIL US</a></li>  
							</ul>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
				//container
			</div>
			//footer
		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
									<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a> -->
	<!-- content-Get-in-touch -->
	</body>
</html>
