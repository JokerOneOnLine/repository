<%@ page language="java" isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
  </head>
  
  <body>
  <jsp:include page="user/userNav.jsp"></jsp:include>
	<div class="container-fluid">
		<div class="row">
				<div class="col-md-8 col-sm-8" >
					<div class="row">
						<c:forEach items="${page.objs }" var="book">
							<div class="col-md-3 col-sm-3">
								<span><img alt="${book.name }" src="${book.detail }" width="200" height="250"></span>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="col-md-4 col-sm-4" ></div>
				</div>
	</div>
  </body>
</html>
