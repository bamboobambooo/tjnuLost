<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
        <link rel="stylesheet" type="text/css" href="${contextPath}/js/umeditor/themes/default/css/umeditor.min.css"/>
        <script src="${contextPath}/js/umeditor/umeditor.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${contextPath}/js/umeditor/lang/zh-cn/zh-cn.js" type="text/javascript" charset="utf-8"></script>
        <script src="${contextPath}/js/umeditor/umeditor.config.js" type="text/javascript" charset="utf-8"></script>		
	</head>

	<body class="login-page">
		<div class="container">
			<div class="header">
				<div class="headerwrap"> <a href="${contextPath}/index.jsp"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>
			<%@ include file="/include/leftnav.jsp"%>
			<div class="main">
				<div class="info">请输入找到的物品信息</div>
				<div class="login">
					<form action="${contextPath}/info/pubLost" method="post" enctype="multipart/form-data">
						<label class="input-block">
							<span class="input-tip">地点</span>
							<input class="input-text" placeholder="请输入找到的地点" type="text" name="info.place" id="info.place" />
						</label>
                        <label class="input-block">
                            <span class="input-tip">物品</span>
                            <input class="input-text" placeholder="丢了什么东西" type="text" name="info.item" id="info.item" />
                        </label>	
                        <label class="input-block">
                            <span class="input-tip">图片</span>
                            <input class="input-text" placeholder="上传个图片吧" type="file" name="imgFile" id="imgFile" />
                        </label>                        
						<label class="input-block input-detail" id="ume">
							<span class="input-tip">详情</span>
							<!-- <input class="input-text" placeholder="找到了什么东西、样子……" type="text" name="info.detail" id="info.detail"/> -->
							<textarea class="input-text input-detail" placeholder="找到了什么东西、样子……" name="info.detail" id="infodetail"></textarea>
                            <script type="text/javascript">
                                var um = UM.getEditor('infodetail',{initialFrameWidth :"70%"});
                                jQuery(document).ready(function ($) {
                                    $(window).resize(function(){
                                        if(document.body.clientWidth<=639){
                                            $('div.edui-container').css("width","100%");
                                        }else{
                                            $('div.edui-container').css("width","70%");
                                        }
                                    });
                                    
                                    $("#subbtn").mousedown(function () {
                                        $('#infodetail').text(um.getContent());
                                        debugger;
                                    });
                                    
                                });
                            </script>							
						</label>
							<input type="hidden" name="info.status" value="-2">
						<div class="input-block"><input id="subbtn" class="subbtn" type="submit" value="发布"/></div>
					</form>
					
					
				</div>
			</div>
			<div class="footer">&copy;LGH 版权所有</div>
		</div>
	</body>

</html>