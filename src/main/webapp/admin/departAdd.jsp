<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
    <title>天津师范大学 失物招领平台 - 登陆页面</title>
    <link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
    <link rel="stylesheet/less" type="text/css" href="${contextPath}/css/login.less" charset="utf-8" />
    <link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
    <script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${contextPath}/js/tjnulost_init.js" type="text/javascript" charset="utf-8"></script>
    <script>
        jQuery(document).ready(function($){
       	   $('#subbtn').click(function(){
       	        $.ajax({
       	            type: "post",
       	            url: "./depart/departAdd",
       	            data:{
       	                'depart.name':$('#departname').val(),
       	            },
       	            dataType: "json",
       	            success: function(data) {
       	                if(data == "success"){
       	                    $('.login').html("添加成功<br>三秒后自动刷新");
       	                }else if(data == "exist"){
       	                    $('.login').html("部门名已存在,请重新添加！<br>三秒后自动刷新");
       	                }else{
       	                    $('.login').html("服务器错误,请重新添加！<br>三秒后自动刷新");
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
          <li><a href="${contextPath}/admin/departAdd.jsp">添加新部门</a></li>
          <li><a href="${contextPath}/admin/departManage.jsp">管理已有部门</a></li>
          <li><a href="${contextPath}/admin/adminCenter.jsp">回到后台首页</a></li>
          <li><a href="${contextPath}/admin.html">退出</a></li>

        
      </ul>
      
      
      
      </div>
      <div class="main">
        <div class="info">请输入新部门的信息</div>
        <div class="login">
          <form onkeydown="if(event.keyCode==13){return false;}">
            <label class="input-block">
              <span class="input-tip">部门名称</span>
              <input class="input-text" placeholder="部门名称" type="text" name="depart.name" id="departname" />
            </label>
            <div class="input-block"><button id="subbtn" type="button">添加</button></div>
          </form>
          
          
        </div>
      </div>
      <div class="footer">&copy;过客小站 版权所有</div>
    </div>
  </body>

</html>