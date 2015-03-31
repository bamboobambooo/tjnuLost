<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/login.less" charset="utf-8" />
		<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			jQuery(document).ready(function ($) {
				
				if(${info.status} == 2 ){
					$('#oplost').attr("selected","selected");
				}else if(${info.status} == -2){
					$('#opfound').attr("selected","selected");
				}else if(${info.status} == 0){
					$('#opclose').attr("selected","selected");
				}
				
				$('#infoStatus').change(function () {
					$.ajax({
					type: "post",
					url: "${contextPath}/info/changeInfoStatus",
					data:{
						id:${info.id},
						status:$('#infoStatus').val()+"",
					},
					dataType: "json",
					success: function(data) {
						if(data == "success"){
							alert("状态改变成功");
							window.location.reload(); 
							
						}else{
							alert("状态改变失败");
						}
					}
				    });
				});
			});
		</script>
	</head>

	<body>
		<div class="container">
			<%@ include file="/include/header.jsp" %>
			<%@ include file="/include/leftnav.jsp"%>
			<div class="main">
			<h2>
			 ${info.place}
           </h2>
            <c:if test="${info.publishAdmin != null }">${info.publishAdmin.department.name} 部门</c:if>
            <c:if test="${info.publishUser != null }">${info.publishUser.name} 用户</c:if>
                        发布<br/>
            
            <c:if test="${info.pubTime != null }"> 创建于${info.pubTime}</c:if>
            <c:if test="${info.updateTime != null }"> 更新于${info.updateTime}</c:if><br/>
			文章如下：<br/>
			${info.detail }
			</div>
			<div class="footer">&copy;myj 版权所有</div>

		</div>
	</body>

</html>