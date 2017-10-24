<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
body {
	font-family: "微软雅黑";
	background-size: cover;
	background-image: url(imgs/bg.jpg);
	background-repeat: no-repeat;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
	    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
	      <a class="navbar-brand glyphicon glyphicon-home" href=""></a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      <li><a class="navbar-brand"href="user/userNav.jsp">我是用户</a> </li>
	      <li><a class="navbar-brand" href="">用户登录</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a class="navbar-brand"href="admin/adminNav.jsp">我是管理</a></li>
	        <li><a class="navbar-brand" href="">管理登录</a></li>
	      </ul>
	    </div>
  </div>
</nav>
<marquee behavior="alternate" style="font-size: 30px ;color: #ffffff"scrollamount="5">欢迎来到图书商城首页</marquee>
</body>
</html>