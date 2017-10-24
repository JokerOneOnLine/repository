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
<style type="text/css">
	body {
		font-family: "微软雅黑";
		background-size:cover ;
		background-color:#9f9;
		background-repeat:no-repeat; 
}
</style>
</head>
<body>
 <jsp:include page="/admin/adminNav.jsp"></jsp:include>
	<center><h3>所有图书信息</h3><a href="http://localhost:8080/BookStore/admin/adminNav.jsp" class="btn btn-success" >管理员首页</a></center>
	<div class=" container container-fluid">
		<div class="row">
			<div class="row">
				<table class="table table-bordered">
						<tr>
							<td style="margin:auto; ">封面</td>
							<td>书名</td>
							<td>出版社</td>
							<td>作者</td>
							<td>价格</td>
							<td>库存</td>
							<td>销量</td>
							<td>更新</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${page.objs }" var="book">
						<tr>
							<td text-align="center"><a href="BookServlet/showDetail?id=${book.id }"><img alt="${book.name }" src="${book.surface }"
								width="20" height="20"></img></a></td>
							<td><a href="BookServlet/showDetail?id=${book.id }">${book.name }</a></td>
							<td>${book.publishedby }</td>
							<td>${book.author }</td>
							<td>${book.price }</td>
							<td>${book.stock }</td>
							<td>${book.salesamount }</td>
							<td><a class="btn btn-default" href="BookServlet/toUpdate?id=${book.id} ">编辑该图书</a></td>
							<td><a href="http://www.baidu.com" class="btn btn-default" >上/下架</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="  container  container-fluid" class="col-md-8 col-sm-8">
	<c:if test="${page.creteria.pageNo<=1}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" >首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" >上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
	<c:if test="${page.creteria.pageNo>1}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" 
			href="AdminServlet/getAllbooks?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" 
			href="AdminServlet/getAllbooks?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.pageNo-1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
	<c:if test="${page.creteria.pageNo>=page.creteria.totalPage}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" >下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" >末页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
	<c:if test="${page.creteria.pageNo<page.creteria.totalPage}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" 
			href="AdminServlet/getAllbooks?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.pageNo+1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="btn btn-default" 
			href="AdminServlet/getAllbooks?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>

	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;跳至：<input type="text" id="toPage"
		size="4" value="${book.pageNo}">页&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;第${page.creteria.pageNo}/${page.creteria.totalPage}页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<select>
		<option id="priceasc">按销价格升序</option>
		<option id="pricedesc">按销价格降序</option>
		<option id="salemountasc">按销销量升序</option>
		<option id="salemountdesc">按销销量降序</option>
	</select>
</div>
</body>
</html>
