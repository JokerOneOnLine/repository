<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML>
<html>
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
<title>我的简历-蓝桥网-最专业的互联网招聘平台</title>
<meta content="23635710066417756375" property="qc:admins">
<meta name="description" content="蓝桥网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在蓝桥网">
<meta name="keywords"
	content="蓝桥,蓝桥网,蓝桥招聘,蓝桥, 蓝桥网 ,互联网招聘,蓝桥互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 蓝桥官网, 蓝桥百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招">
<meta content="QIQ6KC1oZ6" name="baidu-site-verification">
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
<script src="style/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="style/js/jquery.js" type="text/javascript"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
	var youdao_conv_id = 271546;
</script>
<script src="style/js/conv.js" type="text/javascript"></script>
<script src="style/js/myResume.js" type="text/javascript"></script>
<script src="style/js/ajaxCross.json" charset="UTF-8"></script>
<script type="text/javascript">
	$(function() {
		getHopejob();
		getPractice();
		getProject();
		getEducation();
		//验证现职位是否合法
		$("#nowpost").blur(function() {
			$.ajax({
				async : false,
				url : "userController/testNowPost",
				data : {
					nowpost : $("#nowpost").val()
				},
				type : "post",
				cache : false,
				success : function(d) {
					if (d == 0) {
						alert("该职位不存在！");
						$("#nowpost").focus();
					}
				}
			});
		});
		//基本信息
		$("#profileSub").click(function() {
			$.ajax({
				async : false,
				url : "userController/update",
				data : {
					name : $("#name").val(),
					gender : $(".current").eq(0).text(),
					topDegree : $("#topDegree").val(),
					workyear : $("#workyear").val(),
					addr : $("#select_expectCity").val(),
					nowpost : $("#nowpost").val(),
					tel : $("#tel").val(),
					declaration : $("#declaration").val()
				},
				type : "post",
				cache : false,
				success : function(d) {
					if (d != 0) {
						alert("操作成功！");
						window.location.href = "userController/toUserInfo";
					} else {
						alert("操作失败！");
						window.location.href = "myresume/user.jsp";
					}
				}
			});
			return false;
		})

		//期望工作
		$("#expectJobSub").click(function() {
			$.ajax({
				async : false,
				url : "hopeJob/insertOrUpdate",
				data : {
					city : $("#expectCity").val(),
					jobType : $(".current").eq(1).text(),
					hopeSalary : $("#expectSalary").val(),
					hopejob : $("#select_industry_hidden").val(),
					description : $("#workDescription").val(),
				},
				type : "post",
				cache : false,
				success : function(data) {
					if (data.msg != null) {
						alert(data.msg);
						getHopejob();
						$("#joba").trigger("click"); 
					} else {
						alert("操作失败！");
					}
				}
			});
			return false;
		})

		//工作经历
		$("#workExperienceSub").click(
				function() {
					$.ajax({
						async : false,
						url : "PracticeController/insert",
						data : {
							company : $("#inputCompany").val(),
							position : $("#inputPosition").val(),
							starttime : $("#companyYearStart").val()
									+ $("#companyMonthStart").val() + "01",
							endtime : $("#companyYearEnd").val()
									+ $("#companyMonthEnd").val() + "01",
							workContent : $("#inputWorkContent").val(),
						},
						type : "post",
						cache : false,
						success : function(result) {
							if (result.msg != null) {
								alert(result.msg);
								getPractice();
								$("#expa").trigger("click");
							} else {
								alert("操作失败！");
							}
						}
					});
					return false;
				});

		//项目经验
		$("#projectExperienceSub").click(
				function() {
					$.ajax({
						async : false,
						url : "project/insertOrUpdate",
						data : {
							projectName : $("#projectName").val(),
							duty : $("#thePost").val(),
							startTime : $("#projectYearStart").val()
									+ $("#projectMonthStart").val() + "01",
							endTime : $("#projectYearEnd").val()
									+ $("#projectMonthEnd").val() + "01",
							description : $("#projectDescription").val(),
						},
						type : "post",
						cache : false,
						success : function(result) {
							if (result.msg != null) {
								alert(result.msg);
								getProject();
								$("#proa").trigger("click");
							} else {
								alert("操作失败！");
							}
						}
					})
					return false;
				})

		//程建波--教育经历--------求你不要乱改了
		$("#educationalSub").click(function() {
			//alert("educationalSub");
			$.ajax({
				type : "post",
				url : "education/insertOrUpdate",
				data : {
					schoolName : $("#schoolName").val(),
					major : $("#major").val(),
					graduate : $("#graduate").val(),
					educational : $("#educational").val(),
				},
				success : function(i) {
					if (i != 0) {
						alert("操作成功！");
						getEducation();
						$("#edua").trigger("click");
					} else {
						alert("操作失败！");
					}
				}
			});
			return false;
		});
	});
	//用户信息
	function getUserInfo() {
		$.ajax({
			async : false,
			url : "userController/getUser",
			type : "get",
			cache : false,
			success : function(result) {
				var gender = result.user.gender;
				$("#namespan").text("姓名：" + result.user.name);
				if (gender == 0) {
					$("#genderspan").text("性别：女");
				} else {
					$("#genderspan").text("性别：男");
				}
				$("#birthspan").text("生日：" + result.user.strBirth);
				$("#addrspan").text("地址：" + result.user.addr);
				$("#telspan").text("电话：" + result.user.tel);
				$("#decspan").text("个人宣言：" + result.user.declaration);
			}
		});
	}
	$(function() {
		$("#select_industry").click(function() {
	        $.ajax({
	        	async:false,
	        	url:"position/getPasition2",
	        	type:"get",
	        	success:function(data){
	        		//alert(JSON.stringify(data.posi))
	        		$.each(data.posi,function(n,value){
	        			$("#hopejobs").append(
                            "<tr><td style=\"width: 19%; text-align: center;\"><h4>"+value.name+"</h4></td><td id=\"p"+n+"\"></td></tr>"            
                        );
	        			$.each(value.positions,function(index,pp){
	                        $("#p"+n).append(
	                        	"<li style=\"font-size: 14px; width: auto;\">"+pp.name+"</li>"
	                        );
	                    })
	        		})
	        	}
	        })
	    })
    })
</script>
<style type="text/css">
#preview {
	width: 180px;
	height: 183px;
	border: 1px solid gray;
	overflow: hidden;
}

#imghead {
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
			img.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
				img.width = rect.width;
				img.height = rect.height;
				img.style.marginLeft = rect.left + 'px';
				img.style.marginTop = rect.top + 'px';
			}
			var reader = new FileReader();
			reader.onload = function(evt) {
				img.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else { //兼容IE
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			div.innerHTML = '<img id=imghead>';
			var img = document.getElementById('imghead');
			img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
			status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
			div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
		}
	}

	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;
			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}
		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}
</script>

</head>
<body>
	<jsp:include page="../base/userNav.jsp"></jsp:include>
	<div id="body">
		<input type="hidden" value="${userId }" id="userId" name="userId">
		<!-- end #header -->
		<div id="container">
			<div class="clearfix">
				<div class="content_l">
					<div class="profile_box" id="basicInfo">
						<h2 id="div1">基本信息</h2>
						<span class="c_edit"></span>
						<div class="basicShow">
							<span>${user.name}&nbsp;&nbsp;|&nbsp;&nbsp;<c:if
									test="${user.gender==1 }">男</c:if> <c:if
									test="${user.gender==0 }">女</c:if>&nbsp;| 出生年月：${user.strBirth }<br>
								居住地：${user.addr }<br>
								学历：${user.myResume.education.educational } 
								<br>
								职位：${user.myResume.practice.position} 
								<br> 工作经验：<fmt:formatDate
									value="${user.myResume.practice.starttime }" pattern="yyyy-MM" />至<fmt:formatDate
									value="${user.myResume.practice.endtime }" pattern="yyyy-MM" />
								<br> 邮箱：${user.email}
							</span><br> <span class="work_address">个人简介：</span><span>${user.declaration }</span>
							
						</div>
						<!--end .basicShow-->
						<!-- 基本信息 -->
						<div class="basicEdit dn">
						<div id="preview" style="text-align: center;">
						 <img id="imghead" border=0 src="images/111.png" width="180" height="180" class="img-circle"/>
						</div>
						<input name="headPic" id="headPic" type="file" onchange="previewImage(this)" />
							<form id="profileForm" action="userController/updateUserInfo">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>姓名：<input type="text" placeholder="${user.name }" value=""
												name="name" id="name" style="height: 45px"></td>
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
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="hidden" id="topDegree" value=""
												name="topDegree"> <input type="button" value=""
												id="select_topDegree"
												class="profile_select_190 profile_select_normal">
												<div class="boxUpDown boxUpDown_190 dn" id="box_topDegree"
													style="display: none;">
													<ul>
														<li>大专</li>
														<li>本科</li>
														<li>硕士</li>
														<li>博士</li>
														<li>其他</li>
													</ul>
												</div></td>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="hidden" id="workyear" value=""
												name="workyear"> <input type="button" value=""
												id="select_workyear"
												class="profile_select_190 profile_select_normal">
												<div class="boxUpDown boxUpDown_190 dn" id="box_workyear"
													style="display: none;">
													<ul>
														<li>不限</li>
														<li>应届毕业生</li>
														<li>1年以下</li>
														<li>1-3年</li>
														<li>3-5年</li>
														<li>5-10年</li>
														<li>10年以上</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar"></span></td>
											<td colspan="3">地址：<input type="hidden" id="addr" value=""
												name="addr"> <input type="button" value="${user.addr }"
												id="select_expectCity"
												class="profile_select_287 profile_select_normal">
												<div class="boxUpDown boxUpDown_596 dn" id="box_expectCity"
													style="display: none;">
													<dl>
														<dt>热门城市</dt>
														<dd>
															<span>北京</span> <span>上海</span> <span>广州</span> <span>深圳</span>
															<span>成都</span> <span>杭州</span> <span>宝鸡</span>
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
											<td valign="top"><span class="redstar"></span></td>
											<td colspan="3">职位：<input type="text" 
												placeholder="${user.myResume.practice.position} " value="" name="nowpost" id="nowpost" style="height: 45px"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td colspan="3">电话：<input type="text" placeholder="${user.tel}"
												value="" name="tel" id="tel" style="height: 45px"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td colspan="3">
											个人宣言：<textarea
													class="projectDescription s_textarea jianli_textarea"
													class="" name="declaration" id="declaration"
													placeholder="${user.declaration }">
													</textarea>
													</td>
										</tr>
										<tr>
											<td></td>
											<td colspan="3"><input type="submit" value="确定"
												id="profileSub" class="btn_profile_save"> <a
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
							</form>
							<!--end #profileForm-->
							
							<!--end .new_portrait-->
						</div>
						<!--end .basicEdit-->
						
						
						
						<input type="hidden" id="nameVal" value=""> <input
							type="hidden" id="genderVal" value="男"> <input
							type="hidden" id="topDegreeVal" value="我的学历"> <input
							type="hidden" id="workyearVal" value="工作经验"> <input
							type="hidden" id="currentStateVal" value=""> <input
							type="hidden" id="emailVal" value=""> <input
							type="hidden" id="telVal" value=""> <input type="hidden"
							id="pageType" value="1">
					</div>
					<!--end #basicInfo-->
					<!-- 期望工作 -->
					<div class="profile_box" id="expectJob">
						<h2 id="div2">期望工作</h2>
						<!-- 显示期望工作 -->
						<div style="font-size: 16px; margin-left: 20px;" id="jobDiv">
							期望城市： <span class="c9" id="city"></span><br> 期望薪资：<span
								class="c9" id="salary"></span><br> 期望职位： <span class="c9"
								id="job"></span><br> 补充说明：<span class="c9" id="description"></span>
						</div>
						<hr>
						<span class="c_edit dn"></span>
						<div class="expectShow dn">
							<span></span>
						</div>
						<!--end .expectShow-->
						<div class="expectEdit dn">
							<form id="expectForm" action="">
								<table>
									<%-- <jsp:include page="position.jsp" ></jsp:include> --%>
									<tbody>
										<tr>
											<td><input type="text" value="" placeholder="期望城市"
												name="expectCity" id="expectCity" class="expectCity"
												style="height: 45px">
											<td>
												<ul class="profile_radio clearfix reset">
													<li class="current">全职<em></em> <input type="radio"
														name="type" id="typeName" value="全职">
													</li>
													<li>兼职<em></em> <input type="radio" id="typeName"
														name="type" value="兼职">
													</li>
													<li>实习<em></em> <input type="radio" id="typeName"
														name="type" value="实习">
													</li>
												</ul>
											</td>
										</tr>
										<tr>
											<td colspan="3">
												<div>
													<input type="hidden" value="" name="select_industry_hidden"
														id="select_industry_hidden"> <input type="button"
														value="请选择期望职位" name="select_industry"
														id="select_industry" class="select">
													<div class="dn" id="box_industry">
														<ul class="reset">
														<!-- 期望职位选择框 -->
															<table id="hopejobs"></table>
														</ul>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<td><input type="hidden" id="expectSalary" value=""
												name="expectSalary"> <input type="button"
												value="期望月薪" id="select_expectSalary"
												class="profile_select_287 profile_select_normal">
												<div class="boxUpDown boxUpDown_287 dn"
													id="box_expectSalary" style="display: none;">
													<ul>
														<li>2k以下</li>
														<li>2k-5k</li>
														<li>5k-10k</li>
														<li>10k-15k</li>
														<li>15k-25k</li>
														<li>25k-50k</li>
														<li>50k以上</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td colspan="3"><textarea style="height: 100px"
													id="workDescription" name="workDescription"
													placeholder="补充说明"></textarea>
												<div class="word_count">
													你还可以输入 <span>200</span> 字
												</div></td>
										</tr>
										<tr>
											<td><input type="submit" value="确定" id="expectJobSub"
												class="btn_profile_save"> <a id="joba"
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
							</form>
							<!--end #expectForm-->
						</div>
						<!--end .expectEdit-->
						<div class="expectAdd pAdd">
							填写准确的期望工作能大大提高求职成功率哦…<br> 快来添加期望工作吧！ <span>添加期望工作</span>
						</div>
						<!--end .expectAdd-->
						<input type="hidden" id="expectJobVal" value=""> <input
							type="hidden" id="expectCityVal" value=""> <input
							type="hidden" id="typeVal" value=""> <input type="hidden"
							id="expectPositionVal" value=""> <input type="hidden"
							id="expectSalaryVal" value="">
					</div>
					<!--end #expectJob-->
					<!-- 工作经历 -->
					<div class="profile_box" id="workExperience">
						<h2 id="div3">
							工作经历 <span> （投递简历时必填）</span>
						</h2>
						<!-- 显示工作经历 -->
						<div style="font-size: 16px; margin-left: 20px;" id="prac">
							公司：<span class="c9" id="company"></span><br> 职位：<span
								class="c9" id="position"></span><br>
							<!-- 工作经验：<span class="c9" id="practiceTime"></span><br>  -->
							工作经验：<span class="c9" id="practiceTime"></span><br> 工作内容：<span
								class="c9" id="workContent"></span><br>
						</div>
						<hr>
						<span class="c_add dn"></span>
						<div class="experienceEdit dn">
							<form class="experienceForm">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input class="required" type="text"
												placeholder="公司名称" style="height: 45px" id="inputCompany"
												name="company" class="companyName"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input class="required" type="text"
												placeholder="职位名称，如：产品经理" style="height: 45px"
												name="position" id="inputPosition" class="positionName"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="companyYearStart" value=""
														name="companyYearStart" id="companyYearStart"> <input
														type="button" value="开始年份"
														class="profile_select_139 profile_select_normal select_companyYearStart">
													<div
														class="box_companyYearStart boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<c:forEach begin="1970" end="2018" var="i">
																<li>${i }</li>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="companyMonthStart" value=""
														name="companyMonthStart" id="companyMonthStart"> <input
														type="button" value="开始月份"
														class="profile_select_139 profile_select_normal select_companyMonthStart">
													<div style="display: none;"
														class="box_companyMonthStart boxUpDown boxUpDown_139 dn">
														<ul>
															<c:forEach begin="1" end="12" var="i">
																<c:if test="${i<10 }">
																	<li>0${i }</li>
																</c:if>
																<c:if test="${i>=10 }">
																	<li>${i }</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="companyYearEnd" value=""
														name="companyYearEnd" id="companyYearEnd"> <input
														type="button" value="结束年份"
														class="profile_select_139 profile_select_normal select_companyYearEnd">
													<div class="box_companyYearEnd  boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<c:forEach begin="1970" end="2018" var="i">
																<li>${i }</li>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="companyMonthEnd" value=""
														name="companyMonthEnd" id="companyMonthEnd"> <input
														type="button" value="结束月份"
														class="profile_select_139 profile_select_normal select_companyMonthEnd">
													<div style="display: none;"
														class="box_companyMonthEnd boxUpDown boxUpDown_139 dn">
														<ul>
															<c:forEach begin="1" end="12" var="i">
																<c:if test="${i<10 }">
																	<li>0${i }</li>
																</c:if>
																<c:if test="${i>=10 }">
																	<li>${i }</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
										</tr>
										<tr>
											<td valign="top"></td>
											<td colspan="3"><textarea
													class="projectDescription s_textarea "
													id="inputWorkContent" name="workContent" placeholder="工作内容"></textarea></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="3"><input type="submit" value="确定"
												id="workExperienceSub" class="btn_profile_save"
												onclick="return check(this.form)"> <a id="expa"
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" class="expId" value="">
							</form>
							<!--end .experienceForm-->
						</div>
						<!--end .experienceEdit-->
						<div class="experienceAdd pAdd">
							工作经历最能体现自己的工作能力，<br> 且完善后才可投递简历哦！ <span>添加工作经历</span>
						</div>
						<!--end .experienceAdd-->
					</div>
					<!--end #workExperience-->
					<!-- 项目经验 -->
					<div class="profile_box" id="projectExperience">
						<h2 id="div4">项目经验</h2>
						<!-- 显示项目经验 -->
						<div style="font-size: 16px; margin-left: 20px;" id="proj">
							项目名称：<span class="c9" id="projName"></span><br> 项目经理：<span
								class="c9" id="projDuty"></span><br> 项目周期：<span class="c9"
								id="projTime"></span><br> 项目描述：<span class="c9"
								id="projDescription"></span>
						</div>
						<hr>
						<span class="c_add dn"></span>
						<div class="projectShow dn">
							<ul class="plist clearfix">
							</ul>
						</div>
						<!--end .projectShow-->
						<div class="projectEdit dn">
							<form class="projectForm" id="projectForm">
								<table>
									<tbody>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="text" placeholder="项目名称"
												style="height: 45px" id="projectName" name="projectName"
												class="projectName"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td><input type="text" placeholder="担任职务，如：产品负责人"
												style="height: 45px" id="thePost" name="thePost"
												class="thePost"></td>
										</tr>
										<tr>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="projectYearStart" value=""
														name="projectYearStart" id="projectYearStart"> <input
														type="button" value="开始年份"
														class="profile_select_139 profile_select_normal select_projectYearStart">
													<div
														class="box_projectYearStart  boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<c:forEach begin="1970" end="2018" var="i">
																<li>${i }</li>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="projectMonthStart" value=""
														name="projectMonthStart" id="projectMonthStart"> <input
														type="button" value="开始月份"
														class="profile_select_139 profile_select_normal select_projectMonthStart">
													<div style="display: none;"
														class="box_projectMonthStart boxUpDown boxUpDown_139 dn">
														<ul>
															<c:forEach begin="1" end="12" var="i">
																<c:if test="${i<10 }">
																	<li>0${i }</li>
																</c:if>
																<c:if test="${i>=10 }">
																	<li>${i }</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
											<td valign="top"><span class="redstar">*</span></td>
											<td>
												<div class="fl">
													<input type="hidden" class="projectYearEnd" value=""
														name="projectYearEnd" id="projectYearEnd"> <input
														type="button" value="结束年份"
														class="profile_select_139 profile_select_normal select_projectYearEnd">
													<div class="box_projectYearEnd  boxUpDown boxUpDown_139 dn"
														style="display: none;">
														<ul>
															<c:forEach begin="1970" end="2018" var="i">
																<li>${i }</li>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="fl">
													<input type="hidden" class="projectMonthEnd" value=""
														name="projectMonthEnd" id="projectMonthEnd"> <input
														type="button" value="结束月份"
														class="profile_select_139 profile_select_normal select_projectMonthEnd">
													<div style="display: none;"
														class="box_projectMonthEnd boxUpDown boxUpDown_139 dn">
														<ul>
															<c:forEach begin="1" end="12" var="i">
																<c:if test="${i<10 }">
																	<li>0${i }</li>
																</c:if>
																<c:if test="${i>=10 }">
																	<li>${i }</li>
																</c:if>
															</c:forEach>
														</ul>
													</div>
												</div>
												<div class="clear"></div>
											</td>
										</tr>
										<tr>
											<td valign="top"></td>
											<td colspan="3"><textarea
													class="projectDescription s_textarea"
													id="projectDescription" name="projectDescription"
													placeholder="项目描述"></textarea>
												<div class="word_count">
													你还可以输入 <span>500</span> 字
												</div></td>
										</tr>
										<tr>
											<td valign="top"></td>
											<td colspan="3"><input type="submit" value="确定"
												id="projectExperienceSub" class="btn_profile_save"
												onclick="return check(this.form)"> <a id="proa"
												class="btn_profile_cancel" href="javascript:;">取 消</a></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" value="" class="projectId">
							</form>
							<!--end .projectForm-->
						</div>
						<!--end .projectEdit-->
						<div class="projectAdd pAdd">
							项目经验是用人单位衡量人才能力的重要指标哦！<br> 来说说让你难忘的项目吧！ <span>添加项目经验</span>
						</div>
						<!--end .projectAdd-->
					</div>
					<!--end #projectExperience-->
					<!---------------------------------------------- 教育经历 ------------------------------->
					<div class="profile_box" id="educationalBackground">
						<h2 id="div5">
							教育经历<span>（投递简历时必填）</span>
						</h2>
						<!-- 显示教育经历 -->
						<div style="font-size: 16px; margin-left: 20px;" id="edudiv">
							学校：<span class="c9" id="eduSchool"></span><br> 专业：<span
								class="c9" id="eduMajor"></span><br> 毕业时间：<span class="c9"
								id="eduTime"></span>
						</div>
						<hr>
						<span class="c_add dn"></span>
						<div class="educationalEdit dn">
							<form class="educationalForm">
								<input type="text" hidden="hidden" name="educationId"
									id="educationId" value="${user.myResume.education.id }">
								<table>
									<tbody>
										<tr>
											<td><input type="text" style="height: 45px"
												placeholder="学校名称" id="schoolName" name="schoolName"
												class="schoolName"
												value="${user.myResume.education.schoolName}"></td>
											<td><input type="text"
												style="height: 45px; width: 290px" id="major"
												placeholder="专业名称" name="major" class="professionalName"></td>
										</tr>
										<tr>
											<td><input type="text" style="height: 45px"
												placeholder="毕业时间" id="graduate" name="graduate"
												class="schoolName"></td>
											<td><input type="hidden" class="degree" value=""
												id="educational" name="educational"> <input
												type="button" value="学历"
												class="profile_select_287 profile_select_normal select_degree">
												<div class="box_degree boxUpDown boxUpDown_287 dn"
													style="display: none;">
													<ul>
														<li>大专</li>
														<li>本科</li>
														<li>硕士</li>
														<li>博士</li>
														<li>其他</li>
													</ul>
												</div></td>
										</tr>
										<tr>
											<td><input type="submit" value="确定" id="educationalSub"
												class="btn_profile_save"> <a id="edua"
												class="btn_profile_cancel" href="javascript:;" class="btn">取
													消</a></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" class="eduId" value="">
							</form>
							<!--end .educationalForm-->
						</div>
						<!--end .educationalEdit-->
						<div class="educationalAdd pAdd">
							教育经历可以充分体现你的学习和专业能力，<br> 且完善后才可投递简历哦！ <span>添加教育经历</span>
						</div>
						<!--end .educationalAdd-->
					</div>
					<!--end #educationalBackground-->
				</div>
				<!--end .content_l-->
				<div class="content_r">
					<div class="mycenterR" id="myInfo">
						<h2>简历</h2>
						<a target="_blank" href="myresume/show.jsp?userId=${user.id }"
							class="preview_resume">预览简历</a>
					</div>
					<!--end #myInfo-->
					<div class="mycenterR" id="resumeSet">
						<h2>我的投递</h2>
						<a target="_blank" href="userController/getAllPost"
							class="preview_resume">投递箱</a>
					</div>
					<!--end #resumeSet-->
					<!-- <div class="mycenterR" id="resumeSet">
						<a target="_blank" href="userController/UserResumeInfo" class="preview_resume">预览简历</a>
					</div> -->
					<!--end #resumeSet-->
				</div>
				<!--end .content_r-->
			</div>
			<!-- 期望职位选择框 -->
			<script src="style/js/step1.min.js" type="text/javascript"></script>
			<script>
				var avatar = {};
				avatar.uploadComplate = function(data) {
					var result = eval('(' + data + ')');
					if (result.success) {
						jQuery('#logoShow img').attr("src",
								ctx + '/' + result.content);
						jQuery.colorbox.close();
						jQuery('#logoNo').hide();
						jQuery('#logoShow').show();
					}
				};
			</script>
			<script src="style/js/Chart.min.js" type="text/javascript"></script>
			<script src="style/js/profile.min.js" type="text/javascript"></script>
			<div id="profileOverlay"></div>
			<div class="" id="qr_cloud_resume" style="display: none;">
				<div class="cloud">
					<img width="134" height="134" src=""> <a class="close"
						href="javascript:;"></a>
				</div>
			</div>
			<!-- <script>
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
					if( $.cookie(sessionId) && $.cookie(sessionId) != 5){
						$('#qr_cloud_resume').removeClass('dn');
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
				id="backtop" style="display: none;"></a> -->
		</div>
		<!-- end #container -->
	</div>
	<!-- end #body -->
	<div id="footer">
		<div class="wrapper">
			<a rel="nofollow" target="_blank" href="h/about.html">联系我们</a> <a
				target="_blank" href="h/af/zhaopin.html">互联网公司导航</a> <a
				rel="nofollow" target="_blank" href="http://e.weibo.com/lagou720">蓝桥微博</a>
			<a rel="nofollow" href="javascript:void(0)" class="footer_qr">
				蓝桥微信<i></i>
			</a>
			<div class="copyright">
				&copy;2013-2014 Lagou <a
					href="http://www.miitbeian.gov.cn/state/outPortal/loginPortal.action"
					target="_blank">京ICP备14023790号-2</a>
			</div>
		</div>
	</div>
	<script src="style/js/core.min.js" type="text/javascript"></script>
	<script src="style/js/step6.js" type="text/javascript"></script>
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
						$('#noticeNo').text('').show().parent('a').attr('href',
								ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text('').show().parent('a').attr(
								'href', ctx + '/mycenter/delivery.html');
					} else {
						$('#noticeDot-0').show();
						$('#noticeTip strong').text(notice.status[0]);
						$('#noticeTip').show();
						$('#noticeNo').text('(' + notice.status[0] + ')')
								.show().parent('a').attr('href',
										ctx + '/mycenter/delivery.html');
						$('#noticeNoPage').text(' (' + notice.status[0] + ')')
								.show().parent('a').attr('href',
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