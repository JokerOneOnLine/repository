<%@ page language="java" isELIgnored="false"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String path =request.getContextPath() +"/";%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href ="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<script>   
		var i =6;  //这里是倒计时的秒数  
		var intervalid;   
		intervalid = setInterval("cutdown()", 1000);   
		function cutdown() {   
			if (i == 0) {   
				window.location.href = "index.jsp"; //倒计时完成后跳转的地址  
				clearInterval(intervalid);   
			}   
			document.getElementById("mes").innerHTML = i;   
			i--;   
		}  
		window.onload = cutdown;  
	</script> 
	
	<div class = "outer">
		<p align="center">
			${msg}<span id="mes"></span> 秒后转至回首页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button"  value="返回" onclick="javascript:window.history.back(-1);">
		</p>
	</div>
</body>
</html>