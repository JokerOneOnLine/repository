<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html ">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style type="text/css">
    body{ text-align:center} 
    #divcss5{margin:5 auto;width:300px;height:60px} 
    #divcss4{margin:3 auto;border:4px solid #000;width:300px;height:40px;font-size: 200%;line-height: 35px;} 
</style>

<body>
	<jsp:include page="/base/companyNav.jsp"></jsp:include><br>
	<div id="divcss5">
	   <h1>您好，您还没有登录！</h1>
	</div>
	<a href="companyLogin.jsp?url=${param.url }"><div id="divcss4">去登陆</div></a><br>
	<a href="index.jsp"><div id="divcss4">去首页</div></a>
</body>
</html>