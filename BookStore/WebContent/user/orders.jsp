<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
  </head>
  <body>
  	<div class="col-lg-2"></div>
	<div class="col-lg-8 thumbnail">
		<div style="text-align: center;">
			<h3>我的订单</h3>
		</div>
		<hr>
		<c:forEach var="o" items="${orders }">
			<table style="width: 100%" class="table table-bordered">
				<tr>
					<td width="20%"><h4>订单号：${o.id }</h4></td>
					<td colspan="2"><h4>下单日期：${o.oDate }</h4></td>
					<td><h4>状态：
					<c:if test="${o.isSend==1}">
							<c:if test="${o.isevaluated==0}">
								<a href="UserServlet/toEva?id=${o.id }" class="btn btn-link">已发货，去评价</a>
							</c:if>
							<c:if test="${o.isevaluated==1}">
								已发货，已评价
							</c:if>
					</c:if>
					<c:if test="${o.isSend==0}">
						未发货
					</c:if>
					</h4></td>
				</tr>
				<tr>
					<c:forEach items="${o.items }" var="i">
						<tr>
							<td><span style="float: left;"><img alt=""
									src="${i.book.surface }" width="60px" height="80px"></span></td>
							<td width="25%"><br><h4>《${i.book.name }》</h4></td>
							<td width="25%"><br><h4>${i.book.price }元×${i.count }本</h4></td>
							<td><br><h4>${i.itemPrice }元</h4></td>
						</tr>
					</c:forEach>
				</tr>
				<tr>
					<td colspan="4">
						<b>收货人：${o.consignee.name }&nbsp;&nbsp;&nbsp;&nbsp;联系方式：${o.consignee.tel }&nbsp;&nbsp;&nbsp;&nbsp;收货地址：${o.consignee.addr }</b>
					</td>
				</tr>
			</table>
		</c:forEach>
	</div>
   
	    
  </body>
</html>
