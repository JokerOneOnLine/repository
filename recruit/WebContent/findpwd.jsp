<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'findpwd.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="Shortcut Icon" href="http://www.lagou.com/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/analytics.js"></script>
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body id="login_bg">
	<div class="login_wrapper">
		<div class="login_header">
        	<a href="index.html"><img src="style/images/lanqiaologo_white.png" width="285" height="62" alt="蓝桥招聘" /></a>
            <div id="cloud_s"><img src="style/images/cloud_s.png" width="81" height="52" alt="cloud" /></div>
            <div id="cloud_m"><img src="style/images/cloud_m.png" width="136" height="95"  alt="cloud" /></div>
        </div>
    <div class="find_psw">
        	<img src="style/images/psw_step1.png" width="369" height="56" alt="找回密码第一步" />
           	 <form id="pswForm" action="userController/getEmail" method="post">
           			<input type="text" name="email" id="email" tabindex="1" placeholder="请输入注册时使用的邮箱地址" />
                    <input type="submit" id="submitLogin" value="找回密码" />
            </form>
    </div>
    </div>
  </body>
</html>
