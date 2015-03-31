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
	</head>

	<body class="login-page">
		<div class="container">
			<div class="header">
				<div class="headerwrap"> <a href="${contextPath}/index.html"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>

			<%@ include file="/include/leftnav.jsp"%>
			<div class="main">
			<h2>
			<c:if test="${info.publishAdmin != null }">${info.publishAdmin.department.name}</c:if>
			<c:if test="${info.publishUser != null }">${info.publishUser.name}</c:if>
			在 ${info.place} 发现了 ${info.item}</h2>
			详情如下：<br/>
			${info.detail }
			<%-- <s:property value="info.detail"></s:property> --%>
			</div>
			<div class="footer">&copy;过客小站 版权所有</div>
		</div>
	</body>

</html>