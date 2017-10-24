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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">

</head>

<body>
	<jsp:include page="/admin/adminNav.jsp"></jsp:include>
	<div class=" container container-fluid">
		<div class="row">
			<div class="row">
				<table class="table table-bordered">
					<tr>
						<td>订单号</td>
						<td>下单时间</td>
						<td>图书</td>
						<td>金额</td>
						<td>收件人</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${orders }" var="o">
						<tr>
							<td>${o.id }</td>
							<td>${o.oDate }</td>
							<td>${o.items[0].book.name }等${o.count }</td>
							<td>${o.price }</td>
							<td>${o.consignee.name }</td>
							<td><c:if test="${ o.isSend==0}">
									<a href="AdminServlet/send?id=${o.id }" class="btn btn-link">发货</a>
								</c:if> <c:if test="${ o.isSend!=0}">
									<span>${o.isevaluated==0?"未评价":"已评价" }</span>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
