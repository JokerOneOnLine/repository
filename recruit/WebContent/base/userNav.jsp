<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 渭南师范学院二期  代旭波   2017-8-24 15：20 -->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script id="allmobilize" charset="utf-8"
	src="style/js/allmobilize.min.js"></script>
<link rel="alternate" media="handheld" />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>关于我们-蓝桥网-最专业的互联网招聘平台</title>
<meta content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网" name="description">
<meta
	content="蓝桥,蓝桥网,蓝桥招聘,拉钩, 拉钩网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招"
	name="keywords">
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
	var ctx = "http://www.lagou.com";
	console.log(1);
</script>
<link rel="Shortcut Icon" href="http://www.lagou.com/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css" />
<link rel="stylesheet" type="text/css" href="style/css/external.min.css" />
<link rel="stylesheet" type="text/css" href="style/css/popup.css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/additional-methods.js"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;

	$(function(){
		getUserName();
	})
	function getUserName(){
		$.ajax({
			async:false,
			type:"get",
			cache:false,
			url:"userController/getUserName",
			success:function(data){
			//alert(JSON.stringify(data));
				$("#getUserNameaa").text(data.UserName);
			}
		})
	}
</script>
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<!-- 修改 我的简历链接 -->
		<div id="header">
			<div class="wrapper">
				<a href="index.jsp" class="logo"> <img
					src="style/images/lanqiaologo_green.png" width="229" height="43"
					alt="蓝桥招聘-专注互联网招聘" />
				</a>
				<ul class="reset" id="navheader">
					<li><a href="index.jsp">首页</a></li>
					<li></li>
					<li><a href="user/redirectPosition.jsp">职 位</a></li>
					<li></li>
					<li><a
						href="CompanyListController/getBaseInfoByCompanyCity?companyCity=all&pageNum=1">公司</a></li>
					<li></li>
					<c:if test="${empty userId }"></c:if>
					<c:if test="${!empty userId }">
						<li><a href="userController/toUserInfo" rel="nofollow">我的简历</a></li>
					</c:if>

				</ul>
				<c:if test="${empty userId }">
					<ul class="loginTop">
						<li><a href="companyLogin.jsp" rel="nofollow">公司登录</a></li>
						<li><a href="userlogin.jsp" rel="nofollow">个人登录</a></li>
						<li>|</li>
						<li><a href="register.jsp" rel="nofollow">注册</a></li>
						<li></li>
					</ul>

				</c:if>
				<c:if test="${!empty userId }">
					<dl class="collapsible_menu">
						<dt>
							<span id="getUserNameaa"></span> <span class="red dn"
								id="noticeDot-0"></span> <i></i>
						</dt>
						<dd>
							<a rel="nofollow" href="myresume/user.jsp">我的简历</a>
						</dd>
						<dd>
							<a href="user/collections.jsp">我收藏的职位</a>
						</dd>
						<dd>
							<a href="user/delivery.jsp">我投递的职位</a>
						</dd>
						<dd>
							<a href="updatePwd.jsp">帐号设置</a>
						</dd>
						<dd class="logout">
							<a rel="nofollow" href="userController/logout">退出</a>
						</dd>
					</dl>
				</c:if>
			</div>
		</div>
		<!-- end #header -->


		<script type="text/javascript" src="style/js/core.min.js"></script>
		<script type="text/javascript" src="style/js/popup.min.js"></script>
		<script type="text/javascript" src="style/js/tongji.js"></script>
		<!--  -->
		<script type="text/javascript" src="style/js/analytics.js"></script>
	</nav>
</body>
</html>
