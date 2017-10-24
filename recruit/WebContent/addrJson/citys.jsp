<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'citys.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		var areas;
		var purchaseCity = $('select[name="PurchaseCity"]'), purchaseProvince = purchaseCity.prev(), purchaseArea = $('select[name="PurchaseArea"]');
		$.ajax({
			async:false,
			cache:false,
			url:"testJson",
			success:function(data){
				alert(data);
				areas = eval("("+data+")");
				$.each(areas,function(idx,item){
					//alert(JSON.stringify(item));
					purchaseProvince.append('<option>' + item.name + '</option>');				
				});
			}
		});
		var province=null;
		purchaseProvince.change(function () {
			var p = $(this).val();
			purchaseCity.html('');
			$.each(areas,function(idx,item){
	         	if(p==item.name){
					province=item.city;
	         		$.each(item.city,function(id,items){
		               purchaseCity.append('<option>' + items.name + '</option>');
	         		})
	           	}
            });
        });
      	purchaseCity.change(function(){
      		var p =$(this).val();
      		purchaseArea.html('');
   			$.each(province,function(id,items){
    			if(p==items.name){
    				$.each(items.area,function(i,it){
    					purchaseArea.append('<option>' + it + '</option>');
    				})
    			}
   			})
     	})  
	})
</script>	
 </head>
  
  <body>
   	<label>
       <span>公司地点</span>
       <select name="PurchaseProvince" style="width: auto"></select>
       <select name="PurchaseCity" style="width: auto"></select>
       <select name="PurchaseArea" style="width: auto"></select>
  	</label>
  </body>
</html>
