<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath() + "/";
%>
<!-- 艾尧 王笑 -杨璐(日期转换格式)-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	var ctx = "h";
	console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/colorbox.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.colorbox-min.js" type="text/javascript"></script>
<script src="style/js/myResume.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		getUserInfo();
		getHopejob();
		getPractice();
		getProject();
		getEducation();
	})
	//简历下载
	/* html2canvas(document.body, { //截图对象
		//此处可配置详细参数
		onrendered : function(canvas) { //渲染完成回调canvas
			canvas.id = "mycanvas";
			// 生成base64图片数据
			var dataUrl = canvas.toDataURL('image/png'); //指定格式，也可不带参数
			var formData = new FormData(); //模拟表单对象
			formData.append("imgData", convertBase64UrlToBlob(dataUrl)); //写入数据
			var xhr = new XMLHttpRequest(); //数据传输方法
			xhr.open("POST", "../bulletin/exportPdf"); //配置传输方式及地址
			xhr.send(formData);
			xhr.onreadystatechange = function() { //回调函数
				if (xhr.readyState == 4) {
					if (xhr.status == 200) {
						var back = JSON.parse(xhr.responseText);
						if (back.success == true) {
							alertBox({
								content : 'Pdf导出成功！',
								lock : true,
								drag : false,
								ok : true
							});
						} else {
							alertBox({
								content : 'Pdf导出失败！',
								lock : true,
								drag : false,
								ok : true
							});
						}
					}
				}
			};
		}
	});

	//将以base64的图片url数据转换为Blob
	function convertBase64UrlToBlob(urlData) {
		//去掉url的头，并转换为byte
		var bytes = window.atob(urlData.split(',')[1]);
		//处理异常,将ascii码小于0的转换为大于0
		var ab = new ArrayBuffer(bytes.length);
		var ia = new Uint8Array(ab);
		for (var i = 0; i < bytes.length; i++) {
			ia[i] = bytes.charCodeAt(i);
		}
		return new Blob([ ab ], {
			type : 'image/png'
		});
	} */
</script>
<script>
	$(function() {
		$("body").on("click", "a.btn_s", function() {
			$.colorbox.close();
			parent.jQuery.colorbox.close();
		});
		$(".inline").colorbox({
			inline : true
		});
	});
</script>
</head>
<body>
	<div id="previewWrapper">
	<input type="hidden" value="<%=request.getParameter("userId") %>" id="userId" name="userId">
		<div class="preview_header">
			<h1 id="titleName"></h1>
			<!-- <a title="下载简历" class="inline cboxElement"
				href="#downloadOnlineResume">下载该简历</a> -->
		</div>
		<div class="preview_content">
			<div class="profile_box" id="basicInfo">
				<h2>基本信息</h2>
				<div class="basicShow">
					<span class="c9" id="namespan"></span><br>
					<span class="c9" id="genderspan"></span><br>
					<span class="c9" id="birthspan"></span><br>
					<span class="c9" id="addrspan"></span><br>
					<span class="c9" id="telspan"></span><br>
					<span class="c9" id="decspan"></span>
					<%-- <span>${user.name}&nbsp;&nbsp;|&nbsp;&nbsp;<c:if
							test="${user.gender==1 }">男</c:if> <c:if
							test="${user.gender==0 }">女</c:if>&nbsp;| 出生年月：${user.strBirth }<br>
						居住地：${user.addr }<br>
						学历：${user.myResume.education.educational } ·
						${user.myResume.education.schoolName}<br>
						职位：${user.myResume.practice.position} ·
						${user.myResume.practice.company}<br> 工作经验：<fmt:formatDate
							value="${user.myResume.practice.starttime }" pattern="yyyy-MM" />至<fmt:formatDate
							value="${user.myResume.practice.endtime }" pattern="yyyy-MM" />
						<br> 邮箱：${user.email}
					</span><br> <span class="work_address">个人简介：</span><span>${user.declaration }</span> --%>
					<div class="m_portrait">
						<div></div>
						<img width="120" height="120" alt="jason"
							src="style/images/IMG_0664 (1).JPG">
					</div>
				</div>
			</div>
			<!--基本信息结束-->
			<div class="profile_box" id="workExperience">
				<h2>工作经历</h2>
				<div class="experienceShow">
					<ul class="wlist clearfix">
						<li class="noborder">
							<div id="prac">
								公司：<span class="c9" id="company"></span><br> 职位：<span
									class="c9" id="position"></span><br>
								<!-- 工作经验：<span class="c9" id="practiceTime"></span><br>  -->
								工作经验：<span class="c9" id="practiceTime"></span><br> 工作内容：<span
									class="c9" id="workContent"></span><br>
							</div>
						</li>
					</ul>
				</div>

			</div>
			<div class="profile_box" id="expectJob">
				<h2>期望工作</h2>
				<div class="expectShow" id="jobDiv">
					期望城市： <span class="c9" id="city"></span><br> 期望薪资：<span
						class="c9" id="salary"></span><br> 期望职位： <span class="c9"
						id="job"></span><br> 补充说明：<span class="c9" id="description"></span>
				</div>
			</div>
			<!--期望工作结束-->
			<div class="profile_box" id="projectExperience">
				<h2>项目经验</h2>
				<div class="projectShow">
					<ul class="plist clearfix">
						<li class="noborder">
							<div class="projectList">
								<div class="f16 mb10" id="proj">
									项目名称：<span class="c9" id="projName"></span><br> 项目经理：<span
										class="c9" id="projDuty"></span><br> 项目周期：<span
										class="c9" id="projTime"></span><br> 项目描述：<span
										class="c9" id="projDescription"></span>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<!--end .projectShow-->
			</div>
			<!--end #projectExperience-->
			<!--工作经历结束-->
			<div class="profile_box" id="educationalBackground">
				<h2>教育经历</h2>
				<div class="educationalShow">
					<ul class="elist clearfix">
						<li>
							<div id="edudiv">
								学校：<span class="c9" id="eduSchool"></span><br> 专业：<span
									class="c9" id="eduMajor"></span><br> 毕业时间：<span class="c9"
									id="eduTime"></span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<!--教育经历结束-->
		</div>
		<!--end .preview_content-->
	</div>
	<!--end #previewWrapper-->


	<!-------------------------------------弹窗lightbox ----------------------------------------->
	<div style="display: none;">
		<!-- 下载简历 -->
		<div class="popup" id="downloadOnlineResume">
			<table width="100%">
				<tbody>
					<tr>
						<td class="c5 f18">请选择下载简历格式：</td>
					</tr>
					<tr>
						<td>
							<!-- 
						<a class="btn_s"
							href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=1">word格式</a>
							<a class="btn_s"
							href="h/resume/downloadResume?key=1ccca806e13637f7b1a4560f80f08057&amp;type=2">html格式</a>
						 --> <a class="btn_s"
							href="downloadOnlineResume">pdf格式</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--/#downloadOnlineResume-->
	</div>
	<!------------------------------------- end ----------------------------------------->




	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">
		<div id="cboxWrapper">
			<div>
				<div id="cboxTopLeft" style="float: left;"></div>
				<div id="cboxTopCenter" style="float: left;"></div>
				<div id="cboxTopRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxMiddleLeft" style="float: left;"></div>
				<div id="cboxContent" style="float: left;">
					<div id="cboxTitle" style="float: left;"></div>
					<div id="cboxCurrent" style="float: left;"></div>
					<button type="button" id="cboxPrevious"></button>
					<button type="button" id="cboxNext"></button>
					<button id="cboxSlideshow"></button>
					<div id="cboxLoadingOverlay" style="float: left;"></div>
					<div id="cboxLoadingGraphic" style="float: left;"></div>
				</div>
				<div id="cboxMiddleRight" style="float: left;"></div>
			</div>
			<div style="clear: left;">
				<div id="cboxBottomLeft" style="float: left;"></div>
				<div id="cboxBottomCenter" style="float: left;"></div>
				<div id="cboxBottomRight" style="float: left;"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
</body>
</html>