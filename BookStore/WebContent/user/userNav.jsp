<%@ page language="java" isELIgnored="false" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String path = request.getContextPath() + "/";%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	body {
		font-family: "微软雅黑";
		background-size:cover ;
		background-image: url(imgs/c8.jpg);
		background-repeat:no-repeat; 
}
</style>
<script type="text/javascript">
		$(function(){
		$("#registButton").click(function(){
			var flag;
			var name =$("#nameInput").val();
			var url ="UserServlet/checkName";
			var data ={name:name,date :new Date()};
			$.ajax({
				async:false,
				data:data,
				url:url,
				success:function(d){
						if(d==0){
								//$("#err").hide();
								flag=true;
						}else{
							$("#err").text("用户名已被占用");
							$("#err").show();
							flag=false;
						}
						var pwd=$("#pwdInput1").val();
						var pwd2=$("#pwdInput2").val();
						if(pwd.length<6||pwd.length>32){
								$("#err").text("密码长度需为6-32位");
								$("#err").show();
								return false;
						}
						if(pwd!=pwd2){
								$("#err").text("两次密码不一致！！");
								$("#err").show();
								return false;
						}
				}
			});
			return flag;
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		      </button>
		      <a class="navbar-brand  glyphicon glyphicon-home" href="#"></a>
		      <a class="navbar-brand" href="BookServlet/queryPage">知识的海洋</a>
		    </div>
      <ul class="nav navbar-nav navbar-right">
	      <c:if test="${empty user }">
		        <li><a type="button" class="btn btn-link"  data-toggle="modal" data-target="#loginModal">登录</a></li>
		        <li><a type="button" class="btn btn-link"  data-toggle="modal" data-target="#registModal">注册 </a></li>
	      </c:if>
	      <c:if test="${!empty user }">
	      		<a  href="user/userInfo.jsp" class="btn btn-link">
		      		<c:if test="${empty user.email }">
		      			<span class="glyphicon glyphicon-envelope" title="邮箱未验证"></span>
		      		</c:if>
	      		${user.name }<img src="${user.profile }" width="40px" height="30px">
	      		</a>
	      		<a href="UserServlet/getOrders" class="btn btn-link">我的订单</a>
	      		<a href="UserServlet/logout" class="btn btn-link">退出</a>
	      </c:if>
      </ul>
    </div></nav>
<!-- 注册 -->
<div class="modal fade" id="registModal" tabindex="-1" role="dialog" aria-labelledby="registModalLabel"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="registModalLabel" style="text-algin:center">用户注册</h4> </div> 
			<div class="modal-body">
					<form class="form" action="UserServlet/regist" method="post" id="registform">
							    <div class="form-group">
							      <label for="nameInput1">用户名</label>
							      <input type="text" name ="name1"id="nameInput1" class="form-control" placeholder="用户名">
							    </div>
							    <div class="form-group">
							      <label for="emailinput1">邮箱</label>
							      <input type="text" name ="email1"id="emailinput1" class="form-control" placeholder="邮箱">
							    </div>
							    <div class="form-group">
							      <label for="pwdInput1">请输入密码</label>
							      <input type="password" name="pwd1"id="pwdInput1" class="form-control" >
							    </div>
							   <div class="form-group">
							      <label for="pwdInput2">请确定密码</label>
							      <input type="password" name="pwd2"id="pwdInput2" class="form-control" >
							    </div>	   
							    <div class="alert alert-danger" role="alert" style="display:none" id ="err">
							    
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" id="registButton"form="registform"class="btn btn-info" >注册</button> 
				<button type="button" class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
<!-- 登录 -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="loginModalLabel" style="text-algin:center">用户登录</h4> </div> 
			<div class="modal-body">
					<form class="form" action="UserServlet/login" method="post" id="loginform">
							    <div class="form-group">
							      <label for="nameInput">用户名</label>
							      <input type="text" name ="name"class="form-control" placeholder="用户名">
							    </div>
							    <div class="form-group">
							      <label for="pwdInput">请输入密码</label>
							      <input type="password" name="pwd"class="form-control" >
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" id="loginButton"form="loginform"class="btn btn-success" >登录</button> 
				<a  class="btn btn-danger"  href="user/retrieve.jsp">找回密码</a> 
				<button class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
</body>
</html>