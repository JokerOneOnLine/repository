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
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css"><link>
	<script type="text/javascript " src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".view").click(function(){
					$(".key").hide();
			});
		})
	</script>
    </head>
  <body>
   <jsp:include page="/admin/adminNav.jsp"></jsp:include>
	   <div class=" container container-fluid">
		<div class="row">
			<div class="row">
				<table class="table table-bordered">
					<tr>
		   				<td>充值卡序列号</td>
		   				<td>金额</td>
			   			<td>状态</td>
			   			<td>使用者ID</td>
			   			<td>秘钥</td>
			   			<td>使用时间</td>
	   				</tr>
				<c:forEach items="${cards }" var ="c">
	   				<tr>
		   				<td>${c.id }</td>
		   				<td>${c.amount }</td>
		   				<td>${c.isUsed==0?"未使用":"已使用" }</td>
		   				<td>${c.userId }</td>
		   				<td><a class ="view">查看</a><p class="key">${c.cardKey }</td>
		   				<td>${c.useDate }</td>
	   				</tr>
	   			</c:forEach>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
