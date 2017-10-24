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
</head>
<body>
	<jsp:include page="/admin/adminNav.jsp"></jsp:include>

	<div class=" container container-fluid">
		<div class="row">
			<div class="row">
				<table class="table table-bordered">
					<tr>
						<td >咨询id</td>
						<td >咨询者</td>
						<td >内容</td>
						<td >咨询时间</td>
						<td>书本</td>
						<td >操作</td>
					</tr>
					<c:forEach items="${cons }" var="c">
						<tr>
							<td>${c.id }</td>
							<td>${c.userId }</td>
							<td>${c.content }</td>
							<td>${c.cDate }</td>
							<td>${c.bookId }</td>
							<td>${c.reply==null?"未回复":"已回复" }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>