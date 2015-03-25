<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<title>部门管理员管理 - 天津师范大学 失物招领平台</title>
<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/login.less" charset="utf-8" />
<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/js/tjnulost_init.js" type="text/javascript" charset="utf-8"></script>
<script>
var currUrl = window.location.href; 
var currPage = 1;
if(currUrl.indexOf("p=")>0){  
    currPage = currUrl.substring(currUrl.indexOf("p=")+2, currUrl.length);  
}
var deptId = 0;
if(currUrl.indexOf("deptId")>0){  
	deptId = currUrl.substring(currUrl.indexOf("deptId")+7, currUrl.length);  
}
jQuery(document).ready(function($) {
	//获取该部门的管理员列表
	$.ajax({
		type: "post",
		url: "./getAdminJSON",
		data:{
			p:currPage,
			deptId:deptId
		},
		dataType: "json",
		success: function(data) {
			$('#currDepart').text(data[0].department.name);
            var html = "";
            for (var c in data) {
                html += "<tr>"
                html += "<td>" + data[c].name + "</td><td>" + data[c].realname + "</td>" + "<td>" + data[c].mobile + "</td>";
                html += "<td>" + data[c].email + "</td>";
                html += "</tr>";
            }
            html = html.replace(/undefined/g,"");
            $('#editAdmin>table tbody').append(html);
            
		}
	});
	$('#departAdminAddLink').click(function(){
		$('#editAdmin').hide(600);
		$('#departAdminAdd').removeClass('hide').addClass('show');
		//对按钮的剧中 再次定位 与init.js有重复
        if( c = document.getElementById("subbtn")){
            $(c).css({
                "position":"relative",
                "left":($(c).parent().outerWidth()-$(c).outerWidth())/2.0 + "px" 
            });
        }
	});
	
	$('#subbtn').click(function(){
 	    $.ajax({
	        type: "post",
	        url: "./departAdminAdd",
	        data:{
	            'admin.name':$('#name').val(),
	            'admin.realname':$('#realname').val(),
	            'admin.password':$('#name').val(),
	            'admin.mobile':$('#mobile').val(),
	            'admin.email':$('#email').val(),
	            'admin.department.id':deptId
	        },
	        dataType: "json",
	        success: function(data) {
	        	if(data == "success"){
	        		$('#departAdminAdd').html("添加成功<br>三秒后自动刷新");
	        	}else if(data == "existAdmin"){
	        		$('#departAdminAdd').html("用户名已存在,请重新添加！<br>三秒后自动刷新");
	        	}else{
	        		$('#departAdminAdd').html("服务器错误,请重新添加！<br>三秒后自动刷新");
	        	}
                    setTimeout(function(){
                        window.location.reload();
                    },3000);
	            
	        }
	    });
	});
});
</script>
<style>
.hide {
	display: none;
}

.show {
	display: block;
}

#editAdmin {
	border: 1px solid black;
}
#editAdmin h2{
font-size:16px;
}
</style>
</head>

<body>
<div class="container">
	<div class="header">
		<div class="headerwrap">
			<a href="${contextPath}/index.html"> <img class="logo"
				src="${contextPath}/img/logo.gif">
			</a>
			<div class="title">
				<p>失物招领平台</p>
			</div>
			<div class="navbtn">
				<i id="navbtn" class="fa fa-list fa-3x"></i>
			</div>
		</div>
	</div>
	<div class="leftnav">
		导航区域
		<ul>
		    <li><a href="${contextPath}/admin/departNameChange.jsp">修改该部门名称</a></li>
			<li><a href="javascript:void(0)" id="departAdminAddLink">添加该部门发布员</a></li>
			<li><a href="${contextPath}/admin.html">退出</a></li>

		</ul>



	</div>
	<div class="main">
		<div id="editAdmin">
			<h2>
				<span id="currDepart"></span>部门 发布员列表
			</h2>
			<table>
				<thead>
					<tr>
						<th>姓名</th>
						<th>真实姓名</th>
						<th>手机</th>
						<th>邮箱</th>
						<th>编辑</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>

		</div>
        <div class="login hide" id="departAdminAdd">
                    <form action="./user/reg" method="post">
                        <label class="input-block">
                            <span class="input-tip">用户名</span>
                            <input class="input-text" placeholder="用户名" type="text" id="name" />
                        </label>
                        <label class="input-block">
                            <span class="input-tip">密码</span>
                            <input class="input-text" placeholder="密码" type="password" id="password"/>
                        </label>
                        <label class="input-block">
                            <span class="input-tip">真实姓名</span>
                            <input class="input-text" placeholder="真实姓名" type="text" id="realname"/>
                        </label>    
                        <label class="input-block">
                            <span class="input-tip">手机</span>
                            <input class="input-text" placeholder="手机号码" type="text" id="mobile"/>
                        </label>                                            
                        <label class="input-block">
                            <span class="input-tip">电子信箱</span>
                            <input class="input-text" placeholder="电子信箱" type="text" id="email"/>
                        </label>                            
                        <div class="input-block"><button id="subbtn" type="button">添加</button></div>
                    </form>
                    
                    
        </div>
	</div>
	<div class="footer">&copy;过客小站 版权所有</div>
</div>
</body>

</html>