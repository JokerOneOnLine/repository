<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userlogin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<!-- 公司邮箱登录 易孝凡 修改 20170906 -->
<!-- 刘如艳   用户登录  -->
<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
			<a href="h/"><img src="style/images/lanqiaologo_white.png"
				width="285" height="62" alt="蓝桥招聘" /></a>
			<div id="cloud_s">
				<img src="style/images/cloud_s.png" width="81" height="52"
					alt="cloud" />
			</div>
			<div id="cloud_m">
				<img src="style/images/cloud_m.png" width="136" height="95"
					alt="cloud" />
			</div>
		</div>
		<input type="hidden" id="resubmitToken" value="" />
		<div class="login_box">
			<form id="loginForm" action="company/loging?pageNum=1"
				method="post">
				邮箱:<input type="text" id="email" name="email" value="" tabindex="1"
					placeholder="请输入登录邮箱地址" /><br> 密码:<input type="password"
					id="password" name="pwd" tabindex="2" />${msg}<br> <a
					href="findpwd.jsp" class="fr" target="_blank">忘记密码？</a><br> <input
					type="submit" value="登录">
					<input type="hidden" name="url" value="${param.url }">
			</form>
			<div class="login_right">
				<a href="register.jsp" class="registor_now">立即注册</a>
			</div>
		</div>
		<div class="login_box_btm"></div>
	</div>
</body>
</html>
