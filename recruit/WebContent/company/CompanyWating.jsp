<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		<div >
			<font size="5" color="#FF0000" align="center">信息填写完成，等待管理员审核·········</font><a style=" color:blue; font-size:20px;" href="companyLogin.jsp">回首页</a><br />
		</div>
	</div>
</body>
</html>
