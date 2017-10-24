<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#vCode {
	color: red;
	width: 100px;
}
</style>

<script type="text/javascript">
	var ctx = "h";
	console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css" />

<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/css/recruit_LQ.css">
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript">
<!-- 赵鹏飞  用户注册 -->
	$(document).ready(function(e) {
		$('.register_radio li input').click(function(e) {
			$(this).parent('li').addClass('current').append('<em></em>').siblings().removeClass('current').find('em').remove();
		});
	});
	//验证表单
	$(function() {
		$("#loginForm").validate({
			rules : {
				email : {
					required : true,
					email : true
				},
				pwd : {
					required : true,
					rangelength : [ 6, 16 ]
				},
			},
			messages : {
				email : {
					required : "请输入常用邮箱地址",
					email : "请输入有效的邮箱地址，如：vivi@lagou.com"
				},
				pwd : {
					required : "请输入密码",
					rangelength : "请输入6-16位密码，字母区分大小写"
				},
			},
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		var flag = false;
		$("#submitLogin").click(function(){
			var a=$("#vCode").val();
			if(a==""){
				alert("验证码不能为空");
				$("#vCode").focus();
				return false;
			}
		});
		//发送验证码
		$("#sendVCode").click(function() {
			var email = $("#email").val();
			var url = "userController/getVCode";
			var args = {
				email : email,
				date : new Date()
			};
			$("#email").attr("readonly", "readonly");
			$.post(url, args);
			return false;
		});
		//验证验证码
		$("#vCode").blur(function() {
			var vCode = $(this).val();
			var url = "userController/testVCode";
			var args = {
				vCode : vCode
			};
			if (vCode == "") {
				return false;
			}

			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : args,
				cache : false,
				success : function(data) {

					if (data == 1) {
						flag = true;
						return flag;
					} else {
						flag = false;
						return flag;
					}
				}
			});
			return flag;
		});
	});
</script>
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
		<div class="login_box">
			<form id="loginForm" action="getRegisterInfo" method="post">
			<!-- <form id="loginForm" action="userController/register"> -->
				<ul class="register_radio clearfix">
					<li>找工作 <input type="radio" value="0" name="type" />
					</li>
					<li>招人 <input type="radio" value="1" name="type" />
					</li>
				</ul>
				<input type="text" id="email" name="email" tabindex="1"
					placeholder="请输入常用邮箱地址" /> <br> <input type="password"
					id="password" name="pwd" tabindex="2" placeholder="请输入密码" /><br>
				<input type="text" name="vCode" id="vCode"><a href="#"
					id="sendVCode" style="color:green;">获取验证码</a><br>${mag}<br> <input
					type="submit" id="submitLogin" class="inline cboxElement"
					onclick="check()" value="注 &nbsp; &nbsp; 册"/ >

			</form>
			<div class="login_right">
				<div>已有蓝桥帐号</div>
				<a href="userlogin.jsp" class="registor_now">直接登录</a>
			</div>
		</div>
	</div>

</body>
</html>