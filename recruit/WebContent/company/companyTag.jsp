<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<!-- 渭南师范二期  张金浩     内容；注册公司时公司标签 -->
<title>选择公司标签</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
<body>
	<jsp:include page="../base/userNav.jsp"></jsp:include>
		<!-- end #header -->
		<div id="container">

			<div class="content_mid">
				<dl class="c_section c_section_mid">
					<dt>
						<h2>
							<em></em>填写公司信息
						</h2>
						<a class="c_addjob" href="create.html"><i></i>发布新职位</a>
					</dt>
					<dd id="step2Form">
						<div class="c_text">简短明了的标签信息让求职者更加方便检索，更快找到你们！</div>
						<img width="668" height="56" class="c_steps" alt="第二步"
							src="style/images/step2.png">

						<h3>已添加标签</h3>
						<ul class="reset" id="labels">
						</ul>

						<input type="text" placeholder="请输入自定义标签" name="label" id="label">
						<input type="submit" value="贴上" id="add_label">
						<div class="clear"></div>

						<div id="box_labels">
							<dl>
								<dt>薪酬激励</dt>
								<dd>
									<ul class="reset">
										<li>年终分红</li>
										<li>绩效奖金</li>
										<li>股票期权</li>
										<li>专项奖金</li>
										<li>年底双薪</li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt>员工福利</dt>
								<dd>
									<ul class="reset">
										<li>五险一金</li>
										<li>通讯津贴</li>
										<li>交通补助</li>
										<li>带薪年假</li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt>员工关怀</dt>
								<dd>
									<ul class="reset">
										<li>免费班车</li>
										<li>节日礼物</li>
										<li>年度旅游</li>
										<li>弹性工作</li>
										<li>定期体检</li>
										<li>午餐补助</li>
									</ul>
								</dd>
							</dl>
							<dl>
								<dt>其他</dt>
								<dd>
									<ul class="reset">
										<li>岗位晋升</li>
										<li>技能培训</li>
										<li>管理规范</li>
										<li>扁平管理</li>
										<li>领导好</li>
										<li>美女多</li>
										<li>帅哥多</li>
									</ul>
								</dd>
							</dl>
						</div>
						<input type="hidden" id="companyId" name="companyId" value="25927">
						<input type="button" value="保存，下一步" id="step2Submit"
							class="btn_big fr"> <a class="btn_cancel fr"
							href="founder.html">跳过</a>

					</dd>
				</dl>
			</div>
			<!-- 获取标签并将其发送到后台 -->
			<script>
				$("#step2Submit").click(function() {
					/* location.href = "founder.html"; */
					var tagList = [];
					var tags = $(".reset").children("li").children("span");
					for (var i = 0; i < tags.length; i++) {
						tagList[i] = $(tags[i]).text();
					}
					//alert(tagList)
					var url = "tag/insertTag";
					if (tags.length == 0) {
						location.href = "company/CompanyEnterTeam.jsp";
					} else {
						$.ajax({
							url : url,
							data : {
								"tagList" : tagList
							},
							type : "POST",
							traditional : true,
							success : function(data) {
								if (data != "") {
									alert(data.msg);
									return false;
								}
							}
						});
						location.href = "company/CompanyEnterTeam.jsp";
					}
				})
			</script>
			<script src="style/js/step2.min.js" type="text/javascript"></script>
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken"> <a
				rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
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