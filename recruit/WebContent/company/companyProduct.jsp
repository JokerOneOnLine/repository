<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- 
	高瑞
	
	增加公司产品

 -->


<!DOCTYPE HTML >
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
-->
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>公司产品-招聘服务-蓝桥网-最专业的互联网招聘平台</title>
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
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
</head>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function() {
		//验证表单
		$("#productForm").validate({
			rules : {
				poster2 : {
					required : true,
				},
				productName : {
					required : true,
				},
				productUrl : {
					required : true,
					url : true
				},
				productInfo : {
					required : true,
				}
			},
			messages : {
				poster2 : {
					required : "必须上传产品海报"
				},
				productName : {
					required : "必须有产品名称"
				},
				productUrl : {
					required : "必须有产品地址	",
					url : "这不是一个正确的网址"
				},
				productInfo : {
					required : "必须有产品介绍	"
				},
			}
		});
	});
	$("#step4Submit").click(function() {
		location.href = "company/CompanyWating.jsp";
	});
</script>
<style type="text/css">
        #preview{
            width: 180px;
            height: 183px;
            border: 1px solid gray;
            overflow: hidden;
        }
        #imghead{
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
                img.onload = function () {
                    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                    img.width = rect.width;
                    img.height = rect.height;
                    img.style.marginLeft = rect.left+'px';
                    img.style.marginTop = rect.top + 'px';
                }
                var reader = new FileReader();
                reader.onload = function (evt) {
                    img.src = evt.target.result;
                }
                reader.readAsDataURL(file.files[0]);
            }else{  //兼容IE
                var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
                file.select();
                var src = document.selection.createRange().text;
                div.innerHTML = '<img id=imghead>';
                var img = document.getElementById('imghead');
                img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
                div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
            }
        }

        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight ){
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                if( rateWidth > rateHeight ){
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else{
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
	<jsp:include page="/base/companyNav.jsp"></jsp:include>
	<div id="body">

		<div id="container">

			<div class="content_mid">
				<dl class="c_section c_section_mid">
					<dt>
						<h2>
							<em></em>填写公司信息
						</h2>
						<!-- 跳转到职位管理页面 -->

					</dt>
					<dd>
						<br>
						<div class="c_text">目标明确、前途光明的产品是吸引求职者的制胜法宝哦！</div>

						<img width="668" height="56" class="c_steps" alt="第四步"
							src="style/images/step4.png">

						<form method="post"
							action="companyProductController/insertCompanyProduct"
							id="productForm" enctype="multipart/form-data">

							<div id="productDiv">

								<div class="formWrapper">
									<h3>产品海报(必填)</h3>
									<!-- <input type="file" id="poster" name="poster2"> -->
									<div id="preview">
								 <img id="imghead" border=0 src="style/images/111.png" width="180" height="180" />
									</div>
								<input id="poster" name="poster2" type="file" onchange="previewImage(this)" />
									

									<h3>产品名称</h3>
									<input type="text" placeholder="请输入产品名称" name="productName"
										id="productName">

									<h3>产品地址</h3>
									<input type="text"
										placeholder="请输入产品主页URL或产品下载地址(比如:http://baidu.com)"
										name="productUrl" id="productUrl">

									<h3>产品简介</h3>
									<textarea placeholder="请简短描述该产品定位、产品特色、用户群体等" maxlength="1000"
										name="productInfo" id="productInfo"></textarea>
									<div class="word_count">
										你还可以输入 <span>500</span> 字
									</div>
								</div>
							</div>

							<div class="clear"></div>
							<input type="submit" value="保存,完成" id="step4Submit"
								class="btn_big fr">

						</form>
					</dd>
				</dl>
			</div>

			<script src="style/js/step4.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="8f79f658e49846ae89d90a3f1590f12e"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: none;"></a>
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
		<jsp:include page="../base/footer.jsp"></jsp:include>

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





