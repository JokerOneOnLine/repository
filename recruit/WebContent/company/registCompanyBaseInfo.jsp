<%@ page language="Java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 程建波-企业基本信息填写页面 -->
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>企业基本信息</title>
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
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		//验证表单
		$("#stepForm").validate({
			rules : {
				companyName : {
					required : true,
				},
				companyAbb : {
					required : true,
				},
				companyLogo2 : {
					required : true,
				},
				companyUrl : {
					required : true,
					url : true
				},
				companyCity : {
					required : true,
				},
				companyDomain : {
					required : true,
				},
				introduction : {
					required : true,
				},
				companyInfo : {
					required : true,
				}
			},
			messages : {
				companyName : {
					required : "请填写公司全称"
				},
				companyAbb : {
					required : "请填写公司简称"
				},
				companyLogo2 : {
					required : "请上传公司logo"
				},
				companyUrl : {
					required : "请填写公司网址	",
					url : "这不是一个正确的网址"
				},
				companyCity : {
					required : "请填写所在城市	"
				},
				companyDomain : {
					required : "请填写行业领域	"
				},
				introduction : {
					required : "请填写一句话介绍	"
				},
				companyInfo : {
					required : "请填写公司介绍	"
				},
			}
		});
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

</head>
<body>
	<jsp:include page="/base/companyNav.jsp"></jsp:include>
	<div id="container">
		<div style="" id="stepTip">
			<a></a> <img width="803" height="59" src="style/images/tiponce.jpg">
		</div>
		<div class="content_mid">
			<dl class="c_section c_section_mid">
				<dt>
					<h2>
						<em></em>填写公司信息
					</h2>
				</dt>
				<dd>
					<form id="stepForm" action="baseInfo/insert" method="post"
						enctype="multipart/form-data">
						<div class="c_text_1">基本信息为必填项，是求职者加速了解公司的窗口，认真填写吧！</div>
						<img width="668" height="56" class="c_steps" alt="第一步"
							src="style/images/step1.png">
						<h3>公司全称</h3>
						<input type="text" placeholder="请输入公司全称" name="companyName"
							id="companyName">
						<h3>公司简称</h3>
						<!--非必填-->
						<input type="text" placeholder="请输入公司简称，如:蓝桥" name="companyAbb"
							id="companyAbb">
						<h3>公司LOGO</h3>
						<br>
						<!-- <div>
							<input type="file" name="companyLogo2" id="companyLogo2">
						</div> -->
						<div id="preview">
						 <img id="imghead" border=0 src="style/images/111.png" width="180" height="180" />
						</div>
						<input name="companyLogo2" id="companyLogo2" type="file" onchange="previewImage(this)" />
						
						<h3>公司网址</h3>
						<input type="text" placeholder="请输入公司网址" name="companyUrl"
							id="companyUrl">
						<h3>所在城市</h3>
						<input type="text" placeholder="请输入工作城市，如：北京" name="companyCity"
							id="companyCity">
						<h3>行业领域</h3>
						<input type="text" placeholder="请输入行业涉及领域" name="companyDomain"
							id="companyDomain">
						<h3>公司规模</h3>
						<div>
							<input type="hidden" value="" name="select_scale_hidden"
								id="select_scale_hidden"> <input type="button"
								value="请选择公司规模" name="scale" id="select_scale" class="select">
							<div class="dn" id="box_scale" style="display: none;">
								<ul class="reset">
									<li>少于15人</li>
									<li>15-50人</li>
									<li>50-150人</li>
									<li>150-500人</li>
									<li>500-2000人</li>
									<li>2000人以上</li>
								</ul>
							</div>
						</div>
						<h3>一句话介绍</h3>
						<input type="text" placeholder="一句话概括公司亮点，如公司愿景、领导团队等，限50字"
							maxlength="50" name="introduction" id="introduction">
						<h3>公司介绍</h3>
						<textarea placeholder="请分段详细描述公司简介、企业文化等" name="companyInfo"
							id="companyInfo"></textarea>
						<div class="word_count">
							你还可以输入 <span>1000</span> 字
						</div>
						<div class="clear"></div>
						<input type="submit" value="保存，下一步" class="btn_big fr">
					</form>
				</dd>
			</dl>
		</div>
		<script src="style/js/step1.min.js" type="text/javascript"></script>
		<script>
			var avatar = {};
			avatar.uploadComplate = function(data) {
				var result = eval('(' + data + ')');
				if (result.success) {
					jQuery('#logoShow img').attr("src", ctx + '/' + result.content);
					jQuery.colorbox.close();
					jQuery('#logoNo').hide();
					jQuery('#logoShow').show();
				}
			};
		</script>
		<div class="clear"></div>
		<input type="hidden" value="13ae35fedd9e45cdb66fb712318d7369"
			id="resubmitToken"> <a rel="nofollow" title="回到顶部"
			id="backtop" style="display: none;"></a>
	</div>
	<!-- end #container -->
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a> <a
				target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
			<a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">蓝桥微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">
				蓝桥微信<i></i>
			</a>
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