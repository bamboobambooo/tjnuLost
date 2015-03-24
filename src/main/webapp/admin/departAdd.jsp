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
  </head>

  <body class="login-page">
    <div class="container">
      <div class="header">
      </div>
      <div class="leftnav">导航区域
      <ul>
          <li><a href="${contextPath}/admin/departAdd.jsp">添加新部门</a></li>
          <li><a href="${contextPath}/admin/departManage.jsp">管理已有部门</a></li>
          <li><a href="${contextPath}/admin.html">退出</a></li>

        
      </ul>
      
      
      
      </div>
      <div class="main">
        <div class="info">请输入登录信息</div>
        <div class="login">
          <form action="./depart/departAdd" method="post">
            <label class="input-block">
              <span class="input-tip">部门名称</span>
              <input class="input-text" placeholder="用户名" type="text" name="depart.name" id="depart.name" />
            </label>
            <div class="input-block"><input id="subbtn" type="submit" value="添加"/></div>
          </form>
          
          
        </div>
      </div>
      <div class="footer">&copy;过客小站 版权所有</div>
    </div>
  </body>

</html>