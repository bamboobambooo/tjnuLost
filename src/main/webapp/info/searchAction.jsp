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
        <link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
        <script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
        <script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
		<script>
			jQuery(document).ready(function ($) {
				if("${status}"=="-2"){
					$(".main h2").text("认领");
				}
				$.ajax({
					type:"post",
                    url:"./search",
                    data:{
                    	p:${p},
                        size:10,
                        search:"${search}"+"",
                        status:"${status}"+"",
                        timeFrom:"${timeFrom}"+"",
                        timeTo:"${timeTo}"+""
                    },  
					dataType:"json",
					success:function(data){
			            var totalSize = data.total ;//总商品数
		                 var pages = data.pages ;//总页数

		                    
		                    //before  start end  after
		                    var beforeHtml = ""; //页码之前的省略号页码的html
		                    var startBtn = 1; //默认从第一页开始
		                    if(currPage-10>=1){
		                        startBtn = parseInt(currPage/10)*10+1; //十页十页地显示
		                        if(currPage%10==0){
		                            startBtn = parseInt((currPage-1)/10)*10+1;  
		                        }
		                        beforeHtml = "<div class=\"ellipsis\"> <a data-href=\""+currUrlNoPage+ppp+(startBtn-10)+"\">"+"<"+(startBtn-10)+"</a></div>";
		                        beforeHtml += "<div class=\"ellipsis\"> <a data-href=\""+currUrlNoPage+ppp+(startBtn-1)+"\">"+"<"+(startBtn-1)+"</a></div>";
		                    }
		                    var afterHtml = ""; //页码之后的省略号的html
		                    var endBtn = Math.ceil(currPage/10)*10;//从最后一页结束
		                    if(endBtn >=pages){//endBtn不能大于pages
		                        endBtn = pages;
		                    }else{
		                        if(endBtn+10 >= pages){ //如果最后一个链接 + 10 大于总页数，则  链接到下一页 即可    
		                            afterHtml = "<div class=\"ellipsis\"><a data-href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
		                        }else{ //如果最后一个链接+ 10 小于等于总页数，则之后的省略号链接到endBtn+10
		                            afterHtml = "<div class=\"ellipsis\"><a data-href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
		                            afterHtml += "<div class=\"ellipsis\"><a data-href=\""+currUrlNoPage+ppp+(endBtn+10)+"\">"+">>"+(endBtn+10)+"</a></div>";
		                        };          
		                    }


		                    
		                    
		                    var innerHtml = "";
		                    for(var i =startBtn;i<=endBtn;i++){
		                        if(i == currPage){
		                            innerHtml += "<div class=\"singlePager\"><span>"+i+"</span></div>"; 
		                        }else{
		                            innerHtml += "<div class=\"singlePager\"> <a data-href=\""+currUrlNoPage+ppp+i+"\">"+i+"</a></div>";
		                        };
		                    };
		                        $('.main').append("<div class=\"pager\"></div>");//
		                        
		                        $("div.pager").append(beforeHtml);
		                        $("div.pager").append(innerHtml);
		                        $("div.pager").append(afterHtml);
		                    
		                    $("div.singlePager").css({
		                        "float":"left",
		                        "width":"6%",
		                        "padding":"0 auto",
		                        "text-align":"center"
		                    });
		                    $("div.ellipsis").css({
		                        "float":"left",
		                        "width":"7%",
		                        "padding":"0 auto",
		                        "background-color":"#EED7D7",
		                        "text-align":"center"
		                    });
		                    $("div.singlePager:last").nextAll("div.ellipsis:odd").css({
		                        "margin-left":"3px"
		                    });
		                    $("div.singlePager:first").prevAll("div.ellipsis:even").css({
		                        "margin-left":"3px"
		                    });
		                    
		                    $("div.singlePager a,div.singlePager span,div.ellipsis a").css({
		                    });         
		                    
						var html = "<ul>";
						$.each(data.result, function(k,v) {
							html+="<li>";
							if(v.publishAdmin != undefined){
								html += v.publishAdmin.department.name + "";
							}else if(v.publishUser != undefined){
								html += v.publishUser.name + "";
							}
							
							if(v.status+""=="2"){
							html += " 在 "+v.place+" 丢失了 "+'<a href="./showInfo?id='+v.id+'">'+ v.item+"</a></li>";
							}else if(v.status+""=="-2"){
								html += " 在 "+v.place+" 找到了 "+'<a href="./showInfo?id='+v.id+'">'+ v.item+"</a></li>";	
							}
						});
						html+="</ul>";
						$('.main h2').after(html);
						
							$(".pager").find("a").attr("href","javascript:void(0)");
							$(".pager").find("a").each(function(){
								$(this).mousedown(function () {
	                                $("form").attr("action",$(this).attr("data-href"));
	                                <c:if test="${p ge 1}">
	                                $("input[name=p]").val($(this).text());
	                                </c:if>
	                                $("form").submit();
	                            });
								
							});
							
						
						
					}
				});
				
			});
		</script>	
	</head>

	<body>
		<div class="container">
		<%@ include file="/include/header.jsp"%>
		<div class="leftnav">导航区域
				<ul>
					<li><a href="./register.html">用户注册</a></li>
					<li><a href="./login.html">用户登陆</a></li>
					<li><a href="./admin.html">管理员登陆</a></li>

				</ul>



			</div>
			<div class="main">
					<h2>求助</h2>
			</div>
			<div class="footer">&copy;刘各欢 版权所有</div>
		            <form action="${contextPath}/info/searchAction" method="post" style="display:none;">
		            <input type="hidden" name="search" id="ltext" placeholder="搜索的物品" value="${search}" />
		            <input id="timeFrom" name="timeFrom" type="hidden" value="${timeFrom}" onfocus="WdatePicker({doubleCalendar:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="起始时间 可不选" class="Wdate" />
		            <input id="timeTo" name="timeTo" type="hidden" value="${timeTo}" onfocus="WdatePicker({doubleCalendar:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" placeholder="结束时间 可不选" class="Wdate" />
		            <select name="status">
		                <option value="${status}">丢失的</option>
		            </select>
		            <!-- <input type="hidden" name="p" /> -->
		            <button id="sbutton" type="submit">搜索</button>
		            </form>			
		</div>
	</body>

</html>