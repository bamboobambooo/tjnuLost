<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="css/index.less" charset="utf-8" />
		<link rel="stylesheet" href="otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<!-- <script src="template/build/template.js" type="text/javascript" charset="utf-8"></script> -->
		<script src="js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			jQuery(document).ready(function ($) {
				setTimeout(function(){
					history.go(-1);
				},3000);
				
			});
		</script>
	</head>

	<body>
		<div class="container">
			<%@ include file="/include/header.jsp"%>
			<%@ include file="/include/leftnav.jsp"%>
			<div class="main">
				登陆失败，检查输入后重试
				三秒后自动返回
			</div>
			<div class="footer">&copy;LGH 版权所有</div>
		</div>
	</body>

</html>