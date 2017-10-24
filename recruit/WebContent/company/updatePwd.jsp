<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updatePwd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updatePswForm").validate({
			rules : {
		oldpassword : {
					required : true,
					rangelength : [ 6, 16 ],
				  	remote:{                                          
             			type:"POST",
            			url: "CompanyListController/checkPwd",             
            			data:{
               				name:function(){
               				return $("#oldpassword").val();
               				}
		               	  } 
		               } 
					},
		newpassword : {
					required : true,
					rangelength : [ 6, 16 ]
					},
		comfirmpassword : {
					required : true,
					rangelength : [ 6, 16 ],
					equalTo: "#newpassword"
					},
			},
			messages : {
				oldpassword : {
					required : "请输入原密码",
					rangelength : "请输入6-16位密码，字母区分大小写",
					remote:jQuery.format("密码错误")
				},
				newpassword : {
					required : "请输入新密码",
					rangelength : "请输入6-16位密码，字母区分大小写"
				},
				comfirmpassword : {
					required : "请再次输入",
					rangelength : "请输入6-16位密码，字母区分大小写",
					equalTo: "请再次输入相同的值"
				},
			},
		});
	})
</script>
<body>
	<jsp:include page="../base/companyNav.jsp"></jsp:include>
	<div id="container">
		<div class="user_bindSidebar">
			<dl id="user_sideBarmenu" class="user_sideBarmenu">
				<dt>
					<h3>帐号设置</h3>
				</dt>
				<dd>
					<a class="hover" href="updatePwd.html">修改密码</a>
				</dd>
			</dl>
		</div>
		<input type="hidden" id="hasSidebar" value="1">
		<div class="content user_modifyContent">
			<dl class="c_section">
				<dt>
					<h2>
						<em></em>修改密码
					</h2>
				</dt>
				<dd>
					<form id="updatePswForm" action="CompanyListController/updatePwd">
						<table class="savePassword">
							<tbody>
								<tr>
									<td>登录邮箱</td>
									<td class="c7">
								${email}
									</td>
								</tr>
								<tr>
									<td class="label">当前密码</td>
									<td><input type="password" maxlength="16" id="oldpassword"
										name="oldpassword"
										style="background-image: url(style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
										<span id="updatePwd_beError" style="display:none;"
										class="error"> </span></td>
								</tr>
								<tr>
									<td class="label">新密码</td>
									<td><input type="password" maxlength="16" id="newpassword"
										name="newpassword"
										style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
								</tr>
								<tr>
									<td class="label">确认密码</td>
									<td><input type="password" maxlength="16"
										id="comfirmpassword" name="comfirmpassword"
										style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td><input type="submit" value="保 存"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</dd>
			</dl>
		</div>

	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="h/about.html">联系我们</a> <a
				target="_blank" href="h/af/zhaopin.html">互联网公司导航</a> <a
				rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">拉勾微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">拉勾微信<i></i></a>
			<div class="copyright">
				&copy;2013-2014 Lagou <a
					href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
					target="_blank">京ICP备14023790号-2</a>
			</div>
		</div>
	</div>

	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>

	<!--  -->


	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
</body>
</html>
</body>
</html>
