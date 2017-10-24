<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<link type="text/css" rel="stylesheet" href="myresume/css/bootstrap.css">
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>已投简历状态</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网">
<meta name="keywords"
	content="蓝桥,蓝桥网,蓝桥招聘,蓝桥, 蓝桥网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">


<!-- ---------------------------分页------------ ------------------->
<!-- <script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
 -->

<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
	var ctx = "h";
	console.log(1);
</script>
<link href="h/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<link href="style/css/recruit_LQ.css" type="text/css" rel="stylesheet">
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
<script src="style/js/ajaxCross.json" charset="UTF-8"></script></head>
<body>
<jsp:include page="../base/userNav.jsp"></jsp:include>
<!-- end #header -->
    <div id="container">
        	  	
        <div class="clearfix">
            <div class="content_l">
            	<dl class="c_delivery">
                    <dt>
                        <h1><em></em>已投递简历状态</h1>
                        <a class="d_refresh" href="javascript:;">刷新</a>
                    </dt>
                    <dd>
                    	<div class="delivery_tabs">
                    		<ul class="reset">
								<li class="current">
                    				<a href="userController/getAllPost">全部</a>
                    			</li>
								<li>
                    				<a href="userController/getAllPost">投递成功</a>
                    			</li>
                    			<li>
                    				<a href="userController/getAllPost">被查看</a>
                    			</li>
                    			<li>
                    				<a href="userController/getAllPost">通过初筛</a>
                    			</li>
                    			<li>
                    				<a href="userController/getAllPost">通知面试</a>
                    			</li>
                    			<li >
                    				<a href="userController/getAllPost">不合适</a>
                    			</li>
                    		</ul>
                    	</div>
						<c:forEach items="${pars}" var="p">
                    		<c:forEach items="${p.posts}" var="pt">
						<form id="deliveryForm">
                            <ul class="reset my_delivery">
								<li>
                             		<div class="d_item">
										<h2 title="随便写">
	                                        <a target="_blank" href="http://www.lagou.com/jobs/149594.html">
	                                        	<em>${pt.position.name}</em> 
	                                        	<span>（${pt.minSalary}k-${pt.maxSalary}k）</span>
	                                        	<!--  -->
	                                    	</a>
	                                    </h2>
	                                    		                                <div class="clear"></div>
	                                   	<a title="公司名称" class="d_jobname" target="_blank" href="http://www.lagou.com/c/25927.html">
	                                   		公司名称： <span>${pt.companyBaseInfo.companyName}[${pt.workCity }]</span> 
	                                    </a>
	                                    <span class="d_time">${pt.date}</span>
	                                    <div class="clear"></div>
	                                    <div class="d_resume">
	                                    	工作类型：
	                                    	<span>
												${pt.jobCategory}
											</span>
	                                    </div>
											<a class="btn_showprogress" href="javascript:">
												不合适
											<i></i></a>
									</div>
									<div class="progress_status	dn">
										<ul class="status_steps">
                               				<li class="status_done status_1">1</li>
                               				<li class="status_line status_line_done"><span></span></li>
                               				<li class="status_done"><span>2</span></li>
                               				<li class="status_line status_line_done"><span></span></li>
                               				<li class="status_done"><span>3</span></li>
                               				<li class="status_line status_line_done"><span></span></li>
                               				<li class="status_done"><span>4</span></li>
                               			</ul>
                               			<ul class="status_text">
                           					<li>投递成功</li>
                           					<li class="status_text_2">简历被查看</li>
                           					<li class="status_text_3">通过初步筛选</li>
											<li style="margin-left: 75px;*margin-left: 60px;" class="status_text_4">不合适</li>
										</ul>
                               			<ul class="status_list">
											<li class="top">
                               					<div class="list_time"><em></em>2014-07-01 17:15</div>
                               					<div class="list_body">
												简历被lixiang标记为不合适<div>您的简历已收到，但目前您的工作经历与该职位不是很匹配，因此很抱歉地通知您无法进入面试。</div>                               						                               					</div>
                               				</li>
                               				<li class="bottom">
                               					<div class="list_time"><em></em>2014-07-01 17:08</div>
                               					<div class="list_body">
                               					lixiang已成功接收你的简历                               						                               					</div>
                               				</li>
                               			</ul>
                               			<a class="btn_closeprogress" href="javascript:;"></a>
                               		</div>
                               	</li>
                            </ul>
							<input type="hidden" value="-1" name="tag">
                        	<input type="hidden" value="" name="r">
                        </form>
                        </c:forEach>
                        </c:forEach>
                    </dd>
                </dl>
            </div>	
            
            
           
            
            
            
            <div class="content_r">
					<div class="mycenterR" id="myInfo">
						<h2>收藏夹</h2>
						<a target="_blank" href="user/collections.jsp" class="preview_resume">我收藏的职位</a>
					</div>
					<!--end #myInfo-->
					<!-- <div class="mycenterR" id="resumeSet">
						<h2>我的投递</h2>
						 <a class="d_refresh" href="javascript:;">投递箱</a>
						<a target="_blank" class="preview_resume" href="javascript:;" >投递箱</a>
					</div> -->
					<!--end #resumeSet-->
					<div class="mycenterR" id="myRecommend">
						<h2>
							可能适合你的职位 <i>匹配度</i>
						</h2>
						<ul class="reset">
							<li><a target="_blank"
								href="http://www.lagou.com/jobs/22194.html"> <span
									class="f16">产品经理</span> <span class="c7">广州百田</span> <em>92%</em>
							</a></li>
							<li><a target="_blank"
								href="http://www.lagou.com/jobs/148004.html"> <span
									class="f16">产品经理</span> <span class="c7">短讯神州</span> <em>92%</em>
							</a></li>
							<li><a target="_blank"
								href="http://www.lagou.com/jobs/46793.html"> <span
									class="f16">产品经理</span> <span class="c7">爱拍</span> <em>89%</em>
							</a></li>
							<li><a target="_blank"
								href="http://www.lagou.com/jobs/99307.html"> <span
									class="f16">产品经理</span> <span class="c7">一彩票</span> <em>88%</em>
							</a></li>
							<li><a target="_blank"
								href="http://www.lagou.com/jobs/147510.html"> <span
									class="f16">产品经理</span> <span class="c7">林安集团</span> <em>88%</em>
							</a></li>
						</ul>
						<a target="_blank"  href="user/position2.jsp">更多推荐职位&gt;&gt;</a>
					</div>
				</div><!--end #myRecommend-->
            </div>
       	</div>
      <input type="hidden" id="userid" name="userid" value="314873">
		<!--面试评价-->
<div class="dn" id="recordPopBox" >
	<dl>
		<dt>
			评价面试体验 
			<a class="boxclose" href="javascript:;"></a>
		</dt>
		<dd>
			<form id="recordForm">
				<input type="hidden" value="" id="recordId">
				<ul id="interviewResult" class="record_radio clearfix">
		            <li class="mr35">
		            	已收到offer
		              	<input type="radio" name="type" value="1"> 
		            </li>
		            <li>
		           	     未收到offer
		              	<input type="radio" name="type" value="2"> 
		            </li>
		        </ul>
		        <div class="dividebtm">
		        	<table>
		        		<tbody><tr>
                         	<td width="80" valign="top" align="right">面试评分：</td>
                         	<td>
                         		<ul id="recordStarSelect">
                         			<li></li>
                         			<li></li>
                         			<li></li>
                         			<li></li>
                         			<li></li>
                         		</ul>
                             	<input type="hidden" id="recordStar" value="" name="recordStar">
                             	<div class="clear"></div>
                            </td>
                        </tr>
                     	<tr>
                         	<td valign="top" align="right" class="dividebtman">面试短评：</td>
                         	<td>
                         		
                             	<input type="hidden" class="error" id="select_record_hidden" value="" name="record">
                                <input type="text" autocomplete="off" placeholder="15字以内对面试的简单描述哦" id="select_record" class="selectr_340" maxlength="15">                                      
                                <div class="boxUpDownan boxUpDown_340 dn" id="box_record" style="display: none;">
                                  <ul>
                                    <p>热门短评：</p>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                    <li></li>
                                  </ul>
                            	</div>
                            </td>
                        </tr>
                        <tr>
                         	<td valign="top" align="right" class="dividebtman">面试经历：</td>
                         	<td>
                         		<textarea id="interviewDesc" placeholder="记录下自己的面试经历" style="width: 320px;"></textarea>
                         		<div class="word_count">你还可以输入 <span>500</span> 字</div>
                         		<div id="showName" class="f14 c7">
                         			<label class="checkbox">
		                        		<input type="checkbox">
		                                <i></i>
		                        	</label>
                         			匿名提交
                         		</div>
                         		<input type="hidden" value="" id="isShowName">
                         		<input type="hidden" value="" id="senduid">
                         		<input type="hidden" value="" id="poid">
                         		<input type="hidden" value="" id="deid">
                            </td>
                        </tr>
                        <tr>
                         	<td align="right" colspan="2">
                         		<input type="submit" value="确认提交" class="submitRecord btn_small">
                         	</td>
                        </tr>
                	</tbody></table>
		        </div>
			</form>
		</dd>
	</dl>
</div>




 
            <!--------------------------------------分页---------------------------------->
           <%--  <div class="container">
		<div class="col-md-5" style="top: 30px">
			<span style="font-size: 15px; color: green">当前页码为 ${pageInfo.pageNum } 页 /总共 ${pageInfo.pages } 页 </span>
		</div>
		<div class="col-md-7">
			<nav aria-label="Page navigation">
				<ul ul class="pagination">
					<li><a href="userController/getAllPost?companyName=${companyName }&pageNum=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="userController/getAllPost?companyName=${companyName }&pageNum=${pageInfo.pageNum-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a>
						</li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="current">
						<c:if test="${pageInfo.pageNum==current}">
							<li class="active"><a
								href="javascript: void(0);">${current }</a></li>
						</c:if>
						<c:if test="${pageInfo.pageNum!=current}">
							<li><a href="userController/getAllPost?companyName=${companyName }&pageNum=${current }">${current }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="userController/getAllPost?companyName=${companyName }=&pageNum=${pageInfo.pageNum+1}"aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="userController/getAllPost?companyName=${companyName }&pageNum=${pageInfo.pages }">末页</a></li>
				</ul>
			</nav>
		</div>
</div>  --%>
            
            
            
            



<!-- end #recordPopBox -->
<script src="style/js/delivery.js"></script>
<script>
	$(function() {
		//location.reload(true);

		$('.Pagination').pager({
			currPage : 1,
			pageNOName : "pageNo",
			form : "deliveryForm",
			pageCount : 1,
			pageSize : 5
		});
	});
</script> 
			<div class="clear"></div>
			<input type="hidden" value="" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop" style="display: none;"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="about.html">联系我们</a>
		    <a target="_blank" href="http://www.lagou.com/af/zhaopin.html">互联网公司导航</a>
		    <a rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">蓝桥微博</a>
		    <a rel="nofollow" href="javascript:void(0)" class="footer_qr">蓝桥微信<i></i></a>
			<div class="copyright">&copy;2013-2014 Lagou <a href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action" target="_blank">京ICP备14023790号-2</a></div>
		</div>
	</div>

<script src="style/js/core.min.js" type="text/javascript"></script>
<script src="style/js/popup.min.js" type="text/javascript"></script>

<!--  -->

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

<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div></body></html>