<%@ page language="java" isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'bookDetail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
			$(function(){
			
				$("#detail").load('${book.detail}');
				$("#consultbtn").click(function(){
					var flag=${!empty sessionScope.user};
					if( !flag){
						alert("请先登录....")
					}
					return flag;
				});
			});
		
	</script>
  </head>
  
  <body>
  	<jsp:include page="user/userNav.jsp"></jsp:include>
  	<div class="container">
  		<div class="col-xs-4 col-sm-4">
  			<a class="thumbnail"><img src="${book.surface }"width="260"height="320"></a>
  			<a id="consultbtn" class="btn btn-link"  data-toggle="modal" data-target="#consultModal" >发布咨询</a>
  			<table class="table">
		  			<c:forEach items="${book.consults }" var="c">
		  					<div>${c.userName }---${c.content }--${c.cDate }</div>
		  			</c:forEach>
  			</table>
  			<h4>看看别人怎么说</h4>
  		<div class="col-xs-8 col-sm-8">
  			<table class="table">
  				<tr>
  					<td>书名</td>
  					<td  colspan="3">  &laquo;&nbsp;&nbsp;&nbsp;${book.name } &nbsp; &nbsp;&raquo;</td>
  				</tr>
  				<tr>
  					<td>售价</td>
  					<td>&nbsp;&nbsp;&yen;${book.price }</td>
  					<td colspan="2"><a class="btn btn-warning" href="UserServlet/addToCart?bookId=${book.id }">加入购物车</a></td>
  				</tr>
  				<tr>
  					<td>库存</td>
  					<td>${book.stock }</td>
  					<td>销量</td>
  					<td>${book.salesamount }</td>
  				</tr>
  				<tr>
  					<td>出版社</td>
  					<td>${book.publishedby }</td>
  					<td>作者</td>
  					<td>${book.author }</td>
  				</tr>
  			</table>
  		<iframe src="${book.detail }" width="100%" height="427px" ></iframe>
  		</div>
  	</div>
  	<!-- 发布咨询 -->
<div class="modal fade" id="consultModal" tabindex="-1" role="dialog" aria-labelledby="consultModalLabel"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button> <h4 class="modal-title" id="loginModalLabel" style="text-algin:center">发布咨询</h4> </div> 
			<div class="modal-body">
					<form class="form" action="BookServlet/consult" method="post" id="consultform">
							    <div class="form-group">
							      <label for="bookname">书名</label>
							      <input type="text"name="id" value="${book.id }" hidden="hidden">
							      <input type="text" name ="name"class="form-control" value="${book.name }" disabled="disabled">
							    </div>
							    <div class="form-group">
							      <label for="consult">咨询内容</label>
							      <textarea rows="5" cols="10" class="form-control" name="content"></textarea>
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" form="consultform"class="btn btn-success" >发布</button> 
				<button class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
  </body>
</html>
