<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'updatePwd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
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
<script>
	$(function(){
		$("#id").blur(function(){
		var id=$("#id").val();
		var ags={id:id};
		$.ajax({
				async : false,
				url : "myresume/getResumes",
				data : ags,
				type : "post",
				cache : false,
				success : function(d) {
					if(d!=0){
						showExperJob();
					}
				}
 			 })
		
		});
	})
	function showExperJob() {
		$("#aa").load("ajax/selectResumeByPost.jsp");
	}
</script>
</head>
<!-- 

获取所有简历并分页显示 刘如艳
 -->
  <body>
  <jsp:include page="../base/companyNav.jsp"></jsp:include>
   <div id="body">
	<div id="header">
    	<div class="wrapper">
    		
    		
			<dl class="collapsible_menu">
            	
				<dd style="display: none;"><a href="#">简历库</a></dd>
				<dd style="display: none;"><a href="collectionResume.html">人才库</a></dd>
				<dd class="btm" style="display: none;"><a href="myhome.html">我的公司主页</a></dd>
				<dd style="display: none;"><a href="jianli.html">我要找工作</a></dd>
				<dd style="display: none;"><a href="accountBind.html">帐号设置</a></dd>
				<dd class="logout" style="display: none;"><a rel="nofollow" href="login.html">退出</a></dd>
            </dl>
		</div>
    </div><!-- end #header -->
    <div id="container">
		<div class="sidebar">
		<!--<a class="btn_create" href="create.html">发布新职位</a>-->
		
	</div><!-- end .sidebar -->
            <div class="content" id="aa">
            	<dl class="company_center_content">
                    <dt>
                        <h1>
                            <em></em>
							全部简历  <span></span>
						</h1>
                    </dt>
                    <dd>
                    	<form action="canInterviewResumes.html" method="get" id="filterForm">
	                    	<div class="filter_actions">
								<label class="checkbox">
									<input type="checkbox">
									<i></i>
								</label>
								<span>全选</span>
								<a id="resumeRefuseAll" href="javascript:;">删除</a>
								<div id="filter_btn" class="">筛选简历 <em class=""></em></div>
							</div><!-- end .filter_actions -->
							<div class="filter_options  dn "  style="display: none;">
								<dl>
									 <dd>
										应聘职位：<input type="text" name="name" id="id"  value="${p.p3Name}">
										<input type="hidden" value="-1" name="resumeStatus">
									 </dd>
							 	</dl>
						 	</div><!-- end .filter_options -->
							<ul class="reset resumeLists">
						<c:forEach items="${page.list}" var="par">
										 <c:forEach items="${par.postAndResumes}" var="re">
										 
										 		<c:forEach items="${re.resumes}" var="resume">
										 		
										 		
										 		
										 			<li data-id="1686182" class="onlineResume">
									<label class="checkbox">
										<input type="checkbox">
										<i></i>
									</label>
									<div class="resumeShow">
										<a title="预览在线简历" target="_blank" class="resumeImg" href="preview.html">
											<img src="style/images/IMG_0664 (1).JPG">
										</a>
										<div class="resumeIntro">
											<h3 class="unread">
												<a target="_blank" title="预览${resume.user.name}的简历" href="myresume/show.jsp?userId=${resume.user.id }">
													${resume.user.name}的简历
												</a>
												<em></em>
											</h3>
											<div>
												应聘者姓名： ${resume.user.name} /性别： ${resume.user.gender==0?"女":"男"} /学历： ${resume.user.educationName} / 工作经验： ${resume.user.workName} / 现住址：${resume.user.addr}			                                            			                                        		<br>
													实习工作职位：${resume.practice.position} ·实习公司： ${resume.practice.company} |实习学历要求：${resume.education.educational}  · 学校：${resume.education.schoolName}
											</div>
											<div class="jdpublisher">
												<span>
													应聘职位：<a title="${resume.hopeJob.jobType}" target="_blank" href="http://www.lagou.com/jobs/149594.html">${resume.hopeJob.jobType}</a>
												</span>
											</div>
										</div>
									</div>
									<div class="contactInfo">
										<span class="c9">电话：${resume.user.tel}</span>  &nbsp;&nbsp;&nbsp;
										<span class="c9">邮箱：</span><a href="mailto:888888888@qq.com">${resume.user.email}</a>
									</div>
								</li>
										 		
										 		</c:forEach>
										 
										</c:forEach> 	
								</c:forEach>
							</ul><!-- end .resumeLists -->
						</form>
                    </dd>
                </dl><!-- end .company_center_content -->
            </div><!-- end .content -->
 

<!------------------------------------- end -----------------------------------------> <script src="style/js/jquery.ui.datetimepicker.min.js" type="text/javascript"></script>
<script src="style/js/received_resumes.min.js" type="text/javascript"></script> 
<script> 
</script>  
			<div class="clear"></div>
			<input type="hidden" value="b4bc225f0d084ee5b8d045f9c98a49ff" id="resubmitToken">
	    	<a rel="nofollow" title="回到顶部" id="backtop"></a>
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
$(function(){
	$('#noticeDot-1').hide();
	$('#noticeTip a.closeNT').click(function(){
		$(this).parent().hide();
	});
});
var index = Math.floor(Math.random() * 2);
var ipArray = new Array('42.62.79.226','42.62.79.227');
var url = "ws://" + ipArray[index] + ":18080/wsServlet?code=314873";
var CallCenter = {
		init:function(url){
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
				if(notice.status[0] == 0){
					$('#noticeDot-0').hide();
					$('#noticeTip').hide();
					$('#noticeNo').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text('').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
				}else{
					$('#noticeDot-0').show();
					$('#noticeTip strong').text(notice.status[0]);
					$('#noticeTip').show();
					$('#noticeNo').text('('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
					$('#noticeNoPage').text(' ('+notice.status[0]+')').show().parent('a').attr('href',ctx+'/mycenter/delivery.html');
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
<%--  
<div id="cboxOverlay" style="display: none;"></div><div id="colorbox" class="" role="dialog" tabindex="-1" style="display: none;"><div id="cboxWrapper"><div><div id="cboxTopLeft" style="float: left;"></div><div id="cboxTopCenter" style="float: left;"></div><div id="cboxTopRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxMiddleLeft" style="float: left;"></div><div id="cboxContent" style="float: left;"><div id="cboxTitle" style="float: left;"></div><div id="cboxCurrent" style="float: left;"></div><button type="button" id="cboxPrevious"></button><button type="button" id="cboxNext"></button><button id="cboxSlideshow"></button><div id="cboxLoadingOverlay" style="float: left;"></div><div id="cboxLoadingGraphic" style="float: left;"></div></div><div id="cboxMiddleRight" style="float: left;"></div></div><div style="clear: left;"><div id="cboxBottomLeft" style="float: left;"></div><div id="cboxBottomCenter" style="float: left;"></div><div id="cboxBottomRight" style="float: left;"></div></div></div><div style="position: absolute; width: 9999px; visibility: hidden; display: none;"></div></div><div class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" id="ui-datepicker-div"></div>
  </body>
  
  
   <div class="row">
  <div class="col-md-6"><span>第${page.pageNum}页/共${page.pages}</span></div>
  <div class="col-md-6"><nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="myresume/getPage?pageNum=1">首页</a></li>
 
    <li>
    <c:if test="${page.hasPreviousPage}">
      <a href="myresume/getPage?pageNum=${page.pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
      </c:if>
    </li>
    
    <c:forEach items="${page.navigatepageNums}" var="current">
   
 
   <c:if test="${page.pageNum==current}">
    <li class="active"><a href="#">${current}</a></li>
    </c:if>
    
    <c:if test="${page.pageNum!=current}">
    <li><a href="myresume/getPage?pageNum=${current}">${current }</a></li>
    </c:if>
     
     
    </c:forEach>
    <li>
     <c:if test="${page.hasNextPage}">
      <a href="myresume/getPage?pageNum=${page.pageNum+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      </c:if>
      </li>
     <li><a href="myresume/getPage?pageNum=${page.pages}">末页</a></li>
  </ul>
</nav>
</div>
  
</div>
   --%>
  
  
</html>
