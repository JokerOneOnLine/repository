<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'updatePwd.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<script src="style/js/conv.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#updatePswForm").validate({
			rules : {
		oldpassword : {
					required : true,
					rangelength : [ 6, 16 ],
				  	remote:{                                          
             			type:"POST",
            			url:"userController/checkPsw",             
            			data:{
               				name:function(){
               				return $("#oldpassword").val();
               				}
		               	  } 
		               } 
					},
		newpassword : {
					required : true,
					rangelength : [ 6, 16 ]
					},
		comfirmpassword : {
					required : true,
					rangelength : [ 6, 16 ],
					equalTo: "#newpassword"
					},
			},
			messages : {
				oldpassword : {
					required : "请输入原密码",
					rangelength : "请输入6-16位密码，字母区分大小写",
					remote:jQuery.format("密码错误")
				},
				newpassword : {
					required : "请输入新密码",
					rangelength : "请输入6-16位密码，字母区分大小写"
				},
				comfirmpassword : {
					required : "请再次输入",
					rangelength : "请输入6-16位密码，字母区分大小写",
					equalTo: "请再次输入相同的值"
				},
			},
		});
	})
</script>
  <body>
  	<jsp:include page="base/userNav.jsp"></jsp:include>
  	 <div id="container">
        <div class="user_bindSidebar">
    		<dl id="user_sideBarmenu" class="user_sideBarmenu">
     	        <dt>
     	        	<h3>帐号设置</h3>
     	        </dt>
        		<dd><a class="hover" href="updatePwd.jsp">修改密码</a></dd>
            </dl>
		</div>
		<input type="hidden" id="hasSidebar" value="1">	
		<div class="content user_modifyContent">
        		<dl class="c_section">
            		<dt>
            			<h2>修改密码</h2>
            		</dt>
            		<dd>
            		<form id="updatePswForm" action="userController/updatePsw" method="post">
            			<table class="savePassword">
	            			<tbody>
		            			<tr>
		            				<td>登录邮箱</td>
		            				<td class="c7">${email }</td>
		            			</tr>
		            			<tr>
		            				<td class="label">当前密码</td>
		            				<td>
		            					<input type="password" maxlength="16" id="oldpassword" name="oldpassword" style="background-image: url(style/images/img/0CQnd2Jos49xUAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;">
		            					<span id="updatePwd_beError" style="display:none;" class="error"></span>
		            				</td>            				
		            			</tr>
		            			<tr>
		            				<td class="label">新密码</td>
		            				<td><input type="password" maxlength="16" id="newpassword" name="newpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
		            			</tr>
		            			<tr>
		            				<td class="label">确认密码</td>
		            				<td><input type="password" maxlength="16" id="comfirmpassword" name="comfirmpassword" style="background-image: url(style/images/img/a6y3y0Wx5kbFHvGuXzkgf0xhKnPzA4UTyaTB8Ph8AvcHi3fnsrZ7Wore02YViqVOrRXXPhfqP8j6MYlawoAAAAASUVORK5CYII=quot); background-repeat: no-repeat; background-attachment: scroll; background-position: right center;"></td>
		            			</tr>
		            			<tr>
		            				<td>&nbsp;</td>
		            				<td><input type="submit" value="保 存"></td>
		            			</tr>
	            			</tbody>
            			</table>
					</form>
				</dd>
        	</dl>
    	</div>
    </div>
  </body>
</html>