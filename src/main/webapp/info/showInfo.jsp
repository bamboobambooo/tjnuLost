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

	<body class="login-page">
		<div class="container">
			<div class="header">
				<div class="headerwrap"> 
				<a href="${contextPath}/index.jsp"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>

			<%@ include file="/include/leftnav.jsp"%>
			<div class="main">
			<h2>
			<c:if test="${info.publishAdmin != null }">${info.publishAdmin.department.name}</c:if>
			<c:if test="${info.publishUser != null }">${info.publishUser.name}</c:if>
			在 ${info.place}&nbsp;<c:if test="${info.status == 2 }">丢失了&nbsp;</c:if>
            <c:if test="${info.status == -2 }">找到了&nbsp;</c:if> ${info.item}</h2>
			当前状态：
			<select name="infoStatus" id="infoStatus"
			
                <c:if test="${sessionScope.curradmin.id != null}">
	                    <c:if test="${info.publishAdmin.id != sessionScope.curradmin.id}">
	                    disabled="disabled"
	                    </c:if>
                </c:if>
                <c:if test="${sessionScope.curruser.id != null}">
                        <c:if test="${  info.publishUser.id != sessionScope.curruser.id}">
                            disabled="disabled"
                        </c:if>
                </c:if>
                <c:if test="${sessionScope.curradmin.id == null and sessionScope.curruser.id == null}">
                            disabled="disabled"
                </c:if>                
			>
				<option value="2" id="oplost" >丢失中</option>
				<option value="-2" id="opfound">待物主领走</option>
				<option value="0" id="opclose">已归还/已找到</option>
			</select><br />
			<div id="showImg">图片：
			 <c:if test='${info.imgurl !="" }'>
			     <img src="${contextPath}/../infoimg/${info.imgurl}" alt="" style="width:100px;height:100px" />
			 </c:if>
			</div>
			详情如下：<br/>
			${info.detail }
			</div>
			<div class="footer">&copy;刘各欢 版权所有</div>

		</div>
	</body>

</html>