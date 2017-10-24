<%@ page language="java" isELIgnored="false" import="java.util.*"
	pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>企业主页-国馆-蓝桥招聘网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description"
	content="web前端开发 广州 大专 3-5年 全职 前端开发 高薪高福利，良好办公空间 国馆 广东国馆酒业有限公司 让文化温暖人心 蓝桥网-最专业的互联网招聘平台">
<!--<meta name="keywords" content="web前端开发 广州 大专 3-5年 全职 前端开发 高薪高福利，良好办公空间 国馆 广东国馆酒业有限公司 让文化温暖人心 蓝桥网-最专业的互联网招聘平台">-->
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
        var ctx = "http://www.lagou.com";
        console.log(1);
    </script>
<link href="images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="style/css/recruit_LQ.css" />


<script
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

<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="style/js/jquery-hbzx.js"></script>
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
            window.onload = function()
            {
                var $li = $('#tab li');
                var $ul = $('#content ul');
 
                $li.mouseover(function(){
                    var $this = $(this);
                    var $t = $this.index();
                    $li.removeClass();
                    $this.addClass('current');
                    $ul.css('display','none');
                    $ul.eq($t).css('display','block');
                })
            }
        });
    </script>
</head>
<!-- 公司注册信息完善以后登录显示公司的所有信息刘如艳 -->
<body>
<jsp:include page="../base/companyNav.jsp"></jsp:include>

	<div id="body">
	<!-- 
		<div id="header">
		
		
		
			<div class="wrapper">
				<a class="logo" href="index.html"> <img width="229" height="43"
					 src="${company.baseInfo.companyLogo}">
				</a>
				
				
			</div>
			
		</div>
		 -->
		<!-- end #header -->
		<div id="container">
			<div class="clearfix">
				<!--企业顶部 -->
				<div class="recruit_top">
					<div class="recruit_img">
						<img width="190" height="190" src="${company.baseInfo.companyLogo}">
					</div>
					<div class="recruit_infor">
						<h2>${company.baseInfo.companyName}</h2>
						<span class="profiles">${company.baseInfo.introduction}</span>
						<div class="infor_bottom">
							
							<!-- 
							
							<ul>
								<li><span class="amount">3个</span><br> <span
									class="positions_now">在招职位</span></li>
								<li><span class="amount">50条</span><br> <span
									class="positions_now">面试评价</span></li>
								<li><span class="amount">今天</span><br> <span
									class="positions_now">企业最近登录</span></li>
							</ul>
							 -->
						</div>
					</div>
				</div>
				<!--企业顶部 结束 -->
				<!--公司主页及职位 -->
				<div id="outer">
					<ul id="tab">
						<li class="current">公司主页</li>
						<li>招聘职位</li>
					</ul>
					<div class="company_base">
						<h2>公司基本信息</h2>
						<ul class="c_feature reset">
							<li><span>行业领域</span> ${company.baseInfo.companyDomain}</li>
							<li><span>公司规模</span> ${company.baseInfo.scale}</li>
							<!-- 
							<li><span>发展阶段</span>A轮</li>
							 -->
							<li><span>所在城市</span>${company.baseInfo.companyCity}</li>
						</ul>
						<h2>公司标签</h2>
						<ul class="reset company_label">
						<c:forEach items="${company.tags}" var="tag">
						           <li><span>${tag.content}</span></li>   
						</c:forEach>
						</ul>
					</div>
					<div id="content">
						<ul style="display: block">
							<li class="company_index">
								<div class="company_content">
									<h2>公司产品</h2>
									<div class="product_company">
										<c:forEach items="${company.product}" var="product">
										<img width="200" height="200" src="${product.poster}">
										</c:forEach>
									</div>
								</div>
								<c:forEach items="${company.product}"  var="product">
										<div class="product_intro">
										<span>${product.productName}</span><br> ${product.productInfo}
									   </div>
								</c:forEach>
								<div class="company_content">
									<h2>公司介绍</h2>
									<div class="company_intro">
										${company.baseInfo.companyInfo}
									</div>
								</div>

							</li>
						</ul>
						<ul>
							<li class="company_index company_position">
							<!-- 
							<h1>
									近两个月共有<span>8</span>个在招职位 <span class="job_line"></span>
								</h1>
							 -->
								
								<div class="po">
									<dl>
										<dt>职位信息</dt>
										
										<!-- 
										
										<dd>
											<a rel="-1" class="current" href="javascript:;">全部</a> <a
												rel="1" href="javascript:;">UI</a> <a rel="2"
												href="javascript:;">前端开发</a> <a rel="3" href="javascript:;">Java开发</a>
											<a rel="3" href="javascript:;">Java开发</a> <input
												type="hidden" value="-1" name="resumeStatus">
										</dd>
										 -->	
									</dl>
								</div>
								<div class="job_list">
								<table class="table" >
									<c:forEach items="${pageinfor.list}" var="post">
										   <tr>
											<td>职位:${post.p2Name}</td>
											<td>工作城市:${post.workCity}</td>
											<td>学历:${post.eName}</td>
											</tr>
											<tr>
											
											</tr>
											<tr>
											<td>期望工资:${post.minSalary}K-${post.maxSalary}K</td>
											<td>工作经验:${post.workName}</td>
											<td>工作性质:${post.jobCategory}</td>
											</tr>
											<tr>
											<td>
											<p class="line" style="border: red;outline-style:solid;border-bottom-style:ridge;size:500px;max-height: 800px;">
											</p>
											
											</td>
											</tr>
											
									</c:forEach>
									</table>
								</div>
							</li>
							<li></li>
						</ul>
					</div>
				</div>
				<!--公司主页及职位 结束-->
</body>


<div class="row">
  <div class="col-md-6"><span>第${pageinfor.pageNum}页/共${pageinfor.pages}</span></div>
  <div class="col-md-6"><nav aria-label="Page navigation">
  <ul class="pagination">
   <li><a href="position/obtainPositions?pageNum=1">首页</a></li>
 
    <li>
    <c:if test="${pageinfor.hasPreviousPage}">
      <a href="position/obtainPositions?pageNum=${pageinfor.pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
      </c:if>
    </li>
    
    <c:forEach items="${pageinfor.navigatepageNums}" var="current">
   
 
   <c:if test="${pageinfor.pageNum==current}">
    <li class="active"><a href="position/obtainPositions?pageNum=${current}">${current}</a></li>
    </c:if>
    
    <c:if test="${pageinfor.pageNum!=current}">
    <li><a href="position/obtainPositions?pageNum=${current}">${current }</a></li>
    </c:if>
     
     
    </c:forEach>
    <li>
     <c:if test="${pageinfor.hasNextPage}">
      <a href="position/obtainPositions?pageNum=${pageinfor.pageNum+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
      </c:if>
      </li>
     <li><a href="position/obtainPositions?pageNum=${pageinfor.pages}">末页</a></li>
  </ul>
</nav>
</div>
  
</div>

</html>