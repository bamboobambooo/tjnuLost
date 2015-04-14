 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="${contextPath}/js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script>
 jQuery(document).ready(function($){
 	var cc = $(".lsearch").prop("outerHTML");
 	$(".lsearch").remove();
 	$(cc).appendTo(".leftnav");
 	$(".lsearch").width($("html").width()*0.8);
 	$(".lsearch").css({
 		"position":"absolute",
 		"left":($("html").width()-$(".lsearch").width())/2.0+"px",
 		"top":($("html").height()-$(".lsearch").height())/2.0+"px"
 	});
 	$("<li><a href=\"javascript:void(0)\" id=\"sstip\">搜索物品</a></li>").prependTo(".leftnav ul");
 	$("#sstip").click(function () {
 		$(".lsearch").fadeIn(400);
 	});
 	$(".lsearch i").click(function () {
 		$(".lsearch").fadeOut(400);
 	});
	 
 });
</script>
<style type="text/css">
	.lsearch{
		background-color: #013162;
		border: 1px solid black;
		border-radius: 4px;
		width: 100%;
		height: 100px;
		clear: both;
		display: none;
	}
	.lsearch input,.lsearch select{
		display: inline-block;
		width: 20%;
		float: left;
		margin-top:29px;
		border: 1px solid #ccc;
		border-radius: 4px;
		height: 36px;
		font-size: 25px;
		font-family: "微软雅黑", arial, helvetica, sans-serif;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	}
	.lsearch select{
		height: 40px;
	}
	.lsearch i{
		float: right;
	}
	.lsearch i:hover{
        color:white;
        cursor:pointer;
    }
	.lsearch #ltext{
		margin-left: 10px;
	}
	.lsearch #ldateFrom,.lsearch #ldateTo,.lsearch select{
	    margin-left:5px;
		width: 20%;
	}
	.lsearch button{
		margin-left:5px;
		margin-top:29px;
		width: 66px;
		height: 40px;
		border-radius: 4px;
		font-size: 25px;
		font-family: "微软雅黑", arial, helvetica, sans-serif;
		display: inline-block;		
	}
</style>
 <div class="header">
     <div class="headerwrap">
         <a href="${contextPath}/index.jsp"> <img class="logo" src="${contextPath}/img/logo.gif">
         </a>
         <div class="title">
             <p>失物招领平台</p>
         </div>
         <div class="navbtn">
             <i id="navbtn" class="fa fa-list fa-3x"></i>
         </div>
         <div class="lsearch">
            <i class="fa fa-times"></i>
            <form action="${contextPath}/info/searchAction" method="post">
         	<input type="text"  name="search" id="ltext" placeholder="搜索的物品" />
            <input id="timeFrom" name="timeFrom" type="text" onfocus="WdatePicker({doubleCalendar:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="起始时间 可不选" class="Wdate" />
            <input id="timeTo" name="timeTo" type="text" onfocus="WdatePicker({doubleCalendar:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="结束时间 可不选" class="Wdate" />
            <select name="status">
            	<option value="2">丢失的</option>
            	<option value="-2">找到的</option>
            </select>
            <input type="hidden" name="p" value="1">
            <button id="sbutton" type="submit">搜索</button>
            </form>
         </div>
     </div>
 </div>