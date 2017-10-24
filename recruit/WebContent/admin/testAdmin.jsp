<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'test.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>

<body>
	<table cellpadding="5" cellspacing="0" border="1" width="80%">
		<tr>
			<td>公司名称</td>
			<td>公司网址</td>
			<td>公司简介</td>
			<td>审核状态</td>
			<td>查看公司详情</td>
		</tr>
		<c:forEach items="${companies }" var="company">
			<c:if test="${!empty company.baseInfo }">
				<tr>
					<td>${company.baseInfo.companyName }</td>
					<td>${company.baseInfo.companyUrl}</td>
					<td>${company.baseInfo.introduction}</td>
					<c:if test="${company.authentication==0 }">
						<td><a href="admin/toAuthentication?companyId=${company.companyId }">等待审核</a></td>
					</c:if>
					<c:if test="${company.authentication==1 }">
						<td>以审核</td>
					</c:if>
					<td><a href="admin/seeCompanyById?companyId=${company.companyId }">公司详情</a>
				</tr>
			</c:if>
		</c:forEach>
	</table>

</body>
</html>
