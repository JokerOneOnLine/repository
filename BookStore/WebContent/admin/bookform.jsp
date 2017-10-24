<%@ page language="java" isELIgnored="false"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String path =request.getContextPath() +"/";%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href ="<%=path%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="themes/default/default.css" />
	<link rel="stylesheet" href="plugins/code/prettify.css" />
	<script charset="utf-8" src="kindeditor.js"></script>
	<script charset="utf-8" src="lang/zh_CN.js"></script>
	<script charset="utf-8" src="plugins/code/prettify.js"></script>
	<link type="text/css" rel="stylesheet" href="css/bootstrap.css">
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="detail"]', {
				cssPath : 'plugins/code/prettify.css',
				uploadJson : 'base/upload_json.jsp',
				fileManagerJson : 'base/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
</head>
<body>
 <jsp:include page="/admin/adminNav.jsp"></jsp:include>
 <div class="container">
 		<center><h4>增加图书</h4></center>
	 <form class="form" action="BookServlet/insert" method="post" enctype="multipart/form-data">
			  <div class="form-group">
			    <label for="nameInput">书名</label>
			    <input type="text"name="name" class="form-control" id="nameInput" placeholder="书名">
			  </div>
			  <div class="form-group">
			    <label for="stockInput">库存</label>
			    <input type="number" name="stock" class="form-control" id="stockInput" placeholder="库存">
			  </div>
			  <div class="form-group">
			    <label for="priceInput">价格</label>
			    <input type="text" id="priceInput"class="form-control"  name="price"placeholder="价格">
			  </div>
			  <div class="form-group">
			    <label for="publishInput">出版社</label>
			    <input type="text" id="publishInput" class="form-control" name="publishedby">
			  </div>
			  <div class="form-group">
			    <label for="authorInput">作者</label>
			    <input type="text" id="authorInput" class="form-control" name="author">
			  </div>
			  <div class="form-group">
			    <label for="surfaceInput">封面</label>
			    <input type="file" id="surfaceInput" name="surface">
			  </div>
			  <label for="detailInput">详情</label>
			  <textarea name="detail" id="detailInput" cols="100" rows="8" style="width:1140px;height:200px;visibility:hidden;"class="form-control" ></textarea>
			  <input type="submit" class="btn btn-default" value="提交">
 </form>
 </div>
</body>
</html>