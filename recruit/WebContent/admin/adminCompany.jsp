<%@ page language="Java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>标题</title>
<link href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css" title=""
	rel="stylesheet" />
<link title="" href="style/admin/css/style.css" rel="stylesheet"
	type="text/css" />
<link title="blue" href="style/admin/css/dermadefault.css"
	rel="stylesheet" type="text/css" />
<link title="green" href="style/admin/css/dermagreen.css"
	rel="stylesheet" type="text/css" disabled="disabled" />
<link title="orange" href="style/admin/css/dermaorange.css"
	rel="stylesheet" type="text/css" disabled="disabled" />
<link href="style/admin/css/templatecss.css" rel="stylesheet" title=""
	type="text/css" />
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script src="style/admin/script/jquery.cookie.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script src="style/bootstrap-3.3.7-dist/js/bootstrap.min.js"
	type="text/javascript"></script>
<style>
#allList {
	margin-top: 60px
}
</style>
<script type="text/javascript">
	$(function() {
		$("button").each(function() {
			$(this).click(function() {
				var companyId = $(this).val();
				$.ajax({
					url : "admin/updateCompany",
					async : "false",
					cache : "false",
					data : {
						companyId : companyId
					},
					type : "POST",
					success : function(d) {
						if (d > 0) {
							//alert($(this).html());
							//$(this).text("已提交");
							alert("确定通过吗？")
							window.location.reload();
						}
					}
				});
			});
		});
	});
</script>
</head>
<body
	style="background-image: url('${pageContext.request.contextPath }/style/images/company.jpg');">
	<nav class="nav navbar-default navbar-mystyle navbar-fixed-top">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand mystyle-brand"><span
				class="glyphicon glyphicon-home"></span></a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li style="margin-left: 500px; font-size: 30px; margin-top: 15px">欢迎${adminName }登录</li>
			</ul>

			<ul class="nav navbar-nav pull-right">
				<li class="dropdown li-border"><a href="#"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown"
					style="color: red; font-size: 20px">${adminName }<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="admin/adminLoginOut">退出</a></li>
					</ul></li>
				<li class="dropdown"><a href="javascript:void(0)"
					class="dropdown-toggle mystyle-color" data-toggle="dropdown">级别：管理员<span></span></a>
				</li>
			</ul>
		</div>
	</nav>
	<div class="container" id="allList">
		<!-- 显示表格数据  -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr style="font-size: 20px">
						<th>编号</th>
						<th>公司邮箱</th>
						<th>审核状态</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.companyId }</th>
							<th>${emp.companyEmail }</th>
							<th><button class="btn btn-danger" value="${emp.companyId }">${emp.authentication==0?"未审核":"已审核" }</button></th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<!-- 显示分页信息 -->
		<div class="row">
			<!--分页文字信息  -->
			<div class="col-md-5" style="margin-top: 20px; font-size: 18px">当前
				${pageInfo.pageNum }页,共${pageInfo.pages } 页,总 ${pageInfo.total } 条记录</div>
			<!-- 分页条信息 -->
			<div class="col-md-7">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li><a href="admin/getAllNoCompany?pn=1">首页</a></li>
						<c:if test="${pageInfo.hasPreviousPage }">
							<li><a href="admin/getAllNoCompany?pn=${pageInfo.pageNum-1}"
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							<c:if test="${page_Num == pageInfo.pageNum }">
								<li class="active"><a href="javascript:void(0)">${page_Num }</a>
								</li>
							</c:if>
							<c:if test="${page_Num != pageInfo.pageNum }">
								<li><a href="admin/getAllNoCompany?pn=${page_Num }">${page_Num }</a>
								</li>
							</c:if>
						</c:forEach>
						<c:if test="${pageInfo.hasNextPage }">
							<li><a
								href="admin/getAllNoCompany?pn=${pageInfo.pageNum+1 }"
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
						<li><a href="admin/getAllNoCompany?pn=${pageInfo.pages}">末页</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>