<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>${detail.p3name }-立方网-蓝桥招聘网-最专业的互联网招聘平台</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="内容运营 武汉 本科 3-5年 全职 运营 大家都来了 你还在等什么！！ 立方网 北京立方网信息技术有限公司 立方网努力尝试把许多人对互联网的需求从现有的娱乐、资讯和交流平台进一步引导到文化与生活伴侣的方面. 蓝桥网-最专业的互联网招聘平台" name="description">
<meta content="内容运营 武汉 本科 3-5年 全职 运营 大家都来了 你还在等什么！！ 立方网 北京立方网信息技术有限公司 立方网努力尝试把许多人对互联网的需求从现有的娱乐、资讯和交流平台进一步引导到文化与生活伴侣的方面. 蓝桥网-最专业的互联网招聘平台" name="keywords">
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />

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
<script src="style/js/jquery-hbzx.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
<script type="text/javascript" src="style/js/conv.js"></script>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
			$("#toujianli").click(function(){
				var postId=$(this).attr("name");
				var url="insertpar?userId=${userId}&postId="+postId;
				if(${ empty userId}){
					alert("您还没有登录，请先登录哦！");
				}else{
					$.ajax({
						async:false,
						cache:false,
						url:url,
						success:function(data){
							if(data==1){
								alert("简历投递成功，等待公司审核！")
							}if(data==2){
								alert("只能投一次哦")
							}if(data==0){
								alert("请先完善简历信息哦！")
							}
						}
					})
				} 
			})
	})
</script>
</head>
<body>
<div id="body">
<jsp:include page="/base/userNav.jsp"></jsp:include>
    <div id="container">
                <div class="clearfix">
            <div class="content_l">
				<dl class="job_detail">
                    <dt>
                        <h1 title="内容运营">
                            <em></em>
							<div>蓝桥系统招聘</div>
								${detail.p3name }
                        </h1>
						<a title="登录" id="toujianli" class="inline btn fr btn_apply position_tou">投个简历</a>
					</dt>
                    <dd class="job_request">
                    	<span class="red">${detail.minSalary }-${detail.maxSalary }</span>
                       	<span>${detail.workSpeace }</span> 
                       	<span>工作经验:${detail.weName } </span>
                       	<br>
                       	<span>教育经验:${detail.ebName }</span> 
                       	<span>${detail.jobCategory }</span><br/>
                      	<span>职位诱惑 : ${detail.jobTempt }</span>
                      	<div>发布时间：${detail.strDate }</div>
                    </dd>
                    <dd class="job_bt">
                        <h3 class="description">职位描述</h3>
							<span>${detail.jobInfo }</span>
                    </dd>
                    <dd class="job_bt">
                        <h3 class="description">公司标签</h3>
								<ul class="companyTags reset"> 
 									<em class="c7"></em>
 									<c:forEach items="${tags }" var="tags">
 										<li style="color: green">${tags.content }</li>  
 									</c:forEach> 
								</ul>
                    </dd>
					<dd>
						<h3 class="description">工作地址</h3>
						<div style="margin-bottom: 20px">${detail.workSpeace }</div>
						<div id="smallmap"></div>
						<a href="javascript:;" id="mapPreview"  class="work_address">查看完整地图</a>
					</dd>
                </dl>
				<div id="weibolist"></div>
            </div>	
            <div class="content_r">
                <dl class="job_company">
                    <dt>
                    	<a href="CompanyListController/toCompany?id=${detail.companyID }&pageNum=1" target="_blank">
                            <img class="b2" src="${detail.companyLogo }" width="80" height="80" />
                            <div>
                                <h2 class="fl">立方网
                                  <img src="style/images/valid.png" width="15" height="19" alt="蓝桥认证企业" />
									<span class="dn">蓝桥认证企业</span>
                                </h2>
                            </div>
                        </a>
                    </dt>
                    <dd>
                    	<ul class="c_feature reset">
                        	<li><span>领域</span>${detail.companyDomain }</li>
                        	<li><span>规模</span>${detail.scale }</li>
                        	<li>
                        		<span>主页</span> 
                        		 <a href="CompanyListController/toCompany?id=${detail.companyID }&pageNum=1" target="_blank" title="http://L99.com" rel="nofollow">进入 ${detail.companyName } 公司主页</a>
           					</li>
                        </ul>
					</dd>
                </dl>
				<div class="mycenterR">
					<h2>最近浏览的职位</h2>

				</div>
				<div class="mycenterR look-other">
					<div class="look-position look-other">
						<a target="_blank" href="jobdetail.html">Java开发工程师</a>
						<a href="jobdetail.html">4000-6000元/月</a>
					</div>
					<div class="look-position">
						<a href="companylist.html">北京长青科技有限公司</a>
						<a target="_blank" href="subscribe.html">北京</a>
					</div>
				</div>
				<br>
					<div class="look-position look-other">
						<a target="_blank" href="http://www.w3school.com.cn/"><img alt="w3c" src="style/images/w3cplus.png"></a>
					</div>
					<br>
					<div class="look-position look-other">
						<a target="_blank" href="http://www.imooc.com/"><img alt="w3c" src="style/images/muke.jpg"></a>
					</div>
            </div>
       	</div>                    
      <input type="hidden" value="" name="userid" id="userid" />
      <input type="hidden" value="" name="type" id="resend_type" />
      <input type="hidden" value="140204"  id="jobid" />
      <input type="hidden" value="683"  id="companyid" />
      <input type="hidden" value="" id="positionLng" />
      <input type="hidden" value="" id="positionLat" />
		<div id="tipOverlay" ></div>
<!------------------------------------- end ----------------------------------------->
<script type="text/javascript" src="style/js/job_detail.js"></script>
<script type="text/javascript" src="style/js/count.js"></script>

<script>
$(function(){
	$('#weibolist .cookietxte').text('推荐本职位给好友');
	$(document).bind('cbox_complete', function(){ 
		hbzxJQ("#gaosutapt .pttui a").trigger("click"); 
		hbzxJQ("#mepingpt .pttui a").trigger("click"); 
	});
	$('#cboxOverlay').bind('click',function(){
		top.location.reload();
	});
	$('#colorbox').on('click','#cboxClose',function(){
		if($(this).siblings('#cboxLoadedContent').children('div').attr('id') == 'deliverResumesSuccess' || $(this).siblings('#cboxLoadedContent').children('div').attr('id') == 'uploadFileSuccess'){
			top.location.reload();
		}
	});
	})
</script>

<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3d6a9f4b807441569414b01eecc20959"></script>
<script type="text/javascript">
		//百度地图API功能
		var sMap = new BMap.Map("smallmap");
		sMap.enableScrollWheelZoom(true);
		
		if($('#positionLat').val() && $('#positionLng').val()){
			var sPoint = new BMap.Point($('#positionLng').val(),$('#positionLat').val());
			sMap.centerAndZoom(sPoint,12);
			sMap.addOverlay(new BMap.Marker(sPoint));              // 将标注添加到地图中
			
		}else{
			// 创建地址解析器实例
			var sMyGeo = new BMap.Geocoder();
			// 将地址解析结果显示在地图上,并调整地图视野
			sMyGeo.getPoint("武汉市武昌区螃蟹岬凤凰大厦A1-1301", function(sPoint){
			  if (sPoint) {
				  sMap.centerAndZoom(sPoint, 16);
				  sMap.addOverlay(new BMap.Marker(sPoint));
			  }
			}, "武汉");
		}

		/*弹窗大地图*/
		var map = new BMap.Map("allmap");
		map.addControl(new BMap.NavigationControl());
		map.addControl(new BMap.MapTypeControl());
		map.addControl(new BMap.OverviewMapControl());
		map.enableScrollWheelZoom(true);
		// 创建地址解析器实例
		var gc = new BMap.Geocoder();
		$(function(){
			$('#mapPreview').bind('click',function(){
				$.colorbox({inline:true, href:"#baiduMap",title:"公司地址"});
				var address = "武汉市武昌区螃蟹岬凤凰大厦A1-1301";
				var city = "武汉";
				var lat = $('#positionLat').val();
				var lng = $('#positionLng').val();
			    map.setCurrentCity(city);
			    map.setZoom(12);
				if(lat && lng){
					var p = new BMap.Point(lng, lat);
					var marker = new BMap.Marker(p);  // 创建标注
					map.addOverlay(marker);              // 将标注添加到地图中
					setTimeout(function(){
						map.centerAndZoom(p, 15);
					},1000);
					map.setCenter(p);
					map.setZoom(15);
					var sContent =
						"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+city+"</h4>" + 
						"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+address+"</p>" + 
						"</div>";
					 var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
				 	//图片加载完毕重绘infowindow
			 		marker.openInfoWindow(infoWindow);
		 		}else{
					gc.getPoint(address, function(point){
						  if (point) {
							  	var p = new BMap.Point(point.lng, point.lat);
								var marker = new BMap.Marker(p);  // 创建标注
								map.addOverlay(marker);              // 将标注添加到地图中
								setTimeout(function(){
									map.centerAndZoom(p, 15);
								},1000);
								map.setZoom(14);
								var sContent =
									"<h4 style='margin:0 0 5px 0;padding:0.2em 0'>"+city+"</h4>" + 
									"<p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'>"+address+"</p>" + 
									"</div>";
								 var infoWindow = new BMap.InfoWindow(sContent);  // 创建信息窗口对象
							 	//图片加载完毕重绘infowindow
						 		marker.openInfoWindow(infoWindow);
						  }
					}, city);
				}
				
				
			});
	
		});
</script>
			<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="6e1925fdbe7142468f154abd1d33f5a8" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a href="h/about.html" target="_blank" rel="nofollow">联系我们</a>
		    <a href="h/af/zhaopin.html" target="_blank">互联网公司导航</a>
		    <a href="http://e.weibo.com/lagou720" target="_blank" rel="nofollow">蓝桥微博</a>
		    <a class="footer_qr" href="javascript:void(0)" rel="nofollow">蓝桥微信<i></i></a>
			<div class="copyright">&copy;2013-2014 Lagou <a target="_blank" href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action">京ICP备14023790号-2</a></div>
		</div>
	</div>
<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

</body>
</html>