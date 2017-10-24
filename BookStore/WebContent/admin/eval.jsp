<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'MyJsp.jsp' starting page</title>
  </head>
  <body>
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
			   			<td>状态</td>
			   			<td>使用者ID</td>
			   			<td>秘钥</td>
			   			<td>使用时间</td>
	   				</tr>
				<c:forEach items="${evals }" var ="e">
	   				<tr>
		   				<td>${e.id }</td>
		   				<td>${e.content }</td>
		   				<td>${e.bookId }</td>
		   				<td>${e.star }</td>
		   				<td>${e.evalDate }</td>
		   				<td>${e.userId }</td>
		   				<td>${e.reply }</td>
		   				<td>${e.adminId }</td>
		   				<td>${e.replyDate }</td>
		   				<td>${e.orderId }</td>
	   				</tr>
	   			</c:forEach>
				</table>
			</div>
		</div>
	</div>
  </body>
</html>
