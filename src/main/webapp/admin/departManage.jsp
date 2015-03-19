<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
		<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/tjnulost_init.js" type="text/javascript" charset="utf-8"></script>
		<script>
			jQuery(document).ready(function ($) {
				$.ajax({
					type:"post",
					url:"./depart/getDepartJSON",
					dataType:"json",
					success:function(data){
						var html = "<ul>";
						$.each(data, function(k,v) {  
							html+="<li>"+k+"=="+v.name+"</li>";
						});
						html+="</ul>";
						$('.main').append(html);
					}
				});
				
			});
		</script>
	</head>

	<body>
		<div class="container">
			<div class="header">
				<div class="headerwrap"> <a href="${contextPath}/index.html"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>
			<div class="leftnav">导航区域
				<ul>
					<li><a href="${contextPath}/admin/departManage.jsp">管理部门</a></li>
					<li><a href="${contextPath}/admin.html">退出</a></li>

				</ul>



			</div>
			<div class="main">
<!-- 			<table>
				<tr>
					<td></td>
				</tr>
			</table> -->
		</div>
			<div class="footer">&copy;过客小站 版权所有</div>
		</div>
	</body>

</html>