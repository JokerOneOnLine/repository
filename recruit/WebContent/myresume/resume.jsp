<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 
	高瑞 
	填写简历前必须先填写基本信息
 -->
<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'resume.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
</head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="renderer" content="webkit">
<meta property="qc:admins" content="23635710066417756375" />
<meta name="baidu-site-verification" content="QIQ6KC1oZ6" />
<meta charset="UTF-8">
<meta content="拉勾,拉勾网,拉勾招聘,拉钩, 拉钩网 ,互联网招聘,拉勾互联网招聘, 移动互联网招聘, 垂直互联网招聘, 微信招聘, 微博招聘, 拉勾官网, 拉勾百科,跳槽, 高薪职位, 互联网圈子, IT招聘, 职场招聘, 猎头招聘,O2O招聘, LBS招聘, 社交招聘, 校园招聘, 校招,社会招聘,社招" name="keywords"><meta content="拉勾网是3W旗下的互联网领域垂直招聘网站,互联网职业机会尽在拉勾网" name="description"><title>基本信息-我的简历-拉勾网-最专业的互联网招聘平台</title><link rel="Shortcut Icon" href="//img.lagou.com/www/static/common/static/favicon_faed927.ico">
<!-- global_domain FE_base... -->
<script type="text/javascript">
(function() {
    var protocol = window.location.protocol;
    var host = window.location.host;
    var baseUrl = protocol + '//' + host;

    window.GLOBAL_DOMAIN = window.GLOBAL_DOMAIN || {
        ctx: 'https://www.lagou.com',
        rctx: 'https://hr.lagou.com',
        crctx: 'https://hr.lagou.com/company',
        pctx: 'https://passport.lagou.com',
        actx: 'https://account.lagou.com',
        cpctx: 'https://xiaoyuan.lagou.com',
        paictx: 'https://pai.lagou.com',
        sctx: 'https://suggest.lagou.com',
        zctx: 'https://yanzhi.lagou.com',
        ectx: 'https://easy.lagou.com',
        proctx: 'https://pro.lagou.com',
        lgsctx: protocol + '//img.lagou.com',
        FE_frontLogin: baseUrl + '/frontLogin.do',
        FE_frontLogout: baseUrl + '/frontLogout.do',
        FE_frontRegister: baseUrl + '/frontRegister.do'
    };
    window.GLOBAL_CDN_DOMAIN = 'img.lagou.com';
})();
</script>
<script type="text/javascript" src="style/js/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#mrSaveThree").click(function(){
		var name=$("#name").val();
		var topdegree=$("#topdegree").val();
		var wokryear=$("#wokrYear").val();
		var phone=$("#phone").val();
		var city=$("#mrWokrCity").val();
		var url="userController/up";
		var data={
			name:name,
			topdegree:topdegree,
			workName:wokryear,
			tel:phone,
			addr:city,
			}
		$.ajax({
				async : false,
				url : url,
				data : data,
				type : "post",
				cache : false,
				success : function(result) {
					if(result.msg==null){
						window.location.href=("userController/toUserInfo");
					}else{
					alert("提交失败，请重新填写")
					}
				}
			});
			return false;
		})
	})
</script>
	<!-- 公共样式 -->
	<!-- 页面样式 -->    
    <!-- 动态token，防御伪造请求，重复提交 -->
    <script type="text/javascript">
    window.X_Anti_Forge_Token = '8b123928-1ccd-4f6e-b366-138d9eb5953f';
    window.X_Anti_Forge_Code = '82471095';
</script>


    <link rel="alternate" media="handheld" href="#" />

    <link rel="stylesheet" type="text/css" href="//img.lagou.com/www/static/pkg/mycenter/page/basic/main.html_aio_600e9e8.css" />
    <link rel="stylesheet" type="text/css" href="//img.lagou.com/www/static/pkg/widgets_bf2c4ac.css" />
    <link rel="stylesheet" type="text/css" href="//img.lagou.com/www/static/pkg/mycenter/page/basic/main.html_aio_2_cb301e0.css" />
</head>
<body>
	<!-- 页面主体START -->
	<div class="container clearfix" id="container">
		<!--
    @require "mycenter/modules/basic/basicform/main.less"
-->
<div>
	
 
    
    
  <div class="mr_container">
    	<div class="mr_basic">
    		
        	<form class="mr_basicform" id="mr_basicform" enctype="multipart/form-data">
        		
            	<div class="mr_basicname">
            	<dd>
            	
            	<h2 style="color: green;font-size: 40px;margin-bottom: 80px" align="center">基本信息</h2>
            	
            	</dd>
                	                	<input type="text" name="name" id="name" placeholder="姓名"/>
               	</div>
            	
            	<div class="endWork clearfixs">
                	<div class="mr_topdegree degree sel">
                    	                        <input type="hidden" name="topdegree" id="topdegree" />
                        <input type="button" value="最高学历" id="mrTopDegree" />
                    	                        <em></em>
                        <ul class="reset dn selUl">
                                                            <li>大专</li>
                                                            <li>本科</li>
                                                            <li>硕士</li>
                                                            <li>博士</li>
                                                            <li>其他</li>
                                                     </ul>
                	</div>
                	<div class="mr_workyear nextSel">
                    	                        <input type="hidden" name="wokrYear" id="wokrYear" />
                        <input type="button" value="工作年限" id="mrWokrYear" />
                    	                        <em></em>
                        <ul class="reset dn selUl">
                                                            <li>不限</li>
                                                            <li>应届毕业生</li>
                                                            <li>1年以下</li>
                                                            <li>1-3年</li>
                                                            <li>3-5年</li>
                                                            <li>5-10年</li>
                                                            <li>10年以上</li>
                                                    </ul>
                	</div>
            	</div>

            	<div class="mr_phone">
                	                                                <input type="text"  name="phone" id="phone"  placeholder="手机号" />
                                        	                	<div class="tips dn">
                    	<i></i>未经你的授权，企业不会看到你的联系方式，请放心填写：）
                	</div>
            	</div>

            	<div class="mr_phone">
                	                    <input type="text"  name="email" id="email"  readonly="readonly" placeholder="邮箱" value="${email }"/>
                	                    <div class="tips dn">
                        <i></i>未经你的授权，企业不会看到你的联系方式，请放心填写：）
                    </div>
            	</div>

            	<div class="mr_workcity" id="selectCity">
                	                    <input type="hidden" name="city" id="city" />
                	                    <label id="mrWokrCityLabel">
                                                    <input type="button" value="所在城市" id="mrWokrCity" />
                                                <em></em>
                    </label>

                	<div class="xl_list dn">
                    	<div class="mr_selCity">
                        	<ul class="reset mr_province">
                            	<li><span>热门城市</span><ul class="reset dn"></ul></li>

                            	                                	                                    <li>
                                        <span>北京</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">北京</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>上海</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">上海</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>天津</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">天津</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>重庆</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">重庆</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>河北</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">石家庄</li>
                                                                                            <li >唐山</li>
                                                                                            <li >秦皇岛</li>
                                                                                            <li >邯郸</li>
                                                                                            <li >邢台</li>
                                                                                            <li >保定</li>
                                                                                            <li >张家口</li>
                                                                                            <li >承德</li>
                                                                                            <li >沧州</li>
                                                                                            <li >廊坊</li>
                                                                                            <li >衡水</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>山西</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">太原</li>
                                                                                            <li >大同</li>
                                                                                            <li >阳泉</li>
                                                                                            <li >长治</li>
                                                                                            <li >晋城</li>
                                                                                            <li >朔州</li>
                                                                                            <li >晋中</li>
                                                                                            <li >运城</li>
                                                                                            <li >忻州</li>
                                                                                            <li >临汾</li>
                                                                                            <li >吕梁</li>
                                                                                            <li >永济市</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>内蒙古</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">呼和浩特</li>
                                                                                            <li >包头</li>
                                                                                            <li >乌海</li>
                                                                                            <li >赤峰</li>
                                                                                            <li >通辽</li>
                                                                                            <li >鄂尔多斯</li>
                                                                                            <li >呼伦贝尔</li>
                                                                                            <li >兴安盟</li>
                                                                                            <li >锡林郭勒盟</li>
                                                                                            <li >乌兰察布</li>
                                                                                            <li >巴彦淖尔</li>
                                                                                            <li >阿拉善盟</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>辽宁</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">沈阳</li>
                                                                                            <li >大连</li>
                                                                                            <li >鞍山</li>
                                                                                            <li >抚顺</li>
                                                                                            <li >本溪</li>
                                                                                            <li >丹东</li>
                                                                                            <li >锦州</li>
                                                                                            <li >营口</li>
                                                                                            <li >阜新</li>
                                                                                            <li >辽阳</li>
                                                                                            <li >盘锦</li>
                                                                                            <li >铁岭</li>
                                                                                            <li >朝阳</li>
                                                                                            <li >葫芦岛</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>吉林</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">长春</li>
                                                                                            <li >吉林</li>
                                                                                            <li >四平</li>
                                                                                            <li >辽源</li>
                                                                                            <li >通化</li>
                                                                                            <li >白山</li>
                                                                                            <li >松原</li>
                                                                                            <li >白城</li>
                                                                                            <li >延边朝鲜族自治州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>黑龙江</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">哈尔滨</li>
                                                                                            <li >齐齐哈尔</li>
                                                                                            <li >鸡西</li>
                                                                                            <li >鹤岗</li>
                                                                                            <li >双鸭山</li>
                                                                                            <li >大庆</li>
                                                                                            <li >伊春</li>
                                                                                            <li >佳木斯</li>
                                                                                            <li >七台河</li>
                                                                                            <li >牡丹江</li>
                                                                                            <li >黑河</li>
                                                                                            <li >绥化</li>
                                                                                            <li >大兴安岭地区</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>江苏</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">南京</li>
                                                                                            <li >苏州</li>
                                                                                            <li >昆山</li>
                                                                                            <li >常熟</li>
                                                                                            <li >张家港</li>
                                                                                            <li >无锡</li>
                                                                                            <li >江阴</li>
                                                                                            <li >徐州</li>
                                                                                            <li >常州</li>
                                                                                            <li >南通</li>
                                                                                            <li >连云港</li>
                                                                                            <li >淮安</li>
                                                                                            <li >盐城</li>
                                                                                            <li >扬州</li>
                                                                                            <li >镇江</li>
                                                                                            <li >泰州</li>
                                                                                            <li >靖江</li>
                                                                                            <li >宿迁</li>
                                                                                            <li >太仓</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>浙江</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">杭州</li>
                                                                                            <li >宁波</li>
                                                                                            <li >温州</li>
                                                                                            <li >海宁</li>
                                                                                            <li >嘉兴</li>
                                                                                            <li >湖州</li>
                                                                                            <li >绍兴</li>
                                                                                            <li >金华</li>
                                                                                            <li >衢州</li>
                                                                                            <li >舟山</li>
                                                                                            <li >台州</li>
                                                                                            <li >丽水</li>
                                                                                            <li >玉环县</li>
                                                                                            <li >方家山</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>安徽</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">合肥</li>
                                                                                            <li >芜湖</li>
                                                                                            <li >蚌埠</li>
                                                                                            <li >淮南</li>
                                                                                            <li >马鞍山</li>
                                                                                            <li >淮北</li>
                                                                                            <li >铜陵</li>
                                                                                            <li >安庆</li>
                                                                                            <li >黄山</li>
                                                                                            <li >滁州</li>
                                                                                            <li >阜阳</li>
                                                                                            <li >宿州</li>
                                                                                            <li >巢湖</li>
                                                                                            <li >六安</li>
                                                                                            <li >亳州</li>
                                                                                            <li >池州</li>
                                                                                            <li >宣城</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>福建</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">福州</li>
                                                                                            <li >厦门</li>
                                                                                            <li >莆田</li>
                                                                                            <li >三明</li>
                                                                                            <li >泉州</li>
                                                                                            <li >泉港区</li>
                                                                                            <li >漳州</li>
                                                                                            <li >南平</li>
                                                                                            <li >龙岩</li>
                                                                                            <li >宁德</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>江西</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">南昌</li>
                                                                                            <li >景德镇</li>
                                                                                            <li >萍乡</li>
                                                                                            <li >九江</li>
                                                                                            <li >新余</li>
                                                                                            <li >鹰潭</li>
                                                                                            <li >赣州</li>
                                                                                            <li >吉安</li>
                                                                                            <li >宜春</li>
                                                                                            <li >抚州</li>
                                                                                            <li >上饶</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>山东</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">济南</li>
                                                                                            <li >青岛</li>
                                                                                            <li >淄博</li>
                                                                                            <li >枣庄</li>
                                                                                            <li >东营</li>
                                                                                            <li >烟台</li>
                                                                                            <li >潍坊</li>
                                                                                            <li >济宁</li>
                                                                                            <li >泰安</li>
                                                                                            <li >威海</li>
                                                                                            <li >日照</li>
                                                                                            <li >莱芜</li>
                                                                                            <li >临沂</li>
                                                                                            <li >德州</li>
                                                                                            <li >聊城</li>
                                                                                            <li >滨州</li>
                                                                                            <li >菏泽</li>
                                                                                            <li >章丘</li>
                                                                                            <li >荣成</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>河南</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">郑州</li>
                                                                                            <li >开封</li>
                                                                                            <li >洛阳</li>
                                                                                            <li >平顶山</li>
                                                                                            <li >安阳</li>
                                                                                            <li >鹤壁</li>
                                                                                            <li >新乡</li>
                                                                                            <li >焦作</li>
                                                                                            <li >濮阳</li>
                                                                                            <li >许昌</li>
                                                                                            <li >漯河</li>
                                                                                            <li >三门峡</li>
                                                                                            <li >南阳</li>
                                                                                            <li >商丘</li>
                                                                                            <li >信阳</li>
                                                                                            <li >周口</li>
                                                                                            <li >驻马店</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>湖北</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">武汉</li>
                                                                                            <li >黄石</li>
                                                                                            <li >十堰</li>
                                                                                            <li >宜昌</li>
                                                                                            <li >襄樊</li>
                                                                                            <li >鄂州</li>
                                                                                            <li >荆门</li>
                                                                                            <li >孝感</li>
                                                                                            <li >荆州</li>
                                                                                            <li >黄冈</li>
                                                                                            <li >咸宁</li>
                                                                                            <li >随州</li>
                                                                                            <li >恩施土家族苗族自治州</li>
                                                                                            <li >襄阳</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>湖南</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">长沙</li>
                                                                                            <li >株洲</li>
                                                                                            <li >湘潭</li>
                                                                                            <li >衡阳</li>
                                                                                            <li >邵阳</li>
                                                                                            <li >岳阳</li>
                                                                                            <li >常德</li>
                                                                                            <li >张家界</li>
                                                                                            <li >益阳</li>
                                                                                            <li >郴州</li>
                                                                                            <li >永州</li>
                                                                                            <li >怀化</li>
                                                                                            <li >娄底</li>
                                                                                            <li >湘西土家族苗族自治州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>广东</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">广州</li>
                                                                                            <li >深圳</li>
                                                                                            <li >韶关</li>
                                                                                            <li >珠海</li>
                                                                                            <li >汕头</li>
                                                                                            <li >佛山</li>
                                                                                            <li >南海区</li>
                                                                                            <li >江门</li>
                                                                                            <li >湛江</li>
                                                                                            <li >茂名</li>
                                                                                            <li >肇庆</li>
                                                                                            <li >惠州</li>
                                                                                            <li >梅州</li>
                                                                                            <li >汕尾</li>
                                                                                            <li >河源</li>
                                                                                            <li >阳江</li>
                                                                                            <li >清远</li>
                                                                                            <li >东莞</li>
                                                                                            <li >中山</li>
                                                                                            <li >潮州</li>
                                                                                            <li >揭阳</li>
                                                                                            <li >云浮</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>广西</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">南宁</li>
                                                                                            <li >柳州</li>
                                                                                            <li >桂林</li>
                                                                                            <li >梧州</li>
                                                                                            <li >北海</li>
                                                                                            <li >防城港</li>
                                                                                            <li >钦州</li>
                                                                                            <li >贵港</li>
                                                                                            <li >玉林</li>
                                                                                            <li >百色</li>
                                                                                            <li >贺州</li>
                                                                                            <li >河池</li>
                                                                                            <li >来宾</li>
                                                                                            <li >崇左</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>海南</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">海口</li>
                                                                                            <li >三亚</li>
                                                                                            <li >洋浦市</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>四川</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">成都</li>
                                                                                            <li >自贡</li>
                                                                                            <li >攀枝花</li>
                                                                                            <li >泸州</li>
                                                                                            <li >德阳</li>
                                                                                            <li >绵阳</li>
                                                                                            <li >广元</li>
                                                                                            <li >遂宁</li>
                                                                                            <li >内江</li>
                                                                                            <li >乐山</li>
                                                                                            <li >南充</li>
                                                                                            <li >眉山</li>
                                                                                            <li >宜宾</li>
                                                                                            <li >广安</li>
                                                                                            <li >达州</li>
                                                                                            <li >雅安</li>
                                                                                            <li >巴中</li>
                                                                                            <li >资阳</li>
                                                                                            <li >阿坝藏族羌族自治州</li>
                                                                                            <li >甘孜藏族自治州</li>
                                                                                            <li >凉山彝族自治州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>贵州</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">贵阳</li>
                                                                                            <li >六盘水</li>
                                                                                            <li >遵义</li>
                                                                                            <li >安顺</li>
                                                                                            <li >铜仁地区</li>
                                                                                            <li >黔西南布依族苗族自治州</li>
                                                                                            <li >毕节地区</li>
                                                                                            <li >黔东南苗族侗族自治州</li>
                                                                                            <li >黔南布依族苗族自治州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>云南</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">昆明</li>
                                                                                            <li >曲靖</li>
                                                                                            <li >玉溪</li>
                                                                                            <li >保山</li>
                                                                                            <li >昭通</li>
                                                                                            <li >楚雄彝族自治州</li>
                                                                                            <li >红河哈尼族彝族自治州</li>
                                                                                            <li >文山壮族苗族自治州</li>
                                                                                            <li >思茅</li>
                                                                                            <li >西双版纳傣族自治州</li>
                                                                                            <li >德宏傣族景颇族自治州</li>
                                                                                            <li >大理白族自治州</li>
                                                                                            <li >丽江</li>
                                                                                            <li >怒江傈僳族自治州</li>
                                                                                            <li >迪庆藏族自治州</li>
                                                                                            <li >临沧</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>陕西</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">西安</li>
                                                                                            <li >铜川</li>
                                                                                            <li >宝鸡</li>
                                                                                            <li >咸阳</li>
                                                                                            <li >渭南</li>
                                                                                            <li >延安</li>
                                                                                            <li >汉中</li>
                                                                                            <li >榆林</li>
                                                                                            <li >安康</li>
                                                                                            <li >商洛</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>西藏</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">拉萨</li>
                                                                                            <li >昌都</li>
                                                                                            <li >山南</li>
                                                                                            <li >日喀则</li>
                                                                                            <li >那曲</li>
                                                                                            <li >阿里</li>
                                                                                            <li >林芝</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>甘肃</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">兰州</li>
                                                                                            <li >嘉峪关</li>
                                                                                            <li >金昌</li>
                                                                                            <li >白银</li>
                                                                                            <li >天水</li>
                                                                                            <li >武威</li>
                                                                                            <li >张掖</li>
                                                                                            <li >平凉</li>
                                                                                            <li >酒泉</li>
                                                                                            <li >庆阳</li>
                                                                                            <li >定西</li>
                                                                                            <li >陇南</li>
                                                                                            <li >临夏回族自治州</li>
                                                                                            <li >甘南藏族自治州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>青海</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">西宁</li>
                                                                                            <li >海晏</li>
                                                                                            <li >海东</li>
                                                                                            <li >海北</li>
                                                                                            <li >黄南</li>
                                                                                            <li >海南</li>
                                                                                            <li >果洛</li>
                                                                                            <li >玉树</li>
                                                                                            <li >海西</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>宁夏</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">银川</li>
                                                                                            <li >石嘴山</li>
                                                                                            <li >吴忠</li>
                                                                                            <li >固原</li>
                                                                                            <li >中卫</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>新疆</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">乌鲁木齐</li>
                                                                                            <li >石河子</li>
                                                                                            <li >克拉玛依</li>
                                                                                            <li >吐鲁番</li>
                                                                                            <li >哈密</li>
                                                                                            <li >昌吉</li>
                                                                                            <li >博乐</li>
                                                                                            <li >和田</li>
                                                                                            <li >阿克苏</li>
                                                                                            <li >阿勒</li>
                                                                                            <li >喀什</li>
                                                                                            <li >塔城</li>
                                                                                            <li >库尔勒</li>
                                                                                            <li >伊犁</li>
                                                                                            <li >克州</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>香港</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">香港</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>澳门</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">澳门</li>
                                                                                    </ul>
                                    </li>
                                	                                    <li>
                                        <span>台湾</span>
                                        <ul class="reset dn">
                                            <li class="mr_on">台湾</li>
                                                                                            <li >新加坡</li>
                                                                                    </ul>
                                    </li>
                                	                            	                       		 </ul>
                    	</div>
                	</div>
            	</div>

            	<label><input type="submit" id="mrSaveThree" value="下一步：继续完善职业信息" form="mr_basicform"  data-val="0"/></label>
            	            	<label><a  id="mrSaveBasic" href="" data-val="1"/>保存以上信息，但暂不继续完善信息</a></label>
        	</form>

        	<div class="mr_btm">&nbsp;</div>
        	<input type="hidden" value="" id="resumeId"/>
    	</div>

    	<input type="hidden" value="0" id="pageType" />
    	<input type="hidden" value="" id="resubmitToken" />
	</div>
	<!--
    @require "mycenter/modules/basic/basic_pop/main.less"
-->
<div style="display:none">
    <div class="popup" id="uploadImages" style="overflow:hidden;width:360px;height:470px;">
        <div class="crop">
            <div id="cropzoom_container" style="overflow:hidden;"></div>
            <div class="page_btn">
                <input type="button" class="btn" id="crop" value="确定" />
                <input type="button" class="cancel" id="restore" value="取消" />
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</div>

	</div>
	<!-- 页面主体END -->

	<!-- jquery lib -->
	<!-- analytics js file -->	<!-- plat analytics js file -->
<script type="text/javascript" src="//img.lagou.com/www/static/pkg/vendor_e3ddeee.js"></script>
<script type="text/javascript" src="//img.lagou.com/www/static/pkg/mycenter/page/basic/main.html_aio_cc6baa3.js"></script>
<script type="text/javascript" src="//img.lagou.com/www/static/pkg/widgets_00f507c.js"></script>
<script type="text/javascript" src="//img.lagou.com/www/static/pkg/mycenter/page/basic/main.html_aio_2_e02ffd8.js"></script>
<script type="text/javascript">
		window.globals = {
			token: '',
			city: '[{8611={otherCitys=[], province=北京, capital=北京}, 8612={otherCitys=[], province=上海, capital=上海}, 8613={otherCitys=[], province=天津, capital=天津}, 8614={otherCitys=[], province=重庆, capital=重庆}, 8615={otherCitys=[唐山, 秦皇岛, 邯郸, 邢台, 保定, 张家口, 承德, 沧州, 廊坊, 衡水], province=河北, capital=石家庄}, 8616={otherCitys=[大同, 阳泉, 长治, 晋城, 朔州, 晋中, 运城, 忻州, 临汾, 吕梁, 永济市], province=山西, capital=太原}, 8617={otherCitys=[包头, 乌海, 赤峰, 通辽, 鄂尔多斯, 呼伦贝尔, 兴安盟, 锡林郭勒盟, 乌兰察布, 巴彦淖尔, 阿拉善盟], province=内蒙古, capital=呼和浩特}, 8618={otherCitys=[大连, 鞍山, 抚顺, 本溪, 丹东, 锦州, 营口, 阜新, 辽阳, 盘锦, 铁岭, 朝阳, 葫芦岛], province=辽宁, capital=沈阳}, 8619={otherCitys=[吉林, 四平, 辽源, 通化, 白山, 松原, 白城, 延边朝鲜族自治州], province=吉林, capital=长春}, 8620={otherCitys=[齐齐哈尔, 鸡西, 鹤岗, 双鸭山, 大庆, 伊春, 佳木斯, 七台河, 牡丹江, 黑河, 绥化, 大兴安岭地区], province=黑龙江, capital=哈尔滨}, 8621={otherCitys=[苏州, 昆山, 常熟, 张家港, 无锡, 江阴, 徐州, 常州, 南通, 连云港, 淮安, 盐城, 扬州, 镇江, 泰州, 靖江, 宿迁, 太仓], province=江苏, capital=南京}, 8622={otherCitys=[宁波, 温州, 海宁, 嘉兴, 湖州, 绍兴, 金华, 衢州, 舟山, 台州, 丽水, 玉环县, 方家山], province=浙江, capital=杭州}, 8623={otherCitys=[芜湖, 蚌埠, 淮南, 马鞍山, 淮北, 铜陵, 安庆, 黄山, 滁州, 阜阳, 宿州, 巢湖, 六安, 亳州, 池州, 宣城], province=安徽, capital=合肥}, 8624={otherCitys=[厦门, 莆田, 三明, 泉州, 泉港区, 漳州, 南平, 龙岩, 宁德], province=福建, capital=福州}, 8625={otherCitys=[景德镇, 萍乡, 九江, 新余, 鹰潭, 赣州, 吉安, 宜春, 抚州, 上饶], province=江西, capital=南昌}, 8626={otherCitys=[青岛, 淄博, 枣庄, 东营, 烟台, 潍坊, 济宁, 泰安, 威海, 日照, 莱芜, 临沂, 德州, 聊城, 滨州, 菏泽, 章丘, 荣成], province=山东, capital=济南}, 8627={otherCitys=[开封, 洛阳, 平顶山, 安阳, 鹤壁, 新乡, 焦作, 濮阳, 许昌, 漯河, 三门峡, 南阳, 商丘, 信阳, 周口, 驻马店], province=河南, capital=郑州}, 8628={otherCitys=[黄石, 十堰, 宜昌, 襄樊, 鄂州, 荆门, 孝感, 荆州, 黄冈, 咸宁, 随州, 恩施土家族苗族自治州, 襄阳], province=湖北, capital=武汉}, 8629={otherCitys=[株洲, 湘潭, 衡阳, 邵阳, 岳阳, 常德, 张家界, 益阳, 郴州, 永州, 怀化, 娄底, 湘西土家族苗族自治州], province=湖南, capital=长沙}, 8630={otherCitys=[深圳, 韶关, 珠海, 汕头, 佛山, 南海区, 江门, 湛江, 茂名, 肇庆, 惠州, 梅州, 汕尾, 河源, 阳江, 清远, 东莞, 中山, 潮州, 揭阳, 云浮], province=广东, capital=广州}, 8631={otherCitys=[柳州, 桂林, 梧州, 北海, 防城港, 钦州, 贵港, 玉林, 百色, 贺州, 河池, 来宾, 崇左], province=广西, capital=南宁}, 8632={otherCitys=[三亚, 洋浦市], province=海南, capital=海口}, 8633={otherCitys=[自贡, 攀枝花, 泸州, 德阳, 绵阳, 广元, 遂宁, 内江, 乐山, 南充, 眉山, 宜宾, 广安, 达州, 雅安, 巴中, 资阳, 阿坝藏族羌族自治州, 甘孜藏族自治州, 凉山彝族自治州], province=四川, capital=成都}, 8634={otherCitys=[六盘水, 遵义, 安顺, 铜仁地区, 黔西南布依族苗族自治州, 毕节地区, 黔东南苗族侗族自治州, 黔南布依族苗族自治州], province=贵州, capital=贵阳}, 8635={otherCitys=[曲靖, 玉溪, 保山, 昭通, 楚雄彝族自治州, 红河哈尼族彝族自治州, 文山壮族苗族自治州, 思茅, 西双版纳傣族自治州, 德宏傣族景颇族自治州, 大理白族自治州, 丽江, 怒江傈僳族自治州, 迪庆藏族自治州, 临沧], province=云南, capital=昆明}, 8636={otherCitys=[铜川, 宝鸡, 咸阳, 渭南, 延安, 汉中, 榆林, 安康, 商洛], province=陕西, capital=西安}, 8637={otherCitys=[昌都, 山南, 日喀则, 那曲, 阿里, 林芝], province=西藏, capital=拉萨}, 8638={otherCitys=[嘉峪关, 金昌, 白银, 天水, 武威, 张掖, 平凉, 酒泉, 庆阳, 定西, 陇南, 临夏回族自治州, 甘南藏族自治州], province=甘肃, capital=兰州}, 8639={otherCitys=[海晏, 海东, 海北, 黄南, 海南, 果洛, 玉树, 海西], province=青海, capital=西宁}, 8640={otherCitys=[石嘴山, 吴忠, 固原, 中卫], province=宁夏, capital=银川}, 8641={otherCitys=[石河子, 克拉玛依, 吐鲁番, 哈密, 昌吉, 博乐, 和田, 阿克苏, 阿勒, 喀什, 塔城, 库尔勒, 伊犁, 克州], province=新疆, capital=乌鲁木齐}, 8642={otherCitys=[], province=香港, capital=香港}, 8643={otherCitys=[], province=澳门, capital=澳门}, 8644={otherCitys=[新加坡], province=台湾, capital=台湾}}]'
		};
	

	    //业务主模块
	    require(['mycenter/page/basic/main']);
	</script>
<script type="text/javascript" src="//img.lagou.com/www/static/pkg/lg-analytics_ea85146.js"></script>
<script type="text/javascript" src="https://www.lagou.com/upload/oss.js"></script></body>
</html>

