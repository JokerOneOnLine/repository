<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function(){ 
		var flag=true;
		$("#btn").click(function(){
			var email=$("#emailinput").val();
			var url="UserServlet/getVCode";
			var args={email:email,date:new Date()};
			//$("#emailinput").attr("disabled","disabled");/*"readonly","readonly"*/
			$.post(url,args);
			return false;
		});
		$("#vcodeinput").blur(function(){
			var vCode=$(this).val();
			var url="UserServlete/checkVCode";
			var args={vCode:vCode}
			if(vCode==""){
				return false;
			}
			$.ajax({
				async:false,
				url:url,
				type:"post",
				data:args,
				cache:false,
				success:function(data){
					alert(data);
					if(data==1){
						flag=true;
					}else{
						flag=false;
					}			
				}
			});
		});
		$("#submit").click(function(){
			if(!flag){
			alert("请正确验证邮箱");
			return flag;
			}
			return flag;
		});
	});

</script>
  </head>
  <body>
    			<div class="modal-body">
    			<h2 style="text-align: center">找回密码</h2>
					<form class="form" action="UserServlet/findPwd" method="post" id="retrieveform">
								<div class="form-group">
								      <label for="nameinput">同户名</label>
								      <input type="text" name="name"class="form-control" >
							    </div>
							    <div class="form-group">
								      <label for="emailinput">邮箱</label>
								      <input type="text" name ="email"class="form-control input-md" id="emailinput" value="${user.email }" >
							    </div>
							    <div class="form-group">
								     <label for="vcodeinput">验证码</label>
								     <input type="text" name ="vcode"id="vcodeinput" class="form-control input-sm">
								     <button type="button" id="btn" class="btn btn-defult">获取验证码</button> 
							     </div>
							    <div class="form-group">
								      <label for="pwdInput">请输入新密码</label>
								      <input type="password" name="pwd"class="form-control" >
							    </div>
							    <div class="form-group">
								      <label for="pwdInput">请确认密码</label>
								      <input type="password" name="pwd2"class="form-control" >
							    </div>
					</form>
			</div> 
			<div class="modal-footer"> 
				<button type="submit" id="retrieveButton"form="retrieveform"class="btn btn-info" >确定</button> 
				<button type="button" class="btn btn-primary"data-dismiss="modal">取消</button> 
			</div> 
  </body>
</html>
