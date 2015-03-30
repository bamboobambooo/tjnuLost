<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">导航区域
    <ul>
        <c:choose>  
            <c:when test="${sessionScope.curruser != null }">  
		        <li><a href="${contextPath}/pubFound.jsp">发布找到的</a></li>
		        <li><a href="${contextPath}/pubLost.jsp">发布丢失的</a></li>
            </c:when>  
            <c:otherwise>  
                <li><a href="./register.html">用户注册</a></li>
                <li><a href="./login.html">用户登陆</a></li>
		         <c:choose>  
		            <c:when test="${sessionScope.curradmin != null }">   
		              
		            </c:when>  
		            <c:otherwise>  
		            </c:otherwise>  
		        </c:choose>  
            </c:otherwise>  
        </c:choose>  
        <li><a href="${contextPath}/admin.html">管理员登陆</a></li>
    </ul>
</div>