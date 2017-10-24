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
<link href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css" title=""
	rel="stylesheet" />
<link title="" href="style/admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link title="blue" href="style/admin/css/dermadefault.css"
	rel="stylesheet" type="text/css" />
<link title="green" href="style/admin/css/dermagreen.css"
	rel="stylesheet" type="text/css" disabled="disabled" />
<link title="orange" href="style/admin/css/dermaorange.css"
	rel="stylesheet" type="text/css" disabled="disabled" />
<link href="style/admin/css/templatecss.css" rel="stylesheet" title=""
	type="text/css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script src="style/admin/script/jquery.cookie.js" type="text/javascript"></script>
<script src="style/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	type="text/javascript"></script>
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
				<li style="margin-left: 500px; font-size: 30px; margin-top: 15px">欢迎${adminName }登录</li>
			</ul>

			<ul class="nav navbar-nav pull-right">
				<li class="dropdown li-border"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown"
					style="color: red; font-size: 20px">${adminName }<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="admin/adminLoginOut">退出</a></li>
					</ul></li>
				<li><a>级别：管理员<span></span></a></li>
			</ul>
		</div>
	</nav>
	<div class="right-product view-product right-off">
		<div class="container-fluid">
			<div class="info-center">
				<div class="page-header">
					<div class="pull-left">
						<h4>审核认证</h4>
					</div>
				</div>
				<div class="indentify-class padding-lr">
					<p class="margin-big-tb text-sub text-default">
						请注意:企业一旦审核通过，便可发布新的职位，继续请选择企业认证</p>
					<ul class="class-content">
						<li class="pull-left margin-large-35"><a
							class="class-detail pull-right " href="admin/getAllNoCompany">
								<div class="class-detail-top">
									<div class="text-center indentify-icon">
										<img src="style/admin/img/identify_enterprise.png">
									</div>
									<h3 class="text-center">企业认证</h3>
									<p class="margin-tb padding-bottom text-justify info">
										用于企事业单位的注册认证，认证通过可使用发布职位特权</p>
									<ul class="class-detail-has margin-top text-lh-big">
										<li><span class="text-black-gray">选择后继续</span></li>
									</ul>
								</div>
								<p class="continue text-big">选择并继续</p>
						</a></li>
						<li class="pull-left"><a
							class="class-detail pull-right disabled"
							href="javascript:void(0)">
								<div class="class-detail-top">
									<div class="text-center indentify-icon">
										<img src="style/admin/img/identify_developer.png">
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
						<li class="pull-left" style="margin-left: 40px"><a
							class="class-detail pull-right disabled"
							href="javascript:void(0)">
								<div class="class-detail-top">
									<div class="text-center indentify-icon">
										<img src="style/admin/img/identify_personal.png">
									</div>
									<h3 class="text-center">用户认证</h3>
									<p class="margin-tb padding-bottom text-justify info">
										用于求职者认证，认证通过可获得完善简历自定义及投递简历特权</p>
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
</body>
</html>