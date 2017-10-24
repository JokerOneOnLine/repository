<%@ page language="java"  isELIgnored="false" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 渭南师范二期梁琼     * 2017年9.28日  -->
<!--渭南师范学院二期 郝磊  20170824 -->
<!-- 渭南师范二期zjh     * 2017年9月21日  修改页面 -->
<!DOCTYPE HTML>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
	<base href="<%=basePath%>">
    <script id="allmobilize" charset="utf-8" src="style/js/allmobilize.min.js"></script>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="alternate" media="handheld"/>
    <!-- end 云适配 -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta property="qc:admins" content="23635710066417756375"/>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name="baidu-site-verification" content="QIQ6KC1oZ6"/>

    <!-- <div class="web_root"  style="display:none">h</div> -->
    <script type="text/javascript">
        var ctx = "h";
        console.log(1);
    </script>
    <link rel="Shortcut Icon" href="h/images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="style/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/external.min.css"/>
    <link rel="stylesheet" type="text/css" href="style/css/popup.css"/>
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
    <script type="text/javascript" src="style/js/conv.js"></script>
    <script src="style/js/jquery.1.10.1.min.js" type="text/javascript"></script>
	<script type="text/javascript">
	function sousuo(){
		$("#search_button").click(function(){
			async:false;
			var keyWord = $("#search_input").val();
			window.location.href="positionInfo?key="+keyWord+"&city=全国&args0=1&args1=1&args2=1&pageNo=1";
		});
	}
	$(function(){
		sousuo();
		setTimeout("sousuo()", 1); 
	});
	
	</script>
</head>
<body>
 <jsp:include page="/base/userNav.jsp"></jsp:include>
	<div id="container">
		<div id="sidebar">
			<div class="mainNavs">
				<c:forEach items="${ps1}" var="p">
					<div class="menu_box">
						<div class="menu_main">
	                        <h2>${p.name } <span></span></h2>
	                        <c:forEach items="${p.positions[0].positions }" begin="0" end="7" var="ppp">
	                        	<a href="positionInfo?pageNo=1&key=${ppp.name }&args0=1&args1=1&args2=1&city=全国">${ppp.name }</a>
	                        </c:forEach>
                 		</div>
                 		<div class="menu_sub dn">
               				<c:forEach items="${p.positions }" var="pp">
	                 			<dl class="reset">
                 					<dt>
                 						<a href="positionInfo?pageNo=1&key=${pp.name }&args0=1&args1=1&args2=1&city=全国">${pp.name }</a>
                 					</dt>
                 					<dd>
		                 				<c:forEach items="${pp.positions }" var="ppp">
		                 					<a href="positionInfo?pageNo=1&key=${ppp.name }&args0=1&args1=1&args2=1&city=全国">${ppp.name }</a>
		                 				</c:forEach>
                 					</dd>
	                 			</dl>
               				</c:forEach>
                 		</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="content">
            <div id="search_box">
                <form id="searchForm" name="searchForm" action="" method="get">
                    <ul id="searchType">
                        <li data-searchtype="1" class="type_selected">职位</li>
                        <!-- <li data-searchtype="4">公司</li> -->
                    </ul>
                    <div class="searchtype_arrow"></div>
                    <input type="text" id="search_input" name="kd" tabindex="1" value="" placeholder="请输入职位名称，如：产品经理"/>
                    <input type="button" id="search_button" value="搜索"/>
                </form>
            </div>
            <style>
                .ui-autocomplete {
                    width: 488px;
                    background: #fafafa !important;
                    position: relative;
                    z-index: 10;
                    border: 2px solid #91cebe;
                }

                .ui-autocomplete-category {
                    font-size: 16px;
                    color: #999;
                    width: 50px;
                    position: absolute;
                    z-index: 11;
                    right: 0px; /*top: 6px; */
                    text-align: center;
                    border-top: 1px dashed #e5e5e5;
                    padding: 5px 0;
                }

                .ui-menu-item {
                    *width: 439px;
                    vertical-align: middle;
                    position: relative;
                    margin: 0px;
                    margin-right: 50px !important;
                    background: #fff;
                    border-right: 1px dashed #ededed;
                }

                .ui-menu-item a {
                    display: block;
                    overflow: hidden;
                }
            </style>
            <script type="text/javascript" src="style/js/search.min.js"></script>
            <dl class="hotSearch">
                <dt>热门搜索：</dt>
                <dd><a href="positionInfo?pageNo=1&key=Java&args0=1&args1=1&args2=1&city=全国">Java</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=PHP&args0=1&args1=1&args2=1&city=全国">PHP</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=Android&args0=1&args1=1&args2=1&city=全国">Android</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=iOS&args0=1&args1=1&args2=1&city=全国">iOS</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=前端&args0=1&args1=1&args2=1&city=全国">前端</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=产品经理 &args0=1&args1=1&args2=1&city=全国">产品经理</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=UI&args0=1&args1=1&args2=1&city=全国">UI</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=运营&args0=1&args1=1&args2=1&city=全国">运营</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=BD&args0=1&args1=1&args2=1&city=全国">BD</a></dd>
                <dd><a href="positionInfo?pageNo=1&key=实习 &args0=1&args1=1&args2=1&city=全国">实习</a></dd>
            </dl>
            <div id="home_banner">
                <ul class="banner_bg">
                    <li class="banner_bg_1 current">
                        <a href="h/subject/s_buyfundation.html?utm_source=DH__lagou&utm_medium=banner&utm_campaign=haomai"
                           target="_blank"><img src="style/images/1.png" width="612"
                                                height="160" alt="好买基金——来了就给100万"/></a>
                    </li>
                    <li class="banner_bg_2">
                        <a href="h/subject/s_worldcup.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=wc"
                           target="_blank"><img src="style/images/4.png" width="612"
                                                height="160" alt="世界杯放假看球，老板我也要！"/></a>
                    </li>
                    <li class="banner_bg_3">
                        <a href="h/subject/s_xiamen.html?utm_source=DH__lagou&utm_medium=home&utm_campaign=xiamen"
                           target="_blank"><img src="style/images/5.png" width="612"
                                                height="160" alt="出北京记——第一站厦门"/></a>
                    </li>
                </ul>
                <div class="banner_control">
                    <em></em>
                    <ul class="thumbs">
                        <li class="thumbs_1 current">
                            <i></i>
                            <img src="style/images/1.png" width="113" height="42"/>
                        </li>
                        <li class="thumbs_2">
                            <i></i>
                            <img src="style/images/4.png" width="113" height="42"/>
                        </li>
                        <li class="thumbs_3">
                            <i></i>
                            <img src="style/images/5.png" width="113" height="42"/>
                        </li>
                    </ul>
                </div>
            </div><!--/#main_banner-->

            <ul id="da-thumbs" class="da-thumbs">
                <li>
                    <a href="CompanyListController/toCompany?id=11&pageNum=1" target="_blank">
                        <img src="style/images/a254b11ecead45bda166afa8aaa9c8bc.jpg" width="113" height="113" alt="联想"/>
                        <div class="hot_info">
                            <h2 title="联想">联想</h2>
                            <em></em>
                            <p title="世界因联想更美好">
                                世界因联想更美好
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="CompanyListController/toCompany?id=25&pageNum=1"" target="_blank">
                        <img src="style/images/c75654bc2ab141df8218983cfe5c89f9.jpg" width="113" height="113" alt="淘米"/>
                        <div class="hot_info">
                            <h2 title="淘米">淘米</h2>
                            <em></em>
                            <p title="将心注入 追求极致">
                                将心注入 追求极致
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="CompanyListController/toCompany?id=28&pageNum=1"" target="_blank">
                        <img src="style/images/2bba2b71d0b0443eaea1774f7ee17c9f.png" width="113" height="113"
                             alt="优酷土豆"/>
                        <div class="hot_info">
                            <h2 title="优酷土豆">优酷土豆</h2>
                            <em></em>
                            <p title="专注于视频领域，是中国网络视频行业领军企业">
                                专注于视频领域，是中国网络视频行业领军企业
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="companyPages.html" target="_blank">
                        <img src="style/images/6.png" width="113" height="113"
                             alt="思特沃克"/>
                        <div class="hot_info">
                            <h2 title="蓝桥软件学院">蓝桥软件学院</h2>
                            <em></em>
                            <p title="一家全球信息技术服务公司">
                                一家全球信息技术服务公司
                            </p>
                        </div>
                    </a>
                </li>
                <li>
                    <a href="h/c/2700.html" target="_blank">
                        <img src="style/images/7.png" width="113" height="113" alt="奇猫"/>
                        <div class="hot_info">
                            <h2 title="渭南师范">渭南师范</h2>
                            <em></em>
                            <p title="专注于信息人才的培养">
                                专注于移动互联网人才的培养
                            </p>
                        </div>
                    </a>
                </li>
                <li class="last">
                    <a href="h/c/1335.html" target="_blank">
                        <img src="style/images/8.png" width="113" height="113"
                             alt="GoSpuresGo"/>
                        <div class="hot_info">
                            <h4 title="GoSpureGo">GoSpuresGo</h4>
                            <em></em>
                            <p title="来打球吧，遇见世界上的另外一个你">
                            来打球吧，遇见世界上的另外一个你
                            </p>
                        </div>
                    </a>
                </li>
            </ul>
            <!-- 图片 -->
            <li class="banner_bg_1 current">
                    <a href="javascript:;"
                    target="_blank"><img src="style/images/2.png" width="750"
                    height="340" alt="好买基金——来了就给100万"/></a>
             </li>
            <li class="banner_bg_1 current">
                    <a href="#"
                    target="_blank"><img src="style/images/3.png" width="750"
                    height="340" alt="好买基金——来了就给100万"/></a>
             </li>
            <!-- 图片结束 -->
            <br><br>
            </div>
		<input type="hidden" value="" name="userid" id="userid" />
		<script type="text/javascript" src="style/js/Chart.min.js"></script>
		<script type="text/javascript" src="style/js/home.min.js"></script>
		<script type="text/javascript" src="style/js/count.js"></script>
	</div>
	<script type="text/javascript" src="style/js/core.min.js"></script>
	<script type="text/javascript" src="style/js/popup.min.js"></script>
	<jsp:include page="../base/footer.jsp"></jsp:include>
</body>
</html>