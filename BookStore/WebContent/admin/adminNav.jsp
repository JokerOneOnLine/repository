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
		background-image: url(imgs/bg.jpg);
		background-repeat:no-repeat; 
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
		     <ul class="nav navbar-nav ">
		         <li><a class="btn" href="AdminServlet/getAllbooks">所有图书</a></li>
		         <li><a class="btn" href="admin/bookform.jsp">增加图书</a></li>
		         <li><a  class="btn"  data-toggle="modal" data-target="#addCards">发布充值卡</a></li>
		         <li><a class="btn" href="AdminServlet/getCards">充值卡信息</a></li>
		         <li><a class="btn" href="AdminServlet/getOrders">查看所有订单</a></li>
		         <li><a class="btn" href="AdminServlet/getConsults">查看所有咨询</a></li>
		         <li><a class="btn" href="AdminServlet/getEvals">查看所有评价</a></li>
		         <li><a class="btn" href="#">首页</a></li>
     		 </ul>
			  <ul class="nav navbar-nav navbar-right">
					        <li><a  class="btn "   data-toggle="modal" data-target="#loginModal" >Admin<sapn class="glyphicon glyphicon-user"></sapn></abbr></a></li>
			  </ul>
</nav>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="loginModalLabel" style="text-algin:center">管理员登录</h4> </div> 
			<div class="modal-body">
					<form class="form" action="AdminServlet/login" method="post" id="loginform">
							    <div class="form-group">
							      <label for="nameInput">管理员</label>
							      <input type="text" name ="name"class="form-control" >
							    </div>
							    <div class="form-group">
							      <label for="pwdInput">密码</label>
							      <input type="password" name="pwd"class="form-control" >
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" id="loginButton"form="loginform"class="btn btn-success" >登录</button> 
				<button class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
<!-- 会员卡 -->
<div class="modal fade" id="addCards" tabindex="-1" role="dialog" aria-labelledby="addCardsModalLabel"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="addCardsModalLabel" style="text-algin:center">生成充值卡</h4> </div> 
			<div class="modal-body">
					<form class="form" action="AdminServlet/creatCards" method="post" id="addCardsform">
							    <div class="form-group">
							      <label for="amountInput">面额</label>
							      <input type="text" name ="amount"class="form-control" >
							    </div>
							    <div class="form-group">
							      <label for="countInput">数量</label>
							      <input type="number" name="count"class="form-control" >
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" form="addCardsform"class="btn btn-success" >生成</button> 
				<button class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
</body>
</html>