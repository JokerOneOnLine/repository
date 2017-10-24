<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


</head>

<body>
	<form action="BookServlet/queryPage" method="get" class="navbar-form
	navbar-left">
	<div class="form-group">
			<input type="text" name="key" id="key"  value="${page.creteria.key}"  class="form-control"  placeholder="关键字">
		 </div>
		  <div class="form-group">
		<input type="text" name="minPrice" id="minPrice" class="form-control"  value="${page.creteria.minPrice==0?'':page.creteria.minPrice}" placeholder="最低价格"></div>-
		 <div class="form-group"><input type="text" name="maxPrice" placeholder="最高价格"class="form-control" value="${page.creteria.maxPrice==9999999?'':page.creteria.maxPrice}"></div>
		<button id="search"class="btn btn-default">筛选</button> &nbsp;
	</form>
  </body>
</html>
