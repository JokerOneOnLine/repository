<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'allBooks.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
	$(function() {
		$("#toPage").change(function() {
			var pageNo = $(this).val();
			var key = "${page.creteria.key}";
			var minprice = "${page.creteria.minPrice}";
			var maxprice = "${page.creteria.maxPrice}";
			var url = "BookServlet/queryPage?key=" + key + "&minprice= " + minprice + " &maxprice=" + maxprice + "&pageNo=" + pageNo;
			window.location.href = url;
		});
		
		//删除交易项
		$(".removeItem").click(function(){
			//var href =window.location.href;
			var flag =confirm("确定要删除该商品吗？");
			if(flag){
					var url = this.href;
					var args = {date:new Date()};
					//$.post(url);
					//window.location.href=href;
					$.ajax({
						data:args,
						url:url,
						cache:false,
						async:false,
						success:function(){
						window.location.reload();
						}
					});
			};
			return false;
		});
		$(".itemCount").blur(function(){
			var stock = $(this).attr("stock");
			var count=$(this).val();
			var old = $(this).attr("old");
			if(count==old){
				return false;
			}
			if(count>old){
				alert("库存不足...");
				count=old;
			}
			var id =$(this).attr("name");
			var args={count:count,id:id,date:new Date()};
			var url="UserServlet/modifyItem";
			$.post(url,args);
			window.location.reload();
		});
	});
</script>
</head>
	<jsp:include page="/user/userNav.jsp"></jsp:include>
	<jsp:include page="/user/pagef.jsp"></jsp:include>
	 
	<div class="container-fluid" class="col-md-8 col-sm-8">
		<c:if test="${page.creteria.pageNo<=1}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
		<c:if test="${page.creteria.pageNo>1}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="BookServlet/queryPage?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=1">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="BookServlet/queryPage?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.pageNo-1}">上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
		<c:if test="${page.creteria.pageNo>=page.creteria.totalPage}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a>末页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
		<c:if test="${page.creteria.pageNo<page.creteria.totalPage}">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="BookServlet/queryPage?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.pageNo+1}">下一页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="BookServlet/queryPage?key=${page.creteria.key}&minPrice=${page.creteria.minPrice}&maxPrice=${page.creteria.maxPrice}&pageNo=${page.creteria.totalPage}">尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-sm-8">
				<div class="row">
					<c:forEach items="${page.objs }" var="book">
						<div class="col-md-2 thumbnail">
							<a href="BookServlet/showDetail?id=${book.id }"> <span
								style="text-align: center"> <img alt="${book.name }"
									src="${book.surface }" width="140" height="191"></img>
									&laquo;${book.name }&raquo;
							</span><br>
							</a> <span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&yen;&nbsp;&nbsp;${book.price }</span><br>
							<a class="btn btn-warning"
								href="UserServlet/addToCart?bookId=${book.id }">&nbsp;加入购物车</a>
						</div>
						<div class="col-md-1"></div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-4 col-sm-4">
				我的购物车
				<c:if test="${!empty user }">
					<c:forEach items="${user.cart.items }" var="i">
						<table class="table table-condensed" >
							<tr>
								<td><a href="BookServlet/showDetail?id=${i.book.id }"><img alt="${i.book.id }" src="${i.book.surface }" width="30" height="40"></a></td>
								<td><a href="BookServlet/showDetail?id=${i.book.id }">${i.book.name }</a></td>
								<td><a class
								="removeItem" href="UserServlet/removeItem?id=${i.id }"><span class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
							<tr>
								<td>${i.book.price }</td>
								<td>x&nbsp;&nbsp;<input type="text" class="itemCount" name="${i.book.id }"old= "${i.count }" stock="${i.book.stock }" value="${i.count }" size="4"></td>
								<td>=&nbsp;${i.itemPrice }</td>
							</tr>
						</table>
					</c:forEach>
					<b>总价：￥&nbsp;${user.cart.totalPrice }</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="UserServlet/toOrder" class="btn btn-default">去结算</a>
				</c:if>
			</div>
		</div>
	</div>

</body>
</html>
