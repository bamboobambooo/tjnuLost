<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">导航区域
    <ul>
        <c:choose>  
            <c:when test="${sessionScope.curruser != null }">  
		        <li><a href="${contextPath}/pubFound.jsp">发布找到的</a></li>
		        <li><a href="${contextPath}/pubLost.jsp">发布丢失的</a></li>
                <li><a href="${contextPath}/user/personalInfo">修改个人信息</a></li>
                <li><a href="${contextPath}/user/userCenter.jsp">回到个人中心</a></li>
                <li><a href="${contextPath}/user/logout">退出</a></li>		        
            </c:when>  
            <c:otherwise>  
                <li><a href="${contextPath}/register.html">用户注册</a></li>
                <li><a href="${contextPath}/login.html">用户登陆</a></li>
		         <c:choose>  
		            <c:when test="${sessionScope.curradmin != null }">
		              <li><a href="${contextPath}/admin/adminCenter.jsp">管理员中心</a></li>
		              <li><a href="${contextPath}/user/logout">退出</a></li>
		            </c:when>  
		            <c:otherwise>  
				        <li><a href="${contextPath}/admin.html">管理员登陆</a></li>
		            </c:otherwise>  
		        </c:choose>  
            </c:otherwise>  
        </c:choose>  
    </ul>
</div>