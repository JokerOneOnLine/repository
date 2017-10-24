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

<!-- 
  刘如艳  
  用户登录
   -->
<body id="login_bg">
	<p class=" navbar navbar-inverse" style="text-align: center; color: white; font-size: 300%">用户登录系统</p>
	<div class="login_wrapper">
		<div class="login_header">
			<a href="h/">
				<img src="style/images/lanqiaologo_white.png" width="285" height="62" alt="蓝桥招聘" />
			</a>
			<div id="cloud_s">
				<img src="style/images/cloud_s.png" width="81" height="30" alt="cloud" />
			</div>
			<div id="cloud_m">
				<img src="style/images/cloud_m.png" width="136" height="40" alt="cloud" />
			</div>
		</div>
		<div class="login_box">
			<form id="loginForm" action="userController/userLogin" method="post">
				<input type="text" id="email" name="email" style="width:300px " placeholder="请输入邮箱" />
				<input type="hidden" name="url" value="${param.url }">			<input type="password" id="password" name="pwd" placeholder="请输入密码" /><br><span style="color: red">${msg}</span>
				<a href="findpwd.jsp" class="fr" target="_blank">忘记密码？</a><br> 
				<input type="submit" class="btn btn-default" value="登录">
			</form> 
			<img  style="width: 150px" heig9ht="150px" src="${pageContext.request.contextPath}/style/images/qr_resume.png"><br>
			<div style="margin-left: 380px;color: black">扫一扫关注我</div>
		</div>
	</div>
<script type="text/javascript">

$(function(){
	$("#loginForm").validate({
		
		rules:{
			 email: {
			        required: true,
			        email: true
			      },
			 pwd: {
			        required: true,
			        rangelength:[6,18]
			        },
			
		},
		messages:{
			
			email:{
				required:"邮箱不能为空",
				email:"请输入正确的邮箱格式"
				
			},
			 pwd: {
			        required: "密码不能为空",
			        rangelength:"密码在6至18位"
			        },
			
		}
		
	})
	
	
	
	
	
	
	
})


</script>


</body>
</html>
