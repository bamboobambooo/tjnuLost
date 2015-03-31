<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="leftnav">导航区域
    <ul>
        <c:choose>  
            <c:when test="${sessionScope.curruser != null }">  
		        <li><a href="${contextPath}/pubLost.jsp">发布交流信息</a></li>
                <li><a href="${contextPath}/admin.html">管理员登陆</a></li>
            </c:when>  
            <c:otherwise>  
                <li><a href="./register.html">用户注册</a></li>
                <li><a href="./login.html">用户登陆</a></li>
		         <c:choose>  
		            <c:when test="${sessionScope.curradmin != null }">   
			            <c:if test="${sessionScope.curradmin.department.id == 1 }">
	                    <li><a href="${contextPath}/admin/departAdd.jsp">添加新部门</a></li>
	                    <li><a href="${contextPath}/admin/departManage.jsp">管理已有部门</a></li>
	                    </c:if>
                    
	                    <c:if test="${sessionScope.curradmin.department.id > 1 }">
	                    <li><a href="${contextPath}/pubFound.jsp">发布公告信息</a></li>
	                    </c:if>             
                        <li><a href="${contextPath}/admin.html">退出</a></li>
                    
		            </c:when>  
		            <c:otherwise> 
		            <li><a href="${contextPath}/admin.html">管理员登陆</a></li> 
		            </c:otherwise>  
		        </c:choose>  
            </c:otherwise>  
        </c:choose>  
    </ul>
</div>