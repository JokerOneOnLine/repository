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
<title>Welcome to lanqiao</title>
<link href="style/css/style2.css" rel="stylesheet" type="text/css" media="all" />
<link href="style/css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all">
<!-- web-font -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Playball'
	rel='stylesheet' type='text/css'>
<!-- web-font -->
<!-- js -->
<script src="style/js/jquery.min.js"></script>
<script src="style/js/modernizr.custom.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript">addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<!-- js -->
<script src="style/js/modernizr.custom.js"></script>
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="style/js/move-top.js"></script>
<script type="text/javascript" src="style/js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!-- start-smoth-scrolling -->
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="head-bg">
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
						$("span.menu").click(function() {
							$("ul.cl-effect-1").slideToggle(300, function() {
								// Animation complete.
							});
						});
					</script>
					<!-- /script-for-menu -->
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- //container -->
		</div>
		<!-- container -->
		<div class="container">
			<!-- banner Slider starts Here -->
			<script src="js/responsiveslides.min.js"></script>
			<script>
				// You can also use "$(window).load(function() {"
				$(function() {
					// Slideshow 4
					$("#slider3").responsiveSlides({
						auto : true,
						pager : false,
						nav : false,
						speed : 500,
						namespace : "callbacks",
						before : function() {
							$('.events').append("<li>before event fired.</li>");
						},
						after : function() {
							$('.events').append("<li>after event fired.</li>");
						}
					});
			
				});
			</script>
			<!--//End-slider-script -->
			<div id="top" class="callbacks_container">
				<ul class="rslides" id="slider3">
					<li>
						<div class="head-info">
							<h1>
								欢迎来到蓝桥招聘网<span>连接人才与社会</span>
							</h1>
							<h3><span>己欲立而立人，己欲达而达人</span></h3>
						</div>
					</li>
				<!-- 	<li>
						<div class="head-info">
							<h1>
								Aenean suscipit<span>Suspendisse venenatis volutpat </span>
							</h1>
							<p>Morbi id felis porttitor tellus viverra pulvinar.
								Vestibulum</p>
						</div>
					</li>
					<li>
						<div class="head-info">
							<h1>
								这是啥<span>啦啦啦啦啦啦啦</span>
							</h1>
							<p>啊啊啊啊啊啊啊啊啊啊啊啊</p>
						</div>
					</li> -->
				</ul>
			</div>

		</div>
		<!-- container -->
	</div>
	<!-- //header -->
	<!-- banner-grids -->
	<div class="banner-grids">
		<!-- container -->
		<div class="container">
			<div class="banner-grid-info">
				<h3>热门职位</h3>
				<p>选择最热门的职位</p>
			</div>
			<div class="top-grids">
				<div class="top-grid">
					<img src="images/6.jpg" alt="" />
					<div class="top-grid-info">
						<h3>呜呜呜呜呜呜</h3>
						<p>呜呜呜呜呜呜</p>
					</div>
				</div>
				<div class="top-grid">
					<img src="images/3.jpg" alt="" />
					<div class="top-grid-info">
						<h3>哈哈哈哈哈哈哈哈</h3>
						<p>哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈</p>
					</div>
				</div>
				<div class="top-grid">
					<img src="images/2.jpg" alt="" />
					<div class="top-grid-info">
						<h3>哦哦哦哦哦哦</h3>
						<p>哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦哦</p>
					</div>
				</div>
				<div class="top-grid">
					<img src="images/4.jpg" alt="" />
					<div class="top-grid-info">
						<h3>333333333333r</h3>
						<p>333333333333333r333333333333r</p>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-grids -->
	<!-- before -->
	<div class="before">
		<!-- container -->
		<div class="container">
			<h2>在您离开该页面之前</h2>
			<div class="before-grids">
				<div class="before-grid">
					<h3>感谢您来到这里</h3>
					<p>在这里您可以找到逞心如意的工作</p>
				</div>
				<div class="before-grid">
					<h3>希望我们的工作让您满意</h3>
					<p>我们衷心希望您能找到满意的工作</p>
				</div>
				<div class="before-grid">
					<h3>我们的团队</h3>
					<p>我们的团队目前还很弱小，但是我们会一直努力.同时我们也欢迎您的家人，希望您能和我们一起努力。</p>
				</div>
				<div class="clearfix"></div>
				<div class="search">
					<p>请留下您的邮箱用来订阅我们最新的资讯</p>
					<form>
						<input type="text" placeholder="请输入您的邮箱" required> <input
							type="submit" value="提交">
					</form>
				</div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //before -->
	<!-- footer -->
<!-- 	<div class="footer">
		container
		<div class="container">
			<div class="footer-left">
				<p>
					Design by <a href="http://w3layouts.com/">W3layouts</a>
				</p>
			</div>
			<div class="footer-right">
				<div class="footer-nav">
					<ul>
						<li><a href="index.html">首页</a></li>
						<li><a href="about.html">个人登录</a></li>
						<li><a href="booking.html">企业登录</a></li>
						<li><a href="news.html">用户注册</a></li>
						<li><a href="mail.html">关于我们</a></li>
					</ul>
				</div>
			</div>
			<div class="clearfix"></div>
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
	
			$().UItoTop({
				easingType : 'easeOutQuart'
			});
	
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a> -->
	<!-- content-Get-in-touch -->
</body>
</html>
