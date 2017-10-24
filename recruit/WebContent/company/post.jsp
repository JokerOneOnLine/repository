
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.lanqiao.entity.company.Post" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">

<script type="text/javascript" async="" src="style/js/conversion.js"></script>
<script src="style/js/allmobilize.min.js" charset="utf-8"
	id="allmobilize"></script>
<style type="text/css"></style>
<meta content="no-siteapp" http-equiv="Cache-Control">
<link media="handheld" rel="alternate">
<!-- end 云适配 -->
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<title>发布新职位-招聘服务-蓝桥网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网">
<meta name="keywords"
	content="蓝桥,蓝桥网,蓝桥招聘,拉钩, 拉钩网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">

<!-- <div class="web_root"  style="display:none">http://www.lagou.com</div> -->
<script type="text/javascript">
	//var ctx = "http://www.lagou.com";
	var ctx = "<%=basePath%>";
	console.log(1);
</script>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<link href="http://www.lagou.com/images/favicon.ico" rel="Shortcut Icon">
<link href="style/css/style.css" type="text/css" rel="stylesheet">
<link href="style/css/external.min.css" type="text/css" rel="stylesheet">
<link href="style/css/popup.css" type="text/css" rel="stylesheet">
<link href="style/css/recruit_LQ.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script src="style/js/jquery.lib.min.js" type="text/javascript"></script>
<script type="text/javascript" src="style/js/ajaxfileupload.js"></script>
<script src="style/js/additional-methods.js" type="text/javascript"></script>
<!-------------------------------------热门城市弹窗lightbox ----------------------------------------->
<script src="style/js/Chart.min.js" type="text/javascript"></script>
<script src="style/js/profile.min.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>

<link href="style1/css/style.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="style/css/ui.css">
<link rel="stylesheet" href="style/css/window.css">
<link rel="stylesheet" href="plugins/code/prettify.css" />
<link rel="stylesheet" href="themes/default/default.css" />
<script charset="utf-8" src="kindeditor.js"></script>
<script charset="utf-8" src="lang/zh_CN.js"></script>
<script charset="utf-8" src="plugins/code/prettify.js"></script>
<script>

function reg (){
	var min = Number($("#salaryMin").val()*1000);
	var max =Number ($("#salaryMax").val()*1000);
	if(isNaN(min ) ||isNaN(max) )
   {
   alert('你输入的数据不是数字');
    return false;
      }
    if(min>=max){
	  alert("最低月薪不能大于最高月薪");
	  return false;
    } 
 } 

$(function(){
	var jobCategory= $("#jobCategory").attr("name");
	if($.trim(jobCategory)==$.trim("全职")){
		var f=$("li").filter("#全职");
		 $(f).addClass("current");
		
	}
	if($.trim(jobCategory)==$.trim("兼职")){
		var f=$("li").filter("#兼职");
		 $(f).addClass("current");     
		
	}
	if($.trim(jobCategory)==$.trim("实习")){
		 var f=$("li").filter("#实习");
		 $(f).addClass("current");
		
	}
});
KindEditor.ready(function (K) {
    var editor1 = K.create('textarea[name="jobInfo"]', {
        cssPath: '../js/plugins/code/prettify.css',
        uploadJson: 'upload_json.ashx',
        fileManagerJson: 'file_manager_json.ashx',
        allowFileManager: true,
        afterCreate: function () {
            var self = this;
            K.ctrl(document, 13, function () {
                self.sync();
                K('form[name=example]')[0].submit();
            });
            K.ctrl(self.edit.doc, 13, function () {
                self.sync();
                K('form[name=example]')[0].submit();
            });
        },
        afterBlur: function () { this.sync(); }//这一步非常重要，如果遗漏，则后台无法接收到数据。
    });
    prettyPrint();
}); 

	

   $(function(){
	  
      		$("#formSubmit").click(function(){
      			 var email=$("#forwardEmail").val();
      			 if(email==""){
      				 email="${email}";
      			 }else{
				   var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
      			   isok= reg.test(email );
				       if (!isok) {
				            alert("邮箱格式不正确，请重新输入！");
				            email="";
				            return false;
		
		              }
      			 }

      			 
      		
				data = {
						id:Number($("#Id").attr("name")),
					p2Name:$("#positionType").val(),
					p3Name:$("#positionName").val(),
					jobCategory:$(".current").eq(0).text(),
					minSalary:Number($("#salaryMin").val()*1000),
					maxSalary:Number($("#salaryMax").val()*1000),
					workCity:$("#select_expectCity").val(),
					workName:$("#experience").val(),
					eName:$("#education").val(),
					jobInfo:$("#detailInput").val(),
					jobTempt:$("#positionAdvantage").val(),
					workSpeace:$("#positionAddress").val(),
					acceptEmail:email
				}
	 			$.ajax({
					async : false,
					url : "position/insertPosition",
					data : data,
					type : "post",
					cache : false,
					success : function(result) {
						if(result==0){
						alert("职位已添加，请重新选择！！！");
						return false;
						}
						window.location.href="getAll?pageNo=1&online=1";
						
					}
			});
			return false;
      	});
      });
   
	</script>
<script type="text/javascript" src="myresume/js/jquery-3.2.1.min.js">
</script>
</head>
<body>
	<div id="body">
		<jsp:include page="/base/companyNav.jsp"></jsp:include>
		<div id="container">
			<div class="sidebar">
				
				<dl class="company_center_aside">
					<dt>我发布的职位</dt>
					<dd>
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
							<em></em> 发布新职位
						</h1>
					</dt>
					<dd>
						<form action="" id="jobForm">
							<input type="hidden"  id="Id"name="${post.id }" value="${post.id }" size="3">
							<input type="hidden" id="jobCategory" name="${post.jobCategory}"  size="3">
							<input type="hidden" value="${post.p2Name }"> <input type="hidden"
								value="create" name="preview"> <input type="hidden"
								value="25927"> <input type="hidden"
								value="c29d4a7c35314180bf3be5eb3f00048f" name="resubmitToken">
							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">职位类别</td>
										<td><input type="hidden" id="positionType" value="${post.p2Name}" name="postType">
											<input type="button" value="${post.p2Name }" readonly="true"  id="select_category"
											class="selectr selectr_380" >
											<div class="dn" id="box_job" style="display: none;">
												<c:forEach items="${position1 }" var="p">
													<dl>
														<dt>${p.name }</dt>
														<dd>
															<ul class="reset job_main">
																<c:forEach items="${p.positions }" var="pp">
																	<li><span>${pp.name }</span> <input type="hidden"
																		 value="${pp.name }">
																		<ul class="reset job_sub dn">
																			<c:forEach items="${pp.positions }" var="ppp">
																				<li>${ppp.name }</li>
																				<input type="hidden" 
																					value=
																					"${post.p2Name}">
																			</c:forEach>
																		</ul></li>
																</c:forEach>
															</ul>
														</dd>
													</dl>
												</c:forEach>
											</div></td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>职位名称</td>
										<td><input type="text"
											value="${post.p3Name }" readonly="true"    id="positionName" name="postName" style="width: 300px;height: 36px" ></td>
									</tr>
								</tbody>
							</table>
							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">工作性质</td>
										<td>
											<ul class="profile_radio clearfix reset">
												<li id="全职">全职<em></em> <input type="radio" name="jobCategory" id="job1"
													value="全职">
												</li>
												<li id="兼职">兼职<em></em> <input type="radio" name="jobCategory" id="job2"
													value="兼职">
												</li>
												<li id="实习">实习<em></em> <input type="radio" name="jobCategory" id="job3"
													value="实习">
												</li>
											</ul>
										</td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>月薪范围</td>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td>
											<div class="salary_range">
												<div>
													<input type="text" placeholder="最低月薪" value="${post.minSalary/1000==0.0?'':post.minSalary/1000 }"
														id="salaryMin" name="minSalary" style="width: 200px; height: 36px"> <span>k</span>
												</div>
												<div>
													<input type="text" placeholder="最高月薪" value="${post.maxSalary/1000==0.0?'':post.maxSalary/1000 }""
														id="salaryMax" name="maxSalary" style="width: 200px; height: 36px"  onblur="reg()"> <span>k</span>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<!-- <td><span class="redstar">*</span></td> -->
										<table>
											<tbody>
												<tr>
													<td><span class="redstar">*</span></td>
													<td>工作城市</td>
													<td colspan="3"><input type="hidden" id="expectCity" value="" name="workCity"> 
													<input type="button" value="${post.workCity }" id="select_expectCity" class="profile_select_287 profile_select_normal"  >
														<div class="boxUpDown boxUpDown_596 dn"
															id="box_expectCity" style="display: none;">
															<dl>
																<dt>城市&nbsp;&nbsp;</dt>
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

											</tbody>
										</table>
								</tbody>
							</table>

							<table class="btm">
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">工作经验</td>
										<td><input type="hidden" id="experience" value="${post.workName }"
											name="workExperience"> <input type="button"
											value="${post.workName }"   id="select_experience"
											class="selectr selectr_380">
											<div class="boxUpDown boxUpDown_380 dn" id="box_experience"
												style="display: none;">
												<ul>
													<li><c:forEach items="${ws}" var="w">
															<li>${w.name }</li>
														</c:forEach></li>
												</ul>
											</div></td>
									</tr>
									<tr>
										<td><span class="redstar">*</span></td>
										<td>学历要求</td>
										<!--<h3><span>(最高月薪不能大于最低月薪的2倍)</span></h3> -->
										<td><input type="hidden" id="education" value="${post.eName }"
											name="education"> <input type="button"
											value="${post.eName }" id="select_education"
											class="selectr selectr_380">
											<div class="boxUpDown boxUpDown_380 dn" id="box_education"
												style="display: none;">
												<ul>
													<li><c:forEach items="${eb }" var="e">
															<li>${e.name}</li>
														</c:forEach></li>
												</ul>
											</div></td>
									</tr>
								</tbody>
											<td><span class="redstar">*</span></td>
											<td>职位描述</td>
							</table>
							<table class="btm">
								<tbody>
									<tr>
										<div>
											<!-- <span class="redstar" >*职位描述</span> <label for="detailInput">职位描述</label> -->
											
										<%! 
											private String htmlspecialchars(String str) {
												str = str.replaceAll("&", "&amp;");
												str = str.replaceAll("<", "&lt;");
												str = str.replaceAll(">", "&gt;");
												str = str.replaceAll("\"", "&quot;");
												return str;
															}
												
											%>
											<%
											String data="";
											Post post=(Post)request.getAttribute("post");
											if(post!=null){
												
											data=post.getJobInfo();
											}
											
											%>
										
											<textarea name="jobInfo" id="detailInput" cols="100" rows="8" style="width: 700px; height: 200px; visibility: hidden;"><%=htmlspecialchars(data)%></textarea>
										</div>

									</tr>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td width="85">职位诱惑</td>
										<td><input type="text"
											placeholder="20字描述该职位的吸引力，如：福利待遇、发展前景等" value="${post.jobTempt }"
											name="jobTempt" class="input_520" id="positionAdvantage" style="width: 500px; height: 36px"></td>
									</tr>

									<tr>
										<td><span class="redstar">*</span></td>
										<td>工作地址</td>
										<td><input type="text" placeholder="请输入详细的工作地址" value="${post.workSpeace }"
											name="workSpeace" class="input_520" id="positionAddress" style="width: 500px; height: 36px">
											<input type="hidden" value="" name="positionLng" id="lng">
											<input type="hidden" value="" name="positionLat" id="lat">
											<div class="work_place f14">
												我们将在职位详情页以地图方式精准呈现给用户 <a id="mapPreview" href="javascript:;">预览地图</a>
											</div></td>
									</tr>
								</tbody>
							</table>

							<table>
								<tbody>
									<tr>
										<td width="25"><span class="redstar">*</span></td>
										<td colspan="2">接收简历邮箱： <span id="receiveEmailVal">${email}(默认的是公司注册的邮箱 )</span>
											<input type="hidden" value="admin@admin.com"
											id="receiveEmail" name="email" >
										</td>
									</tr>
									<tr>
										<td width="25"></td>
										<td colspan="2">同时简历自动发送至邮箱（仅一个） <input type="text"
											placeholder="可以不填"   value="${post.acceptEmail }" id="forwardEmail" name="acceptEmail" style="width: 500px; height: 39px"> <!-- <span class="error" id="beError" style="display:none"></span> -->
										</td>
									</tr>
									<tr>
										<td width="25"></td>
										<td colspan="2"> <input type="button"
											value="发布" id="formSubmit" class="btn_32"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</dd>
				</dl>
			</div>
			<!-- end .content -->

			<!------------------------------------- 弹窗lightbox ----------------------------------------->
			<div style="display: none;">
				<!--联系方式弹窗-->
				<div style="height: 180px;" class="popup" id="telTip">
					<form id="telForm">
						<table width="100%">
							<tbody>
								<tr>
									<td align="center" class="f18">留个联系方式方便我们联系你吧！</td>
								</tr>
								<tr>
									<td align="center"><input type="text" maxlength="49"
										placeholder="请输入你的手机号码或座机号码" name="tel"> <span
										style="display: none;" class="error" id="telError"></span></td>
								</tr>
								<tr>
									<td align="center"><input type="submit" value="提交"
										class="btn"></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!--/#telTip-->

				<!--地图弹窗-->
				<div class="popup" id="baiduMap">
					<div class="mb10">点击地图可重新定位公司所在的位置</div>
					<div id="allmap"
						style="overflow: hidden; position: relative; z-index: 0; background-color: rgb(243, 241, 236); color: rgb(0, 0, 0); text-align: left;">
						<div
							style="overflow: visible; position: absolute; z-index: 0; left: 0px; top: 0px; cursor: grab;">
							<div class="BMap_mask"
								style="position: absolute; left: 0px; top: 0px; z-index: 9; overflow: hidden; width: 0px; height: 0px;"></div>
							<div
								style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;">
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 800;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 700;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 600;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 500;">
									<label class="BMapLabel" unselectable="on"
										style="position: absolute; -moz-user-select: none; display: none; cursor: inherit; background-color: rgb(190, 190, 190); border: 1px solid rgb(190, 190, 190); padding: 1px; white-space: nowrap; font: 12px arial, simsun, sans-serif; z-index: -20000; color: rgb(190, 190, 190);">shadow</label>
								</div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 400;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 300;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 201;"></div>
								<div
									style="position: absolute; height: 0px; width: 0px; left: 0px; top: 0px; z-index: 200;"></div>
							</div>
							<div
								style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 1;">
								<div
									style="position: absolute; overflow: visible; z-index: -100; left: 0px; top: 0px; display: none;"></div>
							</div>
							<div
								style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 2; display: block;">
								<div
									style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 0; display: block;">
									<canvas
										style="position: absolute; width: 256px; height: 256px; left: -74px; top: -213px; background: none repeat scroll 0% 0% rgb(243, 241, 236);"
										width="256" height="256" id="_1_bg_6323_2355_15"></canvas>
								</div>
								<div
									style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 10; display: block;">
									<canvas
										style="position: absolute; width: 256px; height: 256px; left: -74px; top: -213px;"
										width="256" height="256" id="_1_poi_6323_2355_15"></canvas>
								</div>
							</div>
							<div
								style="position: absolute; overflow: visible; top: 0px; left: 0px; z-index: 3;"></div>
						</div>
						<div
							style="position: absolute; z-index: 1201; top: 10px; right: 10px; width: 17px; height: 16px; background: url(style/images/img/st-close.pngquot) no-repeat scroll 0% 0% transparent; cursor: pointer; display: none;"
							title="退出全景"></div>
						<div
							style="height: 32px; position: absolute; z-index: 30; -moz-user-select: none; bottom: 0px; right: auto; top: auto; left: 1px; display: none;"
							class=" anchorBL">
							<a title="到百度地图查看此区域" target="_blank"
								href="http://map.baidu.com/?sr=1" style="outline: medium none;"><img
								src="style/images/copyright_logo.png"
								style="border: none; width: 77px; height: 32px"></a>
						</div>
						<div
							style="position: absolute; z-index: 0; top: 0px; left: 0px; overflow: hidden; visibility: hidden; cursor: -moz-grab"
							id="zoomer">
							<div style="top: 0; left: 0;" class="BMap_zoomer"></div>
							<div style="top: 0; right: 0;" class="BMap_zoomer"></div>
							<div style="bottom: 0; left: 0;" class="BMap_zoomer"></div>
							<div style="bottom: 0; right: 0;" class="BMap_zoomer"></div>
						</div>
						<div unselectable="on"
							class=" BMap_stdMpCtrl BMap_stdMpType0 BMap_noprint anchorTL"
							style="width: 62px; height: 186px; bottom: auto; right: auto; top: 10px; left: 10px; position: absolute; z-index: 1100; -moz-user-select: none;">
							<div class="BMap_stdMpPan">
								<div title="向上平移" class="BMap_button BMap_panN"></div>
								<div title="向左平移" class="BMap_button BMap_panW"></div>
								<div title="向右平移" class="BMap_button BMap_panE"></div>
								<div title="向下平移" class="BMap_button BMap_panS"></div>
								<div class="BMap_stdMpPanBg BMap_smcbg"></div>
							</div>
							<div class="BMap_stdMpZoom" style="height: 141px; width: 62px;">
								<div title="放大一级" class="BMap_button BMap_stdMpZoomIn">
									<div class="BMap_smcbg"></div>
								</div>
								<div title="缩小一级" class="BMap_button BMap_stdMpZoomOut"
									style="top: 120px;">
									<div class="BMap_smcbg"></div>
								</div>
								<div class="BMap_stdMpSlider" style="height: 102px;">
									<div class="BMap_stdMpSliderBgTop" style="height: 102px;">
										<div class="BMap_smcbg"></div>
									</div>
									<div class="BMap_stdMpSliderBgBot"
										style="top: 19px; height: 87px;"></div>
									<div title="放置到此级别" class="BMap_stdMpSliderMask"></div>
									<div title="拖动缩放" class="BMap_stdMpSliderBar"
										style="cursor: grab; top: 19px;">
										<div class="BMap_smcbg"></div>
									</div>
								</div>
								<div class="BMap_zlHolder">
									<div class="BMap_zlSt">
										<div class="BMap_smcbg"></div>
									</div>
									<div class="BMap_zlCity">
										<div class="BMap_smcbg"></div>
									</div>
									<div class="BMap_zlProv">
										<div class="BMap_smcbg"></div>
									</div>
									<div class="BMap_zlCountry">
										<div class="BMap_smcbg"></div>
									</div>
								</div>
							</div>
						</div>
						<div unselectable="on"
							style="bottom: auto; right: 10px; top: 10px; left: auto; white-space: nowrap; cursor: pointer; position: absolute; z-index: 10; -moz-user-select: none;"
							class=" BMap_noprint anchorTR">
							<div style="-moz-user-select: none; float: left;">
								<div
									style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-top: 1px solid rgb(139, 164, 220); border-bottom: 1px solid rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(142, 168, 224); padding: 2px 6px; font: bold 12px/1.3em arial, simsun, sans-serif; text-align: center; white-space: nowrap; border-radius: 3px 0px 0px 3px; color: rgb(255, 255, 255);"
									title="显示普通地图">地图</div>
							</div>
							<div style="-moz-user-select: none; float: left;">
								<div
									style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-top: 1px solid rgb(139, 164, 220); border-bottom: 1px solid rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 2px 6px; font-family: arial, simsun, sans-serif; font-style: normal; font-variant: normal; font-size: 12px; line-height: 1.3em; font-size-adjust: none; font-stretch: normal; -moz-font-feature-settings: normal; -moz-font-language-override: normal; text-align: center; white-space: nowrap; color: rgb(0, 0, 0);"
									title="显示卫星影像">卫星</div>
								<div
									style="-moz-user-select: none; position: absolute; top: 0px; left: 0px; z-index: -1; display: none;">
									<div
										style="border-right: 1px solid #8ba4dc; border-bottom: 1px solid #8ba4dc; border-left: 1px solid #8ba4dc; background: white; font: 12px arial, simsun, sans-serif; padding: 0 8px 0 6px; line-height: 1.6em; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35)"
										title="显示带有街道的卫星影像">
										<span class="BMap_checkbox" "="" checked="checked"></span><label
											style="vertical-align: middle; cursor: pointer;">混合</label>
									</div>
								</div>
							</div>
							<div style="-moz-user-select: none; float: left;">
								<div
									style="-moz-user-select: none; box-shadow: 2px 2px 3px rgba(0, 0, 0, 0.35); border-left: 1px solid rgb(139, 164, 220); border-width: 1px; border-style: solid; border-color: rgb(139, 164, 220); background: none repeat scroll 0% 0% rgb(255, 255, 255); padding: 2px 6px; font-family: arial, simsun, sans-serif; font-style: normal; font-variant: normal; font-size: 12px; line-height: 1.3em; font-size-adjust: none; font-stretch: normal; -moz-font-feature-settings: normal; -moz-font-language-override: normal; text-align: center; white-space: nowrap; border-radius: 0px 3px 3px 0px; color: rgb(0, 0, 0);"
									title="显示三维地图">三维</div>
							</div>
						</div>
						<div unselectable="on"
							class=" BMap_scaleCtrl BMap_noprint anchorBL"
							style="bottom: 18px; right: auto; top: auto; left: 81px; width: 88px; position: absolute; z-index: 10; -moz-user-select: none;">
							<div unselectable="on" class="BMap_scaleTxt"
								style="background-color: transparent; color: black;">500&nbsp;米</div>
							<div class="BMap_scaleBar BMap_scaleHBar"
								style="background-color: black;">
								<img src="style/images/mapctrls.png" style="border: none">
							</div>
							<div class="BMap_scaleBar BMap_scaleLBar"
								style="background-color: black;">
								<img src="style/images/mapctrls.png" style="border: none">
							</div>
							<div class="BMap_scaleBar BMap_scaleRBar"
								style="background-color: black;">
								<img src="style/images/mapctrls.png" style="border: none">
							</div>
						</div>
						<div unselectable="on"
							class=" BMap_omCtrl BMap_ieundefined BMap_noprint anchorBR quad4"
							style="width: 13px; height: 13px; bottom: 0px; right: 0px; top: auto; left: auto; position: absolute; z-index: 10; -moz-user-select: none;">
							<div class="BMap_omOutFrame" style="width: 149px; height: 149px;">
								<div class="BMap_omInnFrame"
									style="bottom: auto; right: auto; top: 5px; left: 5px; width: 142px; height: 142px;">
									<div class="BMap_omMapContainer"></div>
									<div class="BMap_omViewMv" style="cursor: grab;">
										<div class="BMap_omViewInnFrame">
											<div></div>
										</div>
									</div>
								</div>
							</div>
							<div class="BMap_omBtn BMap_omBtnClosed"
								style="bottom: 0px; right: 0px; top: auto; left: auto;"></div>
						</div>
						<div unselectable="on" class=" BMap_cpyCtrl BMap_noprint anchorBL"
							style="cursor: default; white-space: nowrap; -moz-user-select: none; color: black; background: none repeat scroll 0% 0% transparent; font: 11px/15px arial, simsun, sans-serif; bottom: 2px; right: auto; top: auto; left: 4px; position: absolute; z-index: 10;">
							<span _cid="1" style="display: inline;"><span
								style="font-size: 11px">&copy; 2014 Baidu&nbsp;- Data
									&copy; <a style="display: inline;"
									href="http://www.navinfo.com/" target="_blank">NavInfo</a>
									&amp; <a style="display: inline;"
									href="http://www.cennavi.com.cn/" target="_blank">CenNavi</a>
									&amp; <a style="display: inline;"
									href="http://www.365ditu.com/" target="_blank">道道通</a>
							</span></span>
						</div>
					</div>
				</div>
				<!--/#baiduMap-->
			</div>
			<!------------------------------------- end ----------------------------------------->
			<!-- <script type="text/javascript" src="style/js/tinymce.min.js"></script>
<script>
$(function(){
		
	/*textarea 编辑器*/
	tinymce.init({
	    selector: "textarea.tinymce",
	    // width: 100,
	    height: 225,
		language: "zh_CN",
		content_css: ctx + "/js/tinymce4/content.css",
		plugins: "contextmenu autolink code paste searchreplace",
	    contextmenu: "copy cut paste",
	    // paste_word_valid_elements: "",
	    paste_as_text: true,
	    // paste_webkit_styles: "color",//all | none
	    // paste_retain_style_properties: "font-size",//
	    menubar: false,
	    statusbar: false,
	    toolbar: [
	    	"undo redo | bold italic underline strikethrough | bullist numlist | alignleft aligncenter alignright | removeformat | code"
	    ],
	    save_enablewhendirty: function(e) {
	        console.log('dirty',e);
	    },
	    save_onsavecallback: function(e){
	        console.log('save',e);
	    },
	    setup: function (editor) {
	        editor.on('keyup', function (e) {  
	        	tinyMCE.triggerSave();
	        	var editorContent = tinyMCE.get(editor.id).getContent();
			    if(editorContent.length > 20){
					$("#" + editor.id).valid();
			    }
	        });
	    }
	});
});
</script> -->

			<!-- old -->
			<script src="style/js/jquery.tinymce.js" type="text/javascript"></script>
			<script>
				$(function() {
			
					/***********************************************
					 ** textarea 编辑器
					 */
					$('textarea.tinymce')
							.tinymce(
									{
										// Location of TinyMCE script
										script_url : ctx
												+ '/js/tinymce/jscripts/tiny_mce/tiny_mce.js',

										// General options
										theme : "advanced",
										language : "zh-cn",
										plugins : "paste,autolink,lists,style,layer,save,advhr,advimage,advlink,iespell,inlinepopups,preview,media,searchreplace,contextmenu,fullscreen,noneditable,visualchars,nonbreaking",

										// Theme options
										theme_advanced_buttons1 : "bold,italic,underline,|,justifyleft,justifycenter,justifyright,|,bullist,numlist,|,outdent,indent,|,undo,redo,|,link,unlink,|,hr,fullscreen,image",
										theme_advanced_toolbar_location : "top",
										theme_advanced_toolbar_align : "left",
										theme_advanced_statusbar_location : "none", //定义输入框下方是否显示状态栏，默认不显示
										theme_advanced_resizing : false,
										paste_auto_cleanup_on_paste : true,
										paste_as_text : true,
										auto_cleanup_word : true,
										paste_remove_styles : true,
										contextmenu : "copy cut paste",
										force_br_newlines : true,
										force_p_newlines : false,
										apply_source_formatting : false,
										remove_linebreaks : false,
										convert_newlines_to_brs : true,

										// Example content CSS (should be your site CSS)
										content_css : ctx
												+ "/js/tinymce/examples/css/content.css",

										// Drop lists for link/image/media/template dialogs
										template_external_list_url : "lists/template_list.js",
										external_link_list_url : "lists/link_list.js",

										// Replace values for the template plugin
										template_replace_values : {
											username : "Some User",
											staffid : "991234"
										},
										onchange_callback : function(editor) {
											tinyMCE.triggerSave();
											var editorContent = tinyMCE.get(
													editor.id).getContent();
											if (editorContent.length > 20) {
												$("#" + editor.id).valid();
											}
										}
									});

					$('#workAddress').focus(function() {
						$('#beError').hide();
					});
				});
			</script>
			<!-- end old -->

			<script src="style/js/jobs.min.js" type="text/javascript"></script>
			<script
				src="http://api.map.baidu.com/api?v=2.0&amp;ak=A2c1a1ff1fe0750e3290660295aac602"
				type="text/javascript"></script>
			<script
				src="http://api.map.baidu.com/getscript?v=2.0&amp;ak=A2c1a1ff1fe0750e3290660295aac602&amp;services=&amp;t=20140617153133"
				type="text/javascript"></script>
			<script type="text/javascript">
				//百度地图API功能
				var map = new BMap.Map("allmap");
				//控件添加
				map.addControl(new BMap.NavigationControl());
				map.addControl(new BMap.MapTypeControl());
				map.addControl(new BMap.ScaleControl());
				map.addControl(new BMap.OverviewMapControl());

				var point = new BMap.Point(116.331398, 39.897445); //初始化坐标点
				map.centerAndZoom(point, 15);
				/* map.centerAndZoom(, 15); */
				map.enableScrollWheelZoom(true); //允许缩放
				var gc = new BMap.Geocoder(); //地址定位
				var local = new BMap.LocalSearch(map, {
					renderOptions : {
						map : map
					}
				});
				function showInfo(e) {
					map.clearOverlays(); //清除所有覆盖物
					//map.centerAndZoom(new BMap.Point(olng, olat), 11);//重定义中心点
					//alert(e.point.lng + ", " + e.point.lat);
					var marker = new BMap.Marker(new BMap.Point(e.point.lng,
							e.point.lat)); // 创建标注
					marker
							.addEventListener(
									"mouseup",
									function(em) { //覆盖物监听事件--释放鼠标时定位覆盖物位置
										var pt = em.point; //移动后重新定位
										gc
												.getLocation(
														pt,
														function(rs) {
															var addComp = rs.addressComponents;
															var label = new BMap.Label(
																	"我的坐标："
																			+ em.point.lng
																			+ ", "
																			+ em.point.lat
																			+ "  我的地址："
																			+ addComp.province
																			+ ", "
																			+ addComp.city
																			+ ", "
																			+ addComp.district
																			+ ", "
																			+ addComp.street
																			+ ", "
																			+ addComp.streetNumber,
																	{
																		offset : new BMap.Size(
																				20,
																				-10)
																	});
															// marker.setLabel(label);//新坐标-新地址
															if (rs) {
																var sContent = "&lt;h4 style='margin:0 0 5px 0;padding:0.2em 0'&gt;"
																		+ addComp.province
																		+ "&lt;/h4&gt;"
																		+ "&lt;p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'&gt;"
																		+ rs.address
																		+ "&lt;/p&gt;"
																		+ "&lt;/div&gt;";
																var infoWindow = new BMap.InfoWindow(
																		sContent); // 创建信息窗口对象
																//图片加载完毕重绘infowindow
																marker
																		.openInfoWindow(infoWindow);
															}

															$('#lat')
																	.val(
																			em.point.lat);
															$('#lng')
																	.val(
																			em.point.lng);
														});
									});
					marker.enableDragging(); //可拖拽
					map.addOverlay(marker); // 将标注添加到地图中

					/////////////////////地址定位
					var pt = e.point;
					gc
							.getLocation(
									pt,
									function(rs) {
										var addComp = rs.addressComponents;
										var label = new BMap.Label("我的坐标："
												+ e.point.lng + ", "
												+ e.point.lat + "  我的地址："
												+ addComp.province + ", "
												+ addComp.city + ", "
												+ addComp.district + ", "
												+ addComp.street + ", "
												+ addComp.streetNumber, {
											offset : new BMap.Size(20, -10)
										});
										//marker.setLabel(label);
										if (rs) {
											var sContent = "&lt;h4 style='margin:0 0 5px 0;padding:0.2em 0'&gt;"
													+ addComp.province
													+ "&lt;/h4&gt;"
													+ "&lt;p style='margin:0;line-height:1.5;font-size:13px;text-indent:2em'&gt;"
													+ rs.address
													+ "&lt;/p&gt;"
													+ "&lt;/div&gt;";
											var infoWindow = new BMap.InfoWindow(
													sContent); // 创建信息窗口对象
											//图片加载完毕重绘infowindow
											marker.openInfoWindow(infoWindow);
										}

										$('#lat').val(e.point.lat);
										$('#lng').val(e.point.lng);
									});

					//////////////////////重置中心点
					olng = e.point.lng;
					olat = e.point.lat;
				}
				map.addEventListener("click", showInfo); //地图点击事件

				$(function() {
					$('#mapPreview').bind('click', function() {
						$.colorbox({
							inline : true,
							href : "#baiduMap",
							title : "公司地址"
						});
						var address = $('#positionAddress').val();
						var city = $('#workAddress').val();
						map.setCurrentCity(city);
						map.setZoom(15);
						gc.getPoint(address, function(point) {
							if (point) {
								map.centerAndZoom(point, 15);
								map.setZoom(15);
								map.setCenter(point);
								local.search(address);
							}
						}, city);
						/* map.addEventListener("tilesloaded",function(){
							map.setZoom(15);
						}); */
					});
				});
			</script>

			<div class="clear"></div>
			<input type="hidden" value="c29d4a7c35314180bf3be5eb3f00048f"
				id="resubmitToken"> <a rel="nofollow" title="回到顶部"
				id="backtop" style="display: none;"></a>
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