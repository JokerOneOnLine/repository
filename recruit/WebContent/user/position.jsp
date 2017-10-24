<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!-- 梁琼 -->
<!-- 渭南师范学院二期 李晨晨 2017-08-24 15：50 -->
<html xmlns:wb="http://open.weibo.com/wb">
<head>
<base href="<%=basePath%>">
<script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="alternate" media="handheld"  />
<!-- end 云适配 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>职位列表-蓝桥招聘网-专业的互联网招聘平台</title>
<meta property="qc:admins" content="23635710066417756375" />
<meta content="全国condition-condition-公司列表-拉勾网-最专业的互联网招聘平台" name="description">
<meta content="全国condition-公司列表-拉勾网-最专业的互联网招聘平台" name="keywords">
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
<script type="text/javascript" src="style/js/additional-methods.js"></script>
<!--[if lte IE 8]>
    <script type="text/javascript" src="style/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript">
var youdao_conv_id = 271546; 
</script> 
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
<script type="text/javascript" src="style/js/conv.js"></script>
<script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	/* 工作经历初始化 */
	function WorkExperienceInit(){
		 $.ajax({
			async:false,
			cache:false,
			dataType: "html",
			data:{date:new Date()},
			url:"positionInfo1?pageNo=1",
			success:function(data){ 
				data = eval('(' + data + ')');
				var data = data.experiences;
	            for (var i = 0, j = data.length; i < j; i++)
	            	if(data[i].id == $("#a0").val()){
	                   $('#wk').append('<a class="current" value="'+data[i].id+'">' + data[i].name +'</a>');
	            	}else{
	                $('#wk').append('<a class="" value="'+data[i].id+'">' + data[i].name +'</a>');
			 		}
	            }
		}) 
	} 
	/* 教育背景初始化 */
	function EduInit(){
		 $.ajax({
			async:false,
			cache:false,
			dataType: "html",
			data:{date:new Date()},
			url:"positionInfo2?pageNo=1",
			success:function(data){ 
				data = eval('(' + data + ')');
				var data = data.eduBackground;
	            for (var i = 0, j = data.length; i < j; i++)
	            if(data[i].id == $("#a1").val()){
	                 $('#edu').append('<a class="current" value="'+data[i].id+'">' + data[i].name +'</a>');
            	}else{
               		 $('#edu').append('<a class="" value="'+data[i].id+'">' + data[i].name +'</a>');
		 		}
	         }
		}) 
	}
	/* 期望月薪初始化 */
	function HopeSalaryInit(){
		 $.ajax({
			async:false,
			cache:false,
			dataType: "html",
			data:{date:new Date()},
			url:"positionInfo3?pageNo=1",
			success:function(data){ 
				data = eval('(' + data + ')');
				var data = data.hopeSalarys;
	            for (var i = 0, j = data.length; i < j; i++)
	            	if(data[i].id == $("#a2").val()){
		                   $('#hs').append('<a class="current" value="'+data[i].id+'">' + data[i].name +'</a>');
		            	}else{
		                $('#hs').append('<a class="" value="'+data[i].id+'">' + data[i].name +'</a>');
				 		}
			}
		}) 
	} 
				
	$(function(){
		/* 调用以上方法初始化页面  */
		WorkExperienceInit();
		EduInit();
		HopeSalaryInit();
	 	/* 搜索框的点击函数 */
	  	$(".position_button").click(function(){
	  		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			window.location.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	  	})
		/* 每一个筛选条件的点击函数 */
		$("span>a").click(function(){
			$(this).addClass('current').siblings().removeClass('current');
			var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
 		 }); 
	 	
	 	if($("#a3").val()==$("#All").attr("value")){
	 		$("#All").addClass('current');
	 	}else if($("#a3").val()==$("#bj").attr("value")){
	 		$("#bj").addClass('current');
	 	}else if($("#a3").val()==$("#sh").attr("value")){
	 		$("#sh").addClass('current');
	 	}else if($("#a3").val()==$("#gz").attr("value")){
	 		$("#gz").addClass('current');
	 	}else if($("#a3").val()==$("#sz").attr("value")){
	 		$("#sz").addClass('current');
	 	}else if($("#a3").val()==$("#cd").attr("value")){
	 		$("#cd").addClass('current');
	 	}else {
	 		$("#li").html("<a href='' class='current' value='"+$("#a3").val()+"' >"+$("#a3").val()+"</a> |")
	 	}
	  	$("#All").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	}); 
	 	$("#bj").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	}); 
	 	$("#sh").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	}); 
	 	$("#gz").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	}); 
	 	$("#sz").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	}); 
	 	$("#cd").click(function(){
	 		$(this).addClass('current');
	 		$(this).parents().siblings().children().removeClass('current');
	 		var t = $(".position_input").val();
			var arr = new Array();
			$(".current").each(function(){
				arr.push($(this).attr("value"));
			});
			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 	});  
	 	$(function(){
	 		$("#firstPage").click(function(){
	 		  		var t = $(".position_input").val();
	 				var arr = new Array();
	 				$(".current").each(function(){
	 					arr.push($(this).attr("value"));
	 				});
	 				this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo=1";
	 				  	
	 		}); 
	 		$("#lastPage").click(function(){
	 			var t = $(".position_input").val();
	 			var arr = new Array();
	 			$(".current").each(function(){
	 				arr.push($(this).attr("value")); 
	 			});
	 			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo="+${pageinfo.pages };
	 		}) 
	 		$("#previousPage").click(function(){
	 			var t = $(".position_input").val();
	 			var arr = new Array();
	 			$(".current").each(function(){
	 				arr.push($(this).attr("value"));
	 			});
	 			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo="+${pageinfo.pageNum-1};
	 		})  
	 		$(".bb").click(function(){
	 			var t = $(".position_input").val();
	 			var arr = new Array();
	 			$(".current").each(function(){
	 				arr.push($(this).attr("value"));
	 			});
	 			var a = $(this).attr("value");
	 			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo="+a;
	 		}) 
	 		$(".aa").click(function(){
	 			var t = $(".position_input").val();
	 			var arr = new Array();
	 			$(".current").each(function(){
	 				arr.push($(this).attr("value"));
	 			});
	 			var f = $(this).attr("value");
	 			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo="+f;
	 		}) 
	 		$("#nextPage").click(function(){
	 			var t = $(".position_input").val();
	 			var arr = new Array();
	 			$(".current").each(function(){
	 				arr.push($(this).attr("value"));
	 			});
	 			this.href="positionInfo?key="+t+"&city="+arr[3]+"&args0="+arr[0]+"&args1="+arr[1]+"&args2="+arr[2]+"&pageNo="+${pageinfo.pageNum+1};
	 		}) 
	 		$(".companyLogo").click(function(){
				var cl = $(this).attr("value");
				this.href="postDetail?id="+cl;
	 		});
	 	});
	  	
			return false;
	});
$(function(){
	$(".insertpar").click(function(){
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
<jsp:include page="../base/userNav.jsp"></jsp:include>
    <div id="container">
		<div class="clearfix">
			<div class="content_l">
				<div class="position_box">
					<form id="searchForm" class="position_form" name="searchForm" action="list.html" method="get">
						<ul id="searchType">
							<li data-searchtype="1"  class="type_selected">关键词</li>
						</ul>
						<input type="text"  class="position_input" value="${key }"  name="key" placeholder="请输入关键词，如：开发、产品、销售"/>
						<input type="button" class="position_button" value="搜索"/>
					</form>
				</div>
				<form id="positionListForm" name="companyListForm" method="get" action="h/c/positionlist.html">
	                <input type="hidden" id="" name="city" value="全国" />
	                <input type="hidden" id="fs" name="fs" value="" />
	                <input type="hidden" id="ifs" name="ifs" value="" />
	                <input type="hidden" id="ol" name="ol" value="" />
	                <dl class="hc_tag">
	                    <dd>
							<dl id="workEx">
								<dt>工作年限：</dt>
								<dd>
									<span id="wk">
									</span>
								</dd>
							</dl>
							<dl id="Edu">
								<dt>教育经历：</dt>
								<dd>
									<span id="edu">
									</span>
								</dd>
							</dl>
							<dl id="HopeSalary"　class="financing">
								<dt>期望月薪：</dt>
								<dd>
									<span id="hs">
									</span>
								</dd>
							</dl>
							<dl>
								<dt>工作城市：</dt>
								<dd>
									<ul class="workplace workplace_position reset fr" id="workplaceSelect">
								 	   <li id="li"></li>
								 	   <li >
											<a id="All" href="" class="" value="全国">全国</a>
											|
										</li> 
										<li >
											<a id="bj" href="" class="" value="北京">北京</a>
											|
										</li>
										<li >
											<a id="sh" href="" class="" value="上海">上海</a>
											|
										</li>
										<li >
											<a id="gz" href="" class="" value="广州">广州</a>
											|
										</li>
										<li >
											<a id="sz" href="" class="" value="深圳">深圳</a>
											|
										</li>
										<li >
											<a id="cd" href="" class="" value="成都">成都</a>
											|
										</li>
										<li  class="more" >
											<a href="user/positionAllCitys.jsp" >全部城市</a>
											
									</ul>
								</dd>
							</dl>
	                    </dd>
	                </dl>
<div id="postId">
 	<ul class="hot_pos reset" id="resultList">
<c:if test="${empty pageinfo.list }">
		<img src="style/images/noPosition.png"/>
</c:if>
<c:if test="${!empty pageinfo.list }">
								<c:forEach items="${pageinfo.list }" var="p">
									<li class="odd clearfix" style="width: 700px">
										<div style="float: left">
											<a href="" class="companyLogo" value="${p.id }"><img width="85px" height="110px" src="${p.logo }"/></a>
										</div>
										<div style="float: left">
											<div class="mb10">
												<a href="h/jobs/86989.html" title="" target="_blank"></a>
												&nbsp; <span class="c9">[${p.workCity}]&nbsp;&nbsp;&nbsp;${p.p3name }
												</span>
											</div>
											<span><em class="c7">月薪：</em>${p.minSalary }-${p.maxSalary }</span>
											<span><em class="c7">经验：</em> ${p.weName }</span>
											<span><em class="c7">最低学历： </em>${p.ebName }</span>
											<br /> <span><em class="c7">职位诱惑：</em>${p.jobTempt }</span>
											<br /> <span><em class="c7">发布时间：</em>${p.strDate }</span>
										</div>
										<div class="apply">
											<a class="insertpar" name="${p.id}" target="_blank">投个简历</a>
										</div>
										<div style="float: left">
											<div class="mb10">
												<a href="CompanyListController/toCompany?id=${p.companyID }&pageNum=1" title="00" target="_blank">${p.companyName }</a>
											</div>
											<span><em class="c7">领域： </em>${p.domain }</span>
											<span><em class="c7">创始人：${p.founderName }</em>
												
											</span> <br /> 
											<span><em class="c7">规模： </em>${p.scale }</span> 
<!-- 											<span> -->
<!-- 												<ul class="companyTags reset"> -->
<!-- 													<em class="c7"></em> -->
<%-- 													<c:forEach items="${p.companyRegist.tags }" var="t"  --%>
<%-- 																begin="0" end="2"> --%>
<%--   														<li>${t.content }</li>  --%>
<%-- 													</c:forEach>  --%>
<!-- 												</ul> -->
<!-- 											</span> -->
										</div>
									</li>
								</c:forEach>
</c:if>
		</ul>
							<ul class="hc_list reset">
						<!-- 填写信息处 -->
					</ul>
					<div class="Pagination"></div>
					
					<input type="hidden" id="a0" value="${a0 }"/>
					<input type="hidden" id="a1" value="${a1 }"/>
					<input type="hidden" id="a2" value="${a2 }"/>
					<input type="hidden" id="a3" value="${a3 }"/>
					
<!-- 分页开始 -->	
<div class="container">
		<div class="col-md-8">
			<div class="col-md-4" style="top: 30px">
				<span  style="font-size: 15px; color: green">当前页码为   ${pageinfo.pageNum }  页        总共   ${pageinfo.pages }  页 </span>
			</div>
			<div class="col-md-8">
			<nav aria-label="Page navigation">
			  <ul  class="pagination">
			  	<li ><a id="firstPage" href="">首页</a></li>
			  	<c:if test="${pageinfo.hasPreviousPage }">
			    <li >
			      <a href="" aria-label="Previous" id="previousPage"> <span aria-hidden="true">&laquo;</span> </a>
			    </li>
			  	
			  	</c:if>
			   <c:forEach items="${pageinfo.navigatepageNums }" var="current">
			   		<c:if test="${pageinfo.pageNum==current}">
			   			<li class="active"><a class="bb" value="${current }" href="">${current }</a></li>
			   		</c:if>
			   		<c:if test="${pageinfo.pageNum!=current}">
			   			<li value="${current }"><a class="aa" value="${current }" href="">${current }</a></li>
			   		</c:if>
			   
			   </c:forEach>
			   		<c:if test="${pageinfo.hasNextPage }">
					    <li >
					      <a id="nextPage" href="" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a>
					    </li>
			   		</c:if>
			   		<li ><a href="" id="lastPage">末页</a></li>
			  </ul>
			</nav>
			</div>
		</div>
	</div>  
<!--分页结束  -->					
</div>
				</form>
</div>
			<div class="content_r">
				<div class="mycenterR">
					<h2>大家在看</h2>
				</div>
				<div class="look-position look-other">
						<img alt="w3c" src="style/images/QQADV.png">
				</div>
				<div class="mycenterR look-other">
					<div class="look-position look-other">
						<a target="_blank" href="http://www.w3school.com.cn/"><img alt="w3c" src="style/images/w3cplus.png"></a>
					</div>
					<br>
					<div class="look-position look-other">
						<a target="_blank" href="http://www.imooc.com/"><img alt="w3c" src="style/images/muke.jpg"></a>
					</div>
					
				</div>
			</div>
			</div><!-- end .content_r -->

   			<input type="hidden" value="" name="userid" id="userid" />
				<div class="clear"></div>
			<input type="hidden" id="resubmitToken" value="" />
	    	<a id="backtop" title="回到顶部" rel="nofollow"></a>
	    </div><!-- end #container -->
	</div><!-- end #body -->
	<jsp:include page="../base/footer.jsp"></jsp:include>

<script type="text/javascript" src="style/js/core.min.js"></script>
<script type="text/javascript" src="style/js/popup.min.js"></script>

<!--  -->

</body>
</html>