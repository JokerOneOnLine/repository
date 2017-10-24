<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<center><h3>订单确认信息</h3></center>
  			<c:forEach items="${user.cart.items }" var="i">
						<table class="table table-condensed" >
							<tr>
								<td><a href="BookServlet/showDetail?id=${i.book.id }"><img alt="${i.book.id }" src="${i.book.surface }" width="20" height="30" ></a></td>
								<td style="line-height: 30px"><a href="BookServlet/showDetail?id=${i.book.id }">${i.book.name }&nbsp;&nbsp;/${i.itemPrice }</a></td>
								<td style="line-height: 30px" >${i.book.price }&nbsp;&nbsp;x&nbsp;&nbsp;${i.count }&nbsp;&nbsp;=&nbsp;&nbsp;${i.itemPrice }&nbsp;&nbsp;元</td>
							</tr>
						</table>
			</c:forEach>
			<form action="UserServlet/order"  method="post" id="order">
					<b><a  class="btn btn-link"  >收货信息</a></b>
					<select name="consigneeid">
							<c:forEach items="${cons }" var ="c">
									<option value="${c.id }">&nbsp;&nbsp;收货人：${c.name}&nbsp;&nbsp地址：${c.addr}&nbsp;电话&nbsp;${c.tel}</option>
							</c:forEach>
					</select>
					<button type="button" class="btn btn-link"  data-toggle="modal" data-target="#addConsigneeModal">其他收货地址</button>
			</form>
					<b style="float: right"><span>下单日期：${c.oDate }</span>&nbsp;&nbsp;&nbsp;总价：&nbsp;${user.cart.totalPrice }元&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit"  class="btn btn-success"  form ="order">去结算</button>${msg }</b>
  		</div>
  		
 <div class="modal fade" id="addConsigneeModal" tabindex="-1" role="dialog" aria-labelledby="addConsigneeModal"> 
	<div class="modal-dialog" role="document" > 
		<div class="modal-content"> 
			<div class="modal-header"> 
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span></button><center><h4 class="modal-title" id="loginModalLabel" style="text-algin:center">增加收货地址</h4></center> </div> 
			<div class="modal-body">
					<form class="form" action="UserServlet/addConsignee" method="post" id="addConsinform">
							    <div class="form-group">
							      <label for="nameInput">收货人姓名</label>
							      <input type="text" name ="name"class="form-control" placeholder="收货人">
							    </div>
							     <div class="form-group">
							      <label for="telInput">收货人电话</label>
							      <input type="text" name ="tel"class="form-control" placeholder="电话">
							    </div>
							    <div class="form-group">
							      <label for="addrInput">收货人地址</label>
							      <input type="text" name="addr"class="form-control" placeholder="地址">
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" form="addConsinform"class="btn btn-success" >确定</button> 
				<button class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
		</div> 
	</div> 
</div>
  </body>
</html>
