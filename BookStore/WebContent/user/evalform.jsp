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
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">


  </head>
  
  <body>
    <jsp:include page="/user/userNav.jsp"></jsp:include>
    <div class="container">
    		<center><h4>订单评价</h4></center>
    		<form class="form" action="BookServlet/eval" method="post">
    				<input type="hidden" name="orderid" value="${order.id}">
    				<c:forEach items="${order.items}" var="i">
    					<div class="form-group">
    							<label for="bookname" style="text-align: center">书名：${i.book.name }</label>
    							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;评价星级：
    							<select name ="star-${i.book.id}">
    									<option value="5">5</option>
    									<option value="4">4</option>
    									<option value="3">3</option>
    									<option value="2">2</option>
    									<option value="1">1</option>
    							</select>
    							<textarea  name="content-${i.book.id}"  rows="3" cols="6"  class="form-control" id="${i.book.name }"></textarea>
    					</div>
    				</c:forEach>
    				<input type="submit" value="提交评价" class="btn btn-default">
    		</form>
    </div>
  </body>
</html>
