<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html >
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>服务器内部错误</title>
<link href="style/css/style1.css" type="text/css" rel="stylesheet">
</head>
<style>
   .body{
      background-image: url("imags/error.png");
      background-repeat: no-repeat;
      background-size:cover;
   }
   span{
    position:absolute;
    right:15%;
    left:85%;
    bottom:10px;
    width:60px;
 
   }
 </style>
<body class="body" >
	    <div class="container" >
		   <span style="color:red">
		       <a href="javascript:history.go(-1)" class="button" style="text-decoration:none;vertical-align:middle" >返回上一步</a>
		   </span>
	 </div> 
</body>
</html>