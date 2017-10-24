<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="themes/default/default.css" />
<link rel="stylesheet" href="plugins/code/prettify.css" />
<script charset="utf-8" src="kindeditor.js"></script>
<script charset="utf-8" src="lang/zh_CN.js"></script>
<script charset="utf-8" src="plugins/code/prettify.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
		$(function(){
		//性别
		var flag =true;
			var old =${user.gender};
			$(":radio").each(function(){
				  var v =$(this).val();
				  if(old==v){
				  		$(this).attr("checked","checked")
				  }
			});
		//验证码
		 $("#vcodeinput").blur(function(){
				var vCode = $(this).val();
				
			});
		//邮箱
		$("#emailinput").blur(function(){
				var email = $(this).val();
				var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
				if(!reg.test(email)){
					alert("请输入正确的邮箱...")
					flag=false;
				}
		})
		
		//用户名
		$("#nameInput").blur(function(){
				var name =$(this).val();
				var oldName = ${user.name};
				var url="UserServlet/checkName";
				var args={name:name,date :new Date()};
				if(name!=oldName){
					$.get(url,args,function(data){
						if(data==1){
							err.text("用户名已存在");
							flag=false;
						}else{
							flag=true;
						}
					});
				}else{
						flag=true
				}
		});
		/*
		$("#modifyButton").click((function(){
				return flag;
			});
		*/
});
</script>
<script>
	KindEditor.ready(function(K) {
		var editor = K.editor({
			cssPath : 'plugins/code/prettify.css',
			uploadJson : 'base/upload_json.jsp',
			fileManagerJson : 'base/file_manager_json.jsp',
			allowFileManager : true,
		});
		K('#image').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#image').val(),
					clickFn : function(url, title, width, height, border, align) {
						var ur = "UserServlet/modify";
						var args = {
							profile : url
						};
						$.post(ur, args, function() {
							//window.location.href="user/usreInfo.jsp";
							window.location.reload();
							alert("修改成功")
						})
						editor.hideDialog();
					}
				});
			});
		});
	});
</script>
</head>
<body>
<jsp:include page="/user/userNav.jsp"></jsp:include>
	<table class="table bor" >
		<tr>
			<th style="text-align: center" colspan="3">个人信息</th>
			<th ><button class="btn btn-default"
					data-toggle="modal" data-target="#modifyModal">修改个人信息</button></th>
		</tr>
		<tr>
			<td rowspan="5"><img src="${user.profile }" height="150px"
				width="180px" id="image" style="cursor: pointer;" title="更换头像"></td>
			<td colspan="2">同户名</td>
			<td>${user.name }</td>
		</tr>
		<tr>
			<td colspan="2">年龄</td>
			<td>${user.age }</td>
		</tr>
		<tr>
			<td colspan="2">性别</td>
			<td>${user.gender==1?"男":"女" }</td>
		</tr>
		<tr>
			<td colspan="2">邮箱</td>
			<td>${user.email }</td>
		</tr>
		<tr>
			<td colspan="2">余额</td>
			<td >${user.balance }&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-default"
					data-toggle="modal" data-target="#rechargeModal">充值</button></td>
		</tr>
	</table>
	<div class="modal fade" id="modifyModal" tabindex="-1" role="dialog"
		aria-labelledby="modifyModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modifyModalLabel"
						style="text-algin:center">更改个人信息</h4>
				</div>
				<div class="modal-body">
					<form class="form" action="UserServlet/modify" method="post"
						id="modifyform">
						<div class="form-group">
							<label for="nameInput">用户名</label> <input type="text"
								name="name1" id="nameInput" class="form-control"
								value="${user.name }">
						</div>
						<div class="form-group">
							<label for="ageinput">年龄</label> <input type="text" name="age"
								id="ageinput" class="form-control" value="${user.age }">
						</div>

						<div class="form-group">
							<label for="emailinput">邮箱</label> <input type="text"
								name="email" id="emailinput" class="form-control"
								value="${user.email }" >
						</div>
						<div class="form-group">
							<label for="genderinput">性别</label>&nbsp;&nbsp;&nbsp; 男：<input
								type="radio" name="gender" value="1"> 女：<input
								type="radio" name="gender" value="0">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label for="vcodeinput">验证码</label>
							<input type="text" name="vcode" id="vcodeinput"
								class="form-control input-sm"><a
								href="UserServlet/getVcode" class="btn btn-link">获取验证码</a>
						</div>
						<div class="alert alert-danger" role="alert" style="display:none"
							id="err"></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="modifyButton" form="modifyform"
						class="btn btn-info">确定</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 充值 -->
	<div class="modal fade" id="rechargeModal" tabindex="-1" role="dialog"
		aria-labelledby="rechargeModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="rechargeModalLabel"
						style="text-algin:center">账户充值</h4>
				</div>
				<div class="modal-body">
					<form class="form" action="UserServlet/recharge" method="post"id="rechargeform">
						<div class="form-group">
							<label for="cardinput">充值卡秘钥</label> <input type="text"name="card" id="cardinput" class="form-control">
						</div>
						<div class="alert alert-danger" role="alert" style="display:none"id="err"></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="rechargeButton" form="rechargeform"
						class="btn btn-success">充值</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
