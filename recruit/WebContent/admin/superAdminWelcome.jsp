<%@ page language="Java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>标题</title>
<link href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css" title="" rel="stylesheet" />
<link title="" href="style/admin/css/style.css" rel="stylesheet" type="text/css"  />
<link title="blue" href="style/admin/css/dermadefault.css" rel="stylesheet" type="text/css"/>
<link title="green" href="style/admin/css/dermagreen.css" rel="stylesheet" type="text/css" disabled="disabled"/>
<link title="orange" href="style/admin/css/dermaorange.css" rel="stylesheet" type="text/css" disabled="disabled"/>
<link href="style/admin/css/templatecss.css" rel="stylesheet" title="" type="text/css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script src="style/admin/script/jquery.cookie.js" type="text/javascript"></script>
<script src="style/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand mystyle-brand"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
			<li style="margin-left: 500px;font-size: 30px;margin-top: 15px">欢迎管理员登录！</li>
			</ul>

			<ul class="nav navbar-nav pull-right">
				<li class="dropdown li-border"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown">946342191<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">退出</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown">换肤<span
						class="caret"></span></a>
					<ul class="dropdown-menu changecolor">
						<li id="blue"><a href="#">蓝色</a></li>
						<li class="divider"></li>
						<li id="green"><a href="#">绿色</a></li>
						<li class="divider"></li>
						<li id="orange"><a href="#">橙色</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="down-main">
		<div class="left-main left-off">
			<div class="sidebar-fold">
				<span class="glyphicon glyphicon-menu-hamburger"></span>
			</div>
			<div class="subNavBox">
				<div class="sBox">
					<div class="subNav sublist-down">
						<span class="title-icon glyphicon glyphicon-chevron-down"></span><span
							class="sublist-title">用户中心</span>
					</div>
					<ul class="navContent" style="display: block">
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />账号管理
							</div> <a href="userInfo.html"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">账号管理</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />消息中心
							</div> <a href="message.html"><span
								class="sublist-icon glyphicon glyphicon-envelope"></span><span
								class="sub-title">消息中心</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />短信
							</div> <a href="smsInfo.html"><span
								class="sublist-icon glyphicon glyphicon-bullhorn"></span><span
								class="sub-title">短信</span></a>
						</li>
						<li class="active">
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />实名认证
							</div> <a href="identify.html"><span
								class="sublist-icon glyphicon glyphicon-credit-card"></span><span
								class="sub-title">实名认证</span></a>
						</li>
					</ul>
				</div>
				<div class="sBox">
					<div class="subNav sublist-up">
						<span class="title-icon glyphicon glyphicon-chevron-up"></span><span
							class="sublist-title">关于我们</span>
					</div>
					<ul class="navContent" style="display: none">
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />添加新闻
							</div> <a href="#"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">添加新闻</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />添加新闻
							</div> <a href="#"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">新闻管理</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />添加新闻
							</div> <a href="#"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">添加新闻</span></a>
						</li>
						<li>
							<div class="showtitle" style="width: 100px;">
								<img src="img/leftimg.png" />新闻管理
							</div> <a href="#"><span
								class="sublist-icon glyphicon glyphicon-user"></span><span
								class="sub-title">新闻管理</span></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right-product view-product right-off">
			<div class="container-fluid">
				<div class="info-center">
					<div class="page-header">
						<div class="pull-left">
							<h4>实名认证</h4>
						</div>
					</div>
					<div class="indentify-class padding-lr">
						<p class="margin-big-tb text-sub text-default">
							请选择认证类型，个人认证后续可升级为企业认证，企业认证一旦认证成功，无法变更为个人认证</p>
						<ul class="class-content">
							<li class="pull-left margin-large-35"><a
								class="class-detail pull-right " href="#">
									<div class="class-detail-top">
										<div class="text-center indentify-icon">
											<img src="img/identify_personal.png">
										</div>
										<h3 class="text-center">个人认证</h3>
										<p class="margin-tb padding-bottom text-justify info">
											用于个人或个体经营户认证，认证通过可获得短信模板自定义及认证用户特权</p>
										<ul class="class-detail-has margin-top text-lh-big">
											<li><span class="text-black-gray">自定义短信条数</span> <span
												class="pull-right text-gray-white">5条</span></li>
											<li><span class="text-black-gray">云市场认证优惠</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">个人认证勋章</span> <span
												class="pull-right text-gray-white">有</span></li>
										</ul>
									</div>
									<p class="continue text-big">选择并继续使用</p>
							</a></li>
							<li class="pull-left margin-large-35"><a
								class="class-detail pull-right " href="#">
									<div class="class-detail-top">
										<div class="text-center indentify-icon">
											<img src="img/identify_enterprise.png">
										</div>
										<h3 class="text-center">企业认证</h3>
										<p class="margin-tb padding-bottom text-justify info">
											用于企事业单位认证，认证通过可获得短信模板自定义及认证用户特权</p>
										<ul class="class-detail-has margin-top text-lh-big">
											<li><span class="text-black-gray">自定义短信条数</span> <span
												class="pull-right text-gray-white">10条</span></li>
											<li><span class="text-black-gray">云市场认证优惠</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">企业认证勋章</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">免费400电话(含800元话费)</span>
												<span class="pull-right text-gray-white">有</span></li>
										</ul>
									</div>
									<p class="continue text-big">选择并继续使用</p>
							</a></li>
							<li class="pull-left"><a
								class="class-detail pull-right disabled" href="#">
									<div class="class-detail-top">
										<div class="text-center indentify-icon">
											<img src="img/identify_developer.png">
										</div>
										<h3 class="text-center">服务商认证</h3>
										<p class="margin-tb padding-bottom text-justify info">
											服务商认证需先通过个人或企业认证，认证服务商可以入驻云市场，通过某某云市场销售获得报酬</p>
										<ul class="class-detail-has margin-top text-lh-big">
											<li><span class="text-black-gray">服务商认证勋章</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">云市场插件销售</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">云市场模板销售</span> <span
												class="pull-right text-gray-white">有</span></li>
											<li><span class="text-black-gray">云市场模块销售</span> <span
												class="pull-right text-gray-white">有</span></li>
										</ul>
									</div>
									<p class="continue text-big">即将推出</p>
							</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			/*换肤*/
			$(".dropdown .changecolor li").click(function() {
				var style = $(this).attr("id");
				$("link[title!='']").attr("disabled", "disabled");
				$("link[title='" + style + "']").removeAttr("disabled");

				$.cookie('mystyle', style, {
					expires : 7
				}); // 存储一个带7天期限的 cookie 
			})
			var cookie_style = $.cookie("mystyle");
			if (cookie_style != null) {
				$("link[title!='']").attr("disabled", "disabled");
				$("link[title='" + cookie_style + "']").removeAttr("disabled");
			}
			/*左侧导航栏显示隐藏功能*/
			$(".subNav")
					.click(
							function() {
								/*显示*/
								if ($(this).find("span:first-child").attr(
										'class') == "title-icon glyphicon glyphicon-chevron-down") {
									$(this).find("span:first-child")
											.removeClass(
													"glyphicon-chevron-down");
									$(this).find("span:first-child").addClass(
											"glyphicon-chevron-up");
									$(this).removeClass("sublist-down");
									$(this).addClass("sublist-up");
								}
								/*隐藏*/
								else {
									$(this)
											.find("span:first-child")
											.removeClass("glyphicon-chevron-up");
									$(this).find("span:first-child").addClass(
											"glyphicon-chevron-down");
									$(this).removeClass("sublist-up");
									$(this).addClass("sublist-down");
								}
								// 修改数字控制速度， slideUp(500)控制卷起速度
								$(this).next(".navContent").slideToggle(300)
										.siblings(".navContent").slideUp(300);
							})
			/*左侧导航栏缩进功能*/
			$(".left-main .sidebar-fold")
					.click(
							function() {

								if ($(this).parent().attr('class') == "left-main left-full") {
									$(this).parent().removeClass("left-full");
									$(this).parent().addClass("left-off");

									$(this).parent().parent().find(
											".right-product").removeClass(
											"right-full");
									$(this).parent().parent().find(
											".right-product").addClass(
											"right-off");

								} else {
									$(this).parent().removeClass("left-off");
									$(this).parent().addClass("left-full");

									$(this).parent().parent().find(
											".right-product").removeClass(
											"right-off");
									$(this).parent().parent().find(
											".right-product").addClass(
											"right-full");

								}
							})

			/*左侧鼠标移入提示功能*/
			$(".sBox ul li").mouseenter(function() {
				if ($(this).find("span:last-child").css("display") == "none") {
					$(this).find("div").show();
				}
			}).mouseleave(function() {
				$(this).find("div").hide();
			})
		})
	</script>
</body>
</html>