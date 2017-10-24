<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userinfo.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="myresume/css/bootstrap.min.css">
<script type="text/javascript" src="myresume/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="myresume/js/addForm.js"></script>
</head>
<body>
<jsp:include page="/base/userNav.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="" >
					<img alt="" src="myresume/image/resume-head.png" width="680" height="160">
					<hr>
					<div align="center"><span>实习经历</span><span class="btn btn-link" id="addPractice">添加</span></div>
					
				</div>
				<hr>
				<div class="">
					<div align="center"><span>教育经历</span><span class="btn btn-link" id="addEducation">添加</span></div>
				
				</div>
				<hr>
				<div class="">
					<div align="center"><span>期望工作</span><span class="btn btn-link" id="addExpection">添加</span></div>
					<form action="" method="post" >
					期望职位:
					<input type="text" name="company" value="" ><span id="jobSearch">搜索</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select>
						<option>全职</option>
						<option>兼职</option>
						<option>实习</option>
					</select><br><br>
					技术
					后端开发 ：<input type="checkbox" name="checkbox1" value="checkbox"> 1
					<input type="checkbox" name="checkbox2" value="checkbox"> 2
					<input type="checkbox" name="checkbox3" value="checkbox"> 3
					<input type="checkbox" name="checkbox4" value="checkbox">4  <br> <br>
					期望月薪:
					<select>
						<option>2k以下</option>
						<option>2k-5k</option>
						<option>5k-10k</option>
						<option>10k-15k</option>
						<option>25k-50k</option>
						<option>50k以上</option>
					</select><br><br>
					期望城市：
					<select>
						<option>北京</option>
						<option>上海</option>
						<option>西安</option>
						<option>--</option>
						<option>--</option>
					</select><br><br>
					补充说明：<br>
					<textarea rows="5" cols="20"width="680px"></textarea><br><br>
					<input type="submit" value="保存" class="btn btn-default"><button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
					</form>
				</div>
			</div>
			<div class="col-md-4">
				<div>投递箱</div>
				<div>
					上传简历<a href="yulan.jsp ">预览简历</a>
				</div>
				<div>进度条</div>
				<div class="row-md-4">
					<a href="myresume/user.jsp">基本信息</a><br> <a href="">工作经历</a><br>
					<a href="">实习经历</a><br> <a href="">期望工作</a><br>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
