<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>基本信息-招聘服务-蓝桥网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网">
<meta name="keywords"
	content="蓝桥,蓝桥网,蓝桥招聘,拉钩, 拉钩网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">
<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
	var ctx = "http://www.lagou.com";
	console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
	$(function(){
		getCompanyName();
	})
	function getCompanyName(){
		$.ajax({
			async:false,
			type:"get",
			cache:false,
			url:"baseInfo/getComapanyName",
			success:function(data){
				$("#companyName").text(data.companyName);
			}
		})
	}
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>

</head>
</head>
<body>
	<div id="header">
		<div class="wrapper">
			<a class="logo" href="index.jsp"> <img width="229" height="43"
				alt="蓝桥招聘-专注互联网招聘" src="style/images/lanqiaologo_green.png">
			</a>
			<ul id="navheader" class="reset">
				<li></li>
				<li><a href="company/getCompanyById?pageNum=1">我的公司</a></li>
				<li><a rel="简历管理" href="myresume/getPage?pageNum=1">简历管理</a></li>
				<!-- 职位管理存在的功能：上下线，增，改 -->
				<li><a href="position/getAllPosition">职位管理</a></li>
			</ul>
			<c:if test="${empty companyId}">
				<dl class="collapsible_menu">
					<dt>
						<span><a href="companyLogin.jsp">登录</a>&nbsp;&nbsp;|&nbsp;&nbsp; 
						<a href="register.jsp">注册</a></span>
					</dt>
				</dl>
			</c:if>
			<c:if test="${!empty companyId}">
				<dl class="collapsible_menu">
					<dt>
						<span id="companyName"></span> <span
							class="red dn" id="noticeDot-1"></span> <i></i>
					</dt>
					<dd>
						<a href="company/post.jsp">我发布的职位</a>
					</dd>
					<dd class="btm">
						<a href="company/getCompanyById?pageNum=1">我的公司主页</a>
					</dd>
					<dd>
						<a href="company/updatePwd.jsp">帐号设置</a>
					</dd>
					<dd class="logout">
						<a rel="nofollow" href="company/companyExit">退出</a>
					</dd>
				</dl>
			</c:if>


		</div>
	</div>
	<!-- end #header -->
	<!------------------------------------- end ----------------------------------------->
	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>
</body>
</html>
