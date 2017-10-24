<%@ page language="Java" import="java.util.*" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 渭南师范二期-程建波
 2017年8月26日上午15:48:13
 管理员登录界面
  -->
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>标题</title>
<script type="text/javascript">
	var ctx = "h";
	console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script type="text/javascript" src="style/js/conv.js"></script>
</head>
<body id="login_bg">
	<p class=" navbar navbar-inverse" style="text-align: center; color: white; font-size: 300%">管理员登录系统</p>
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
			<form id="loginForm" action="admin/login" method="post">
				<input type="text" id="name" name="name" style="width:300px " placeholder="请输入管理员姓名" />
				<input type="password" id="password" name="password" placeholder="请输入管理员密码" />
				<input type="submit" class="btn btn-default" value="登录">
			</form>
			<img style="width: 150px" height="150px" src="${pageContext.request.contextPath }/style/images/img/admin.png">
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			//验证表单
			$("#loginForm").validate({
				rules : {
					name : {
						required : true,
						rangelength : [ 2, 10 ]
					},
					password : {
						required : true,
						rangelength : [ 5, 16 ]
					}
				},
				messages : {
					name : {
						required : "用户名不能为空	",
						rangelength : "请输入2-10个字符"
					},
					password : {
						required : "请输入密码",
						rangelength : "密码必须介于5-16位"
					}
				}
			});
		});
	</script>
</body>
</html>