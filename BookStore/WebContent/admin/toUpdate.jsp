<%@ page language="java" isELIgnored="false"  contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
 <% String path =request.getContextPath() +"/";%>   
<!DOCTYPE html >
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
	 <form class="form" action="BookServlet/update"method="post" enctype="multipart/form-data">
	 			<input type="hidden" name="id" value="${book.id }" >
			  <div class="form-group">
			    <label for="nameInput">书名</label>
			    <input type="text"name="name" class="form-control"  value="${book.name }">
			  </div>
			  <div class="form-group">
			    <label for="stockInput">库存</label>
			    <input type="number" name="stock" class="form-control" value="${book.stock }">
			  </div>
			  <div class="form-group">
			    <label for="priceInput">价格</label>
			    <input type="text" class="form-control"  name="price"value="${book.price}">
			  </div>
			  <div class="form-group">
			    <label for="publishInput">出版社</label>
			    <input type="text"class="form-control" name="publishedby"value="${book.publishedby }">
			  </div>
			  <div class="form-group">
			    <label for="authorInput">作者</label>
			    <input type="text" class="form-control" name="author"value="${book.author }">
			  </div>
			  <div class="form-group">
			    <label for="surfaceInput">封面</label>
			    <input type="file" name="surface" ><img alt="${book.name }" src="${book.surface }" width="80px" height="60px" >
			  </div>
			  <div>
			   <!--  <iframe src="${book.detail }" width="400px" height="200px" border="0" application="yes" border="0" align="left"></iframe>-->
					<textarea name="detail" id="detailInput" cols="100" rows="8" style="width:1140px;height:200px;visibility:hidden;"class="form-control" ></textarea>
			  </div>
			  <button type="submit" class="btn btn-default">提交</button>
 </form>
 </div>
</body>
</html>