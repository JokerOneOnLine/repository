<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>全国-公司列表-蓝桥网-最专业的互联网招聘平台</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="全国condition-condition-公司列表-蓝桥网-最专业的互联网招聘平台" name="description">
<meta content="全国condition-公司列表-蓝桥网-最专业的互联网招聘平台" name="keywords">
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />




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
	
	
	
<!-- <div class="web_root"  style="display:none">h</div> -->
<script type="text/javascript">
var ctx = "h";
console.log(1);
</script>
<link rel="Shortcut Icon" href="h/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="style/css/style.css"/>
<link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
<link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
	<link rel="stylesheet" type="text/css" href="style/css/recruit_LQ.css"/>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/jquery.lib.min.js"></script>
<script src="style/js/ajaxfileupload.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/additional-methods.js"></script>
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js" ></script>

</head>
<body>
	<jsp:include page="/base/userNav.jsp"></jsp:include>
<div id="body">
    <div id="container">
        <div class="clearfix">
            <div class="content_l">
				<form id="positionListForm" name="companyListForm" method="get" action="">
					<input type="hidden" id="city" name="city" value="全国" />
					<input type="hidden" id="fs" name="fs" value="" />
					<input type="hidden" id="ifs" name="ifs" value="" />
					<input type="hidden" id="ol" name="ol" value="" />
					<dl class="hc_tag">
						<dd>
							<dl>
								<dt>公司地点：</dt>
								<dd>
									<ul class="workplace workplace_position reset fr" id="workplaceSelect">
								 	<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=all&pageNum=1" >全国</a>
											|
										</li> 
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=北京&pageNum=1">北京</a>
											|
										</li>
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=上海&pageNum=1">上海</a>
											|
										</li>
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=广州&pageNum=1" >广州</a>
											|
										</li>
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=深圳&pageNum=1">深圳</a>
											|
										</li>
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=成都&pageNum=1">成都</a>
											|
										</li>
										<li >
											<a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=杭州&pageNum=1">杭州</a>
											|
										</li>
										<li  class="more" >
											<a href="company/allCity.jsp" >全部城市</a>
											<!-- <div class="triangle citymore_arrow"></div> -->
									<!-- <ul class="workplace workplace_position reset fr" id="workplaceSelect"> -->
										<!-- <li id="box_expectCity" class="searchlist_expectCity dn">
											<span class="bot"></span>
											<span class="top"></span>
											
										</li> -->
									</ul>
								</dd>
							</dl>
						</dd>
					</dl>
					<ul class="hc_list reset">
					<c:if test="${empty pageInfo.list }">
					<img src="style/images/notfoundcompany.png" alt="你所查的城市没有相应的公司"/>
					</c:if>
					<c:if test="${!empty pageInfo.list }">
					 <c:forEach items="${pageInfo.list }" var="baseInfo">	
						<li>
							<a href="CompanyListController/toCompany?id=${baseInfo.companyId}&pageNum=1" target="_blank">
								<h3>${baseInfo.companyName}</h3>
								<div class="comLogo">
									<img src=" ${baseInfo.companyLogo}" width="160" height="190" alt="companyLogo" />
									<ul>
										<li><span class="number_green">${baseInfo.companyAbb}</span></li>
										<!-- <li><span class="number_green">333</span>个在招职位/条面试评价</li> -->
									</ul>
								</div>
							</a>
							<a href="CompanyListController/toCompany?id=${baseInfo.companyId}" target="_blank"> ${baseInfo.companyAbb}</a>
							<ul class="reset company_infor">
								<li class="">
								</li>
								<li>
									<img src="style/images/marker_red_sprite.png" width="20" height="20" alt="${baseInfo.companyCity}">
									<span>${baseInfo.companyCity}</span>
								</li>
							</ul>
						 </li>
			     		</c:forEach>  
			     		</c:if>
					 </ul>
					<div class="Pagination"></div>
				</form>
            </div>	
            <div class="content_r">
				<div class="mycenterR">
					<h2>推荐企业</h2>
				</div>
                <a href="https://www.ithome.com/" target="_blank" class="eventAd recommend">
               		<img src="style/images/subject280.jpg" width="280" height="135" />
               	</a>
               	<a href="http://www.sohu.com" target="_blank" class="eventAd recommend">
               		<img src="style/images/rising280.png" width="280" height="135" />
               	</a>
				<a href="http://www.baidu.com" target="_blank" class="eventAd recommend">
					<img src="style/images/d05a2cc6e6c94bdd80e074eb05e37ebd.jpg" width="280" height="135" />
				</a>
				<a href="http://www.imooc.com" target="_blank" class="eventAd recommend">
					<img src="style/images/muke.jpg" width="280" height="135" />
				</a>
				<a href="https://www.w3cschool.cn" target="_blank" class="eventAd recommend">
					<img src="style/images/w3cplus.png" width="280" height="135" />
				</a>
            </div>
       	</div>
   	
   	<input type="hidden" value="" name="userid" id="userid" />
      
<script type="text/javascript" src="style/js/company_list.min.js"></script>
<!-- <script>
$(function(){
	/*分页 */
 	 	 				 		$('.Pagination').pager({
	      currPage: 1,
	      pageNOName: "pn",
	      form: "companyListForm",
	      pageCount: 20,
	      pageSize: 5
	});	
})
</script>   -->     	
			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->

	

	

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>



</body>










<div class="container">
		<div class="col-md-5" style="top: 30px">
			<span style="font-size: 15px; color: green">当前页码为 ${pageInfo.pageNum } 页 /总共 ${pageInfo.pages } 页 </span>
		</div>
		<div class="col-md-7">
			<nav aria-label="Page navigation">
				<ul ul class="pagination">
					<li><a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=${companyCity }&pageNum=1">首页</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=${companyCity }&pageNum=${pageInfo.pageNum-1}"
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
							<li><a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=${companyCity }&pageNum=${current }">${current }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=${companyCity }&pageNum=${pageInfo.pageNum+1}"aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
					<li><a href="CompanyListController/getBaseInfoByCompanyCity?companyCity=${companyCity }&pageNum=${pageInfo.pages }">末页</a></li>
				</ul>
			</nav>
		</div>
</div> 
	<jsp:include page="../base/footer.jsp"></jsp:include>
</html>