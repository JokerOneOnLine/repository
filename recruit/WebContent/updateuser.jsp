<%@ page language="java" isELIgnored="false"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath() + "/";
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<script type="text/javascript"> 
var ctx = <%=path%>;
console.log(1);
</script>
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<link media="handheld" rel="alternate">
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我的简历-蓝桥网-最专业的互联网招聘平台</title>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<link href="style/css/recruit_LQ.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>

<script type="text/javascript">
	KindEditor.ready(function(K) {
		var editor = K.editor({
			cssPath : '/plugins/code/prettify.css',
			uploadJson : 'base/jsp/upload_json.jsp',
			fileManagerJson : 'base/jsp/file_manager_json.jsp',
			allowFileManager : true,
		});
		K('#profile').click(function() {
			editor.loadPlugin('image', function() {
				editor.plugin.imageDialog({
					showRemote : false,
					imageUrl : K('#url3').val(),
					clickFn : function(url, title, width, height, border, align) {
						data = {
							"profile" : url,
							"date" : new Date()
						};
						u = "userController/updateUser";
						$.post(u, data, function() {
							alert("修改成功");


						})
						editor.hideDialog();
					}
				});
			});
		});
	});
</script>
</head>
<body>
	
	<div id="container">
		<div class="clearfix">
			<div class="content_l">
				<div class="profile_box" id="basicInfo">
					<span class="c_edit"></span>
					<!--end .basicShow-->
					<div class="basicEdit dn">
						<form action="userController/updateUser" 
							method="post">
							<table>
								<tbody>
									<tr>
										<td valign="top"><span class="redstar">*</span></td>
										<td><input type="text" placeholder="姓名" value=""
											name="name" id="name"></td>
										<td valign="top"></td>
										<td>
											<ul class="profile_radio clearfix reset">
												<li class="current">男<em></em> <input type="radio"
													checked="checked" name="gender" value="1">
												</li>
												<li>女<em></em> <input type="radio" name="gender"
													value="0">
												</li>
											</ul>
										</td>
										<%-- <td rowspan="5"><a id="profile">更新頭像<img src="${user.profile}"
					width="600px" height="170px"></a></td> --%>
									</tr>

									<tr>
										<td valign="top"><span class="redstar"></span></td>
										<td colspan="3"><input type="hidden" id="expectCity"
											value="" name="addr"> <input type="button"
											value="现居地，如：北京" id="select_expectCity"
											class="profile_select_287 profile_select_normal">
											<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity"
												style="display: none;">
												<dl>
													<dt>热门城市</dt>
													<dd>
														<span>北京</span> <span>上海</span> <span>广州</span> <span>深圳</span>
														<span>成都</span> <span>杭州</span>
													</dd>
												</dl>
												<dl>
													<dt>ABCDEF</dt>
													<dd>
														<span>北京</span> <span>长春</span> <span>成都</span> <span>重庆</span>
														<span>长沙</span> <span>常州</span> <span>东莞</span> <span>大连</span>
														<span>佛山</span> <span>福州</span>
													</dd>
												</dl>
												<dl>
													<dt>GHIJ</dt>
													<dd>
														<span>贵阳</span> <span>广州</span> <span>哈尔滨</span> <span>合肥</span>
														<span>海口</span> <span>杭州</span> <span>惠州</span> <span>金华</span>
														<span>济南</span> <span>嘉兴</span>
													</dd>
												</dl>
												<dl>
													<dt>KLMN</dt>
													<dd>
														<span>昆明</span> <span>廊坊</span> <span>宁波</span> <span>南昌</span>
														<span>南京</span> <span>南宁</span> <span>南通</span>
													</dd>
												</dl>
												<dl>
													<dt>OPQR</dt>
													<dd>
														<span>青岛</span> <span>泉州</span>
													</dd>
												</dl>
												<dl>
													<dt>STUV</dt>
													<dd>
														<span>上海</span> <span>石家庄</span> <span>绍兴</span> <span>沈阳</span>
														<span>深圳</span> <span>苏州</span> <span>天津</span> <span>太原</span>
														<span>台州</span>
													</dd>
												</dl>
												<dl>
													<dt>WXYZ</dt>
													<dd>
														<span>武汉</span> <span>无锡</span> <span>温州</span> <span>西安</span>
														<span>厦门</span> <span>烟台</span> <span>珠海</span> <span>中山</span>
														<span>郑州</span>
													</dd>
												</dl>
											</div></td>
									</tr>
									<tr>
										<td></td>
										<td colspan="3"><input type="submit" value="保 存"
											class="btn_profile_save"> <a
											class="btn_profile_cancel" href="javascript:;">取 消</a></td>
									</tr>
								</tbody>
							</table>
						</form>
						<!--end #profileForm-->
						 
						<div class="new_portrait">
							<div class="portrait_upload" id="portraitNo">
								<span>上传自己的头像</span>
							</div>
							<div class="portraitShow dn" id="portraitShow">
								<img width="120" height="120" src=""> <span>更换头像</span>
							</div>
							<input type="file" value="" title="支持jpg、jpeg、gif、png格式，文件小于5M"
								onchange="img_check(this,'userController/updateUser','headPic');"
								name="headPic" id="headPic" class="myfiles">
							<input type="hidden" id="headPicHidden" />
							<em> 尺寸：120*120px <br> 大小：小于5M
							</em> <span style="display:none;" id="headPic_error" class="error"></span>
						</div>
						<!--end .new_portrait-->
					</div>
					<!--end .basicEdit-->
				</div>
			</div>
			<!-------------------------------------弹窗lightbox ----------------------------------------->
			<script src="style/js/Chart.min.js" type="text/javascript"></script>
			<script src="style/js/profile.min.js" type="text/javascript"></script>
			<div id="profileOverlay"></div>
			<div class="" id="qr_cloud_resume" style="display: none;">
				<div class="cloud">
					<img width="134" height="134" src=""> <a class="close"
						href="javascript:;"></a>
				</div>
			</div>
			<script>
				$(function() {
					$.ajax({
						url : ctx + "/mycenter/showQRCode",
						type : "GET",
						async : false
					}).done(function(data) {
						if (data.success) {
							$('#qr_cloud_resume img').attr("src", data.content);
						}
					});
					var sessionId = "resumeQR" + 314873;
					if (!$.cookie(sessionId)) {
						$.cookie(sessionId, 0, {
							expires : 1
						});
					}
					$('#qr_cloud_resume .close').click(function() {
						$('#qr_cloud_resume').fadeOut(200);
						resumeQR = parseInt($.cookie(sessionId)) + 1;
						$.cookie(sessionId, resumeQR, {
							expires : 1
						});
					});
				});
			</script>
			<div class="clear"></div>
			<input type="hidden" value="97fd449bcb294153a671f8fe6f4ba655"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: none;"></a>
		</div>
	</div>
	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/popup.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			$('#noticeDot-1').hide();
			$('#noticeTip a.closeNT').click(function() {
				$(this).parent().hide();
			});
		});
		var index = Math.floor(Math.random() * 2);
		var ipArray = new Array('42.62.79.226', '42.62.79.227');
		var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
		var CallCenter = {
			init : function(url) {
				var _websocket = new WebSocket(url);
				_websocket.onopen = function(evt) {
					console.log("Connected to WebSocket server.");
				};
				_websocket.onclose = function(evt) {
					console.log("Disconnected");
				};
				_websocket.onmessage = function(evt) {
					//alert(evt.data);
					var notice = jQuery.parseJSON(evt.data);
					if (notice.status[0] == 0) {
						$('#noticeDot-0').hide();
						$('#noticeTip').hide();
						$('#noticeNo').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text('').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
					} else {
						$('#noticeDot-0').show();
						$('#noticeTip strong').text(notice.status[0]);
						$('#noticeTip').show();
						$('#noticeNo').text('(' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text(' (' + notice.status[0] + ')').show().parent('a').attr('href', ctx + '/mycenter/delivery.html');
					}
					$('#noticeDot-1').hide();
				};
				_websocket.onerror = function(evt) {
					console.log('Error occured: ' + evt);
				};
			}
		};
		CallCenter.init(url);
	</script>

	<div id="cboxOverlay" style="display: none;"></div>
	<div id="colorbox" class="" role="dialog" tabindex="-1"
		style="display: none;">

		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div>
	</div>
</body>
</html>