<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
		<title>个人信息修改 - 天津师范大学 失物招领平台</title>
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
		<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/login.less" charset="utf-8" />
		<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
		<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
		<script>
			jQuery(document).ready(function ($) {

				
				$('#subbtn').click(function () {
					//遍历input 获取user
					var user = {};
					$('input').each(function(){
						var k = $(this).attr("name")+"";
						var v = $(this).val();
						user[k] = v;
					});
	            	$.ajax({
	                    type: "post",
	                    url: "./personalInfoUpdate",
	                    data:user,
	                    dataType: "json",
	                    success:function(data){
	                    	$('div.info').hide();
	                        if(data == "success"){
	                            $('div.login').html("修改成功<br>三秒后自动刷新");
	                        }else{
	                            $('div.login').html("修改失败,请重新添加！<br>三秒后自动刷新");
	                        }
                            setTimeout(function(){
                                window.location.reload();
                            },3000);
	                    }
	            	});					
				});
			});
		</script>
	</head>

	<body class="login-page">
		<div class="container">
			<div class="header">
				<div class="headerwrap"> <a href="${contextPath}/index.html"> <img class="logo" src="${contextPath}/img/logo.gif"> </a> 
					<div class="title"> <p>失物招领平台</p> </div> 
					<div class="navbtn"> <i id="navbtn" class="fa fa-list fa-3x"></i> </div> 
				</div>
			</div>
			<div class="leftnav">导航区域
				<ul>
					<li><a href="${contextPath}/user/personalInfo">修改个人信息</a></li>
					<li><a href="${contextPath}/user/userCenter.jsp">回到个人中心</a></li>
					<li><a href="${contextPath}/user/logout">退出</a></li>
					<li><a href="${contextPath}/admin.html">管理员登陆</a></li>

				</ul>



			</div>
			<div class="main">
				<div class="info">请输入新的信息</div>
				<div class="login">
					<form onkeydown="if(event.keyCode==13){return false;}">
						<input type="hidden" name="user.id" value="${user.id}" />
						<label class="input-block">
							<span class="input-tip">用户名</span>
							<input class="input-text" placeholder="用户名" type="text" value="${user.name}" name="user.name" id="user.name" />
						</label>
						<label class="input-block">
							<span class="input-tip">密码</span>
							<input class="input-text" placeholder="密码" type="password" value="${user.password}" name="user.password" id="user.password"/>
						</label>
						<label class="input-block">
							<span class="input-tip">真实姓名</span>
							<input class="input-text" placeholder="真实姓名" type="text" value="${user.realname}" name="user.realname" id="user.realname"/>
						</label>	
						<label class="input-block">
							<span class="input-tip">手机</span>
							<input class="input-text" placeholder="手机号码" type="text" value="${user.mobile}" name="user.mobile" id="user.mobile"/>
						</label>											
						<label class="input-block">
							<span class="input-tip">电子信箱</span>
							<input class="input-text" placeholder="电子信箱" type="text" value="${user.email}" name="user.email" id="user.email"/>
						</label>							
						<div class="input-block"><button id="subbtn" class="subbtn" type="button">修改</button></div>
					</form>
					
					
				</div>
			</div>
			<div class="footer">&copy;过客小站 版权所有</div>
		</div>
	</body>

</html>