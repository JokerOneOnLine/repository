<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script async="" src="style/js/analytics.js"></script>
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>我发布的职位-招聘服务-蓝桥网-最专业的互联网招聘平台</title>
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
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript" src="style/js/jquery.validate.min.js"></script>
<link href="style/bootstrap-3.3.7-dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="style/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
	<div id="body">

		<jsp:include page="/base/companyNav.jsp"></jsp:include>
		<div id="container">
			<div class="sidebar">
			   <a class="btn_create" href="company/post.jsp">发布新职位</a>
				<dl class="company_center_aside">
					<dt>我发布的职位</dt>
					<dd class="current">
						<a href="getAll?pageNo=1&online=1">有效职位</a>
					</dd>
					<dd>
						<a href="getAll?pageNo=1&online=0">已下线职位</a>
					</dd>
				</dl>
			</div>
			<!-- end .sidebar -->
			<div class="content">
				<dl class="company_center_content">
					<dt>
						<h1>
							<em></em> 已下线职位 <span>（共<i
								style="color: #fff; font-style: normal" id="positionNumber">${pageinfo.total}</i>个）
							</span>
						</h1>
					</dt>
					<dd>
						<form id="searchForm">
							<input type="hidden" value="Publish" name="type">
							<ul class="reset my_jobs">
								<li data-id="149594"><c:forEach items="${pageinfo.list}"
										var="p">
										<h3>

											<a target="_blank" title="职位：${p.p2Name }"
												href="http://www.lagou.com/jobs/149594.html">职位：${p.p2Name }-${p.p3Name }</a><br>

										</h3>
										<!--<span class="receivedResumeNo"><a href="unHandleResumes.html?positionId=149594">应聘简历（1）</a></span>-->


										<div>工作类型：${ p.jobCategory} /薪资范围： ${p.minSalary }-${p.maxSalary }/工作经验：
											${p.workName } /学历： ${p.eName } 工作地点：${p.workCity }</div>
										<div class="c9">发布时间：${p.strDate }</div>
										<div class="links">
											<!--<a class="job_refresh" href="javascript:void(0)">刷新<span>每个职位7天内只能刷新一次</span></a>-->
											<!--<a target="_blank" class="job_edit" href="create.html?positionId=149594">编辑</a>-->
											<a href="updateOnline?online=1&id=${p.id }">上线</a> <a class="job_del"
												href="delete?online=${p.online }&id=${p.id } ">删除</a>
										</div>
									</c:forEach></li>
							</ul>
							<c:if test="${empty pageinfo.list }">
							<div class="container" style="height: 500px;width: 744px">
							<img alt="这里是空的呢!" src="imags/Null.png" height="500px" width="700px">
							</div>

						</c:if>
						</form>
						</dd>
						</dl>
						
						<c:if test="${!empty pageinfo.list }">
							<div class="container">
								<div class="col-md-8">
									<div class="col-xs-5" style="top: 30px">
										<span style="font-size: 15px; color: green">当前页码为
											${pageinfo.pageNum } 页 总共 ${pageinfo.pages } 页 </span>
									</div>
									<div class="col-xs-7">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<li><a href="getAll?pageNo=1&online=1">首页</a></li>
												<c:if test="${pageinfo.hasPreviousPage }">
													<li><a
														href="getAll?pageNo=${pageinfo.pageNum-1}&online=1"
														aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
													</a></li>

												</c:if>
												<c:forEach items="${pageinfo.navigatepageNums }"
													var="current">
													<c:if test="${pageinfo.pageNum==current}">
														<li class="active"><a href="javascript:void(0)">${current }</a></li>

													</c:if>
													<c:if test="${pageinfo.pageNum!=current}">
														<li><a href="getAll?pageNo=${current}&online=1">${current }</a></li>

													</c:if>

												</c:forEach>
												<c:if test="${pageinfo.hasNextPage }">
													<li><a
														href="getAll?pageNo=${pageinfo.pageNum+1}&online=1"
														aria-label="Next"> <span aria-hidden="true">&raquo;</span>
													</a></li>
												</c:if>
												<li><a href="getAll?pageNo=${pageinfo.pages }&online=1">末页</a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
							<!-- end .content -->
							<script src="style/js/job_list.min.js" type="text/javascript"></script>
							<div class="clear"></div>
							<input type="hidden" value="74fb1ce14ebf4e2495270b0fbad64704"
								id="resubmitToken">
							<a rel="nofollow" title="回到顶部" id="backtop"></a>
			</div>

			<!-- end #container -->
		</div>
	</div>
	</c:if>

						<!-- end .content -->
						<script src="style/js/job_list.min.js" type="text/javascript"></script>
						<div class="clear"></div>
						<input type="hidden" value="74fb1ce14ebf4e2495270b0fbad64704"
							id="resubmitToken"> <a rel="nofollow" title="回到顶部"
							id="backtop"></a>
			</div>
			<!-- end #container -->
		</div>
		<!-- end #body -->
		<div id="footer">
			<div class="wrapper">
				<a rel="nofollow" target="_blank" href="http://lanqiao.org/about.html">联系我们</a>
		        <a
				target="_blank" href="http://www.lanqiao.org">互联网公司导航</a>
			<a rel="nofollow" target="_blank" href="http://weibo.com/u/6080568972">蓝桥微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">蓝桥微信<i></i></a>
			
			</div>
		</div>

		<script src="style/js/core.min.js" type="text/javascript"></script>
		<script src="style/js/popup.min.js" type="text/javascript"></script>
		<script src="style/js/tongji.js" type="text/javascript"></script>
		<!--  -->
		<script src="style/js/analytics01.js" type="text/javascript"></script>
		<script type="text/javascript" src="style/js/h.js"></script>
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
							$('#noticeNo').text('').show().parent('a').attr(
									'href', ctx + '/mycenter/delivery.html');
							$('#noticeNoPage').text('').show().parent('a')
									.attr('href',
											ctx + '/mycenter/delivery.html');
						} else {
							$('#noticeDot-0').show();
							$('#noticeTip strong').text(notice.status[0]);
							$('#noticeTip').show();
							$('#noticeNo').text('(' + notice.status[0] + ')')
									.show().parent('a').attr('href',
											ctx + '/mycenter/delivery.html');
							$('#noticeNoPage').text(
									' (' + notice.status[0] + ')').show()
									.parent('a').attr('href',
											ctx + '/mycenter/delivery.html');
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