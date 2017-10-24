<%@ page language="Java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!--渭南师院二期  樊璐璐   创始团队界面  -->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
</script>
<jsp:include page="/base/companyNav.jsp"></jsp:include>
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>创始团队-招聘服务-蓝桥网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网">
<meta name="keywords"
	content="蓝桥,蓝桥网,蓝桥招聘,拉钩, 拉钩网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
	var ctx = "http://www.lagou.com";
	console.log(1);
</script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<script src="style/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="style/js/jquery.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<script type="text/javascript">
	function check(form) {
		if (form.founderSurface1.value == '') {
			alert("请上传创始人图像!");
			form.founderSurface1.focus();
			return false;
		}
		if (form.founder.value == '') {
			alert("请输入创始人姓名!");
			form.founder.focus();
			return false;
		}
		if (form.position.value == '') {
			alert("请输入职务!");
			form.position.focus();
			return false;
		}
		if (form.founderInfo.value == '') {
			alert("请输入创始人简介!");
			form.founderInfo.focus();
			return false;
		}
		return true;
		$("#step3Submit").click(function() {
			location.href = "company/companyProduct.jsp";
		});
	}
	$("#up").uploadPreview({
			Img : "ImgPr",
			Width : 120,
			Height : 120,
			ImgType : [ "gif", "jpeg", "jpg", "bmp", "png" ],
			Callback : function() {}
		});
</script>


<!-- 图片的回显 zjh -->
<style type="text/css">
#preview {
	width: 180px;
	height: 183px;
	border: 1px solid gray;
	overflow: hidden;
}

#imghead {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
</style>

<script type="text/javascript">
	function previewImage(file) {
		var MAXWIDTH = 180;
		var MAXHEIGHT = 180;
		var div = document.getElementById('preview');
		if (file.files && file.files[0]) {
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginLeft = rect.left + 'px';
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else { //兼容IE
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
		}
	}

	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;
			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}
		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}
</script>

<body>
	<div id="body">

		<div id="container">

			<div class="content_mid">
				<dl class="c_section c_section_mid">
					<dt>
						<h2>
							<em></em>填写公司信息
						</h2>
						<br>
					</dt>
					<dd>
						<div class="c_text">展示强劲的创始团队，让求职者跟随而来吧！</div>
						<img width="668" height="56" class="c_steps" alt="我的图像"
							src="style/images/step3.png">
						<!-- 表单 -->
						<form method="post"
							action="CompanyEnterTeamController/insertEnterTeamToCompany"
							id="memberForm" enctype="multipart/form-data">
							<div class="new_portrait">
							<div id="preview" class="portrait_upload" >
						    <img id="imghead" border=0 src="style/images/111.png" width="154" height="207" /><span>上传创始人头像</span>
							</div>
							<input name="founderSurface1" id="up" type="file" onchange="previewImage(this)" />
							 </div>
							<h3>创始人姓名</h3>
							<input type="text" placeholder="请输入创始人姓名" name="founder"
								id="founder" class="s_input1 valid">
							<h3>当前职位</h3>
							<input type="text" placeholder="请输入当前职位，如：创始人兼CEO"
								name="position" id="position" class="s_input1 valid">

							<h3>新浪微博</h3>
							<input type="text" placeholder="请输入创始人新浪微博地址" name="microBlog"
								id="microBlog">

							<h3>创始人简介</h3>
							<textarea placeholder="请输入该创始人的个人履历等，建议按照时间倒序分条展示"
								maxlength="1000" name="founderInfo" id="founderInfo"></textarea>
							<div class="word_count">
								你还可以输入 <span>500</span> 字
							</div>
							<div class="clear"></div>
							<input type="submit" form="memberForm" value="保存，下一步"
								id="step3Submit" class="btn_big fr"
								onclick="return check(this.form)"> <a
								href="company/companyProduct.jsp" class="btn_cancel fr">跳过</a>
						</form>
						<!--表单结束  -->
					</dd>
				</dl>
			</div>


			<script src="style/js/step3.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="52346c62232045a8ab1d45cb3e0540b7"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: inline;"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a> <a
				target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
			<a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">蓝桥微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">蓝桥微信<i></i></a>
			<div class="copyright">
				&copy;2013-2014 Lagou <a
					href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
					target="_blank">京ICP备14023790号-2</a>
			</div>
		</div>
	</div>

	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>

	<!--  -->


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