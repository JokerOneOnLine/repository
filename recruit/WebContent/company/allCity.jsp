<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'allCity.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
		.divcss{margin:0 auto;margin-top:10px;border:solid 1px #F5F5DC;width:1000px}
</style>
<style type="text/css">
		.province_title{font-weight:bold}
</style> 	
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			async : false,
			cache : false,
			url : "testJson",
			success : function(data) {
				areas = eval("(" + data + ")");
				$.each(areas, function(idx, item) {
					//alert(JSON.stringify(item));
					$("#Province").append('<span><h2>' + item.name + '</h2></span>');
					 $.each(item.city,function(id,items){
					 /*  增加 a 节点的 href 连接  易孝凡 */
		               	$("#Province").append('&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a id="city" href="CompanyListController/getBaseInfoByCompanyCity?companyCity='+items.name+'&pageNum=1">' + items.name + '</a></span>');
	         		})
				});
			}
		});
	$(document).ready(function(){
 		 $("a").click(function(){
  			  //alert(123);
  			 var city = $(this).html();
  			//alert(city);
  			 var args={city:city,date:new Date()};
  			 var url="getBaseInfoByCompanyCity";
  			 $.get(url,args);
  			
  			  });
 	 });
});
</script>
</head>
<body>
  <!-- 修改为用户导航条  易孝凡-->
	<jsp:include page="../base/userNav.jsp"></jsp:include>
	<div class="divcss">
	<div class="province_title" >按照省市查找</div>
		<div id="Province" style="folat:left">
		</div>
	</div>
	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>
