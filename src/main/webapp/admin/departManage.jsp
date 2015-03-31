<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
<title>部门管理 - 天津师范大学 失物招领平台</title>
<link rel="stylesheet/less" type="text/css" href="${contextPath}/css/index.less" charset="utf-8" />
<link rel="stylesheet" href="${contextPath}/otherres/font-awesome-4.3.0/css/font-awesome.min.css">
<script src="${contextPath}/js/jquery-1.10.2.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/js/less.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
<script>
<%-- 	var currUrl = window.location.href;
	var currUrlNoPage = currUrl.replace(/[&,\?]p=(\d)*/g,"");
	var currIdIndex = currUrl.indexOf("id");//获取Url中id的索引
	var currId = "";
	var currPage = 1;//当前页
	if(currUrl.indexOf("p=")>0){
	    currPage = currUrl.substring(currUrl.indexOf("p=")+2, currUrl.length);//默认了p=在最后
	}
	var size = 3;
jQuery(document).ready(function($) {
	 **
	 *下方分页按钮实现
	 **

	 
	 var afterHtml = "";
	 afterHtml += "<a class=\"nextpage\" href=\""+currUrlNoPage;
	 if(currUrlNoPage.indexOf("?")>=0){
	 	afterHtml += "&p="+(+currPage+1);
	 }else{
	 	afterHtml += "?p="+(+currPage+1);
	 }
	 afterHtml += "\">下一页</a>";
	 
	 var beforeHtml = "";
	 if(currPage > 1){ //上一页
		 beforeHtml += "<a class=\"prevpage\" href=\""+currUrlNoPage;
		 if(currUrlNoPage.indexOf("?")>=0){
		 	beforeHtml += "&p="+(currPage-1);
		 }else{
		 	beforeHtml += "?p="+(currPage-1);
		 }
		 beforeHtml += "\">上一页</a>";
	 }
	 
	 
	 $(".pager").html(beforeHtml + afterHtml);
}); */--%>
</script>
<script>

jQuery(document).ready(function($) {
	
	//获取部门列表
	$.ajax({
		type: "post",
		url: "./depart/getDepartJSON",
		dataType: "json",
		data:{p:currPage,size:10},
		success: function(data) {
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
	                beforeHtml = "<div class=\"ellipsis\"> <a href=\""+currUrlNoPage+ppp+(startBtn-10)+"\">"+"<"+(startBtn-10)+"</a></div>";
	                beforeHtml += "<div class=\"ellipsis\"> <a href=\""+currUrlNoPage+ppp+(startBtn-1)+"\">"+"<"+(startBtn-1)+"</a></div>";
	            }
	            var afterHtml = ""; //页码之后的省略号的html
	            var endBtn = Math.ceil(currPage/10)*10;//从最后一页结束
	            if(endBtn >=pages){//endBtn不能大于pages
	                endBtn = pages;
	            }else{
	                if(endBtn+10 >= pages){ //如果最后一个链接 + 10 大于总页数，则  链接到下一页 即可    
	                    afterHtml = "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
	                }else{ //如果最后一个链接+ 10 小于等于总页数，则之后的省略号链接到endBtn+10
	                    afterHtml = "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+1)+"\">"+">"+(endBtn+1)+"</a></div>";
	                    afterHtml += "<div class=\"ellipsis\"><a href=\""+currUrlNoPage+ppp+(endBtn+10)+"\">"+">>"+(endBtn+10)+"</a></div>";
	                };          
	            }


	            
	            
	            var innerHtml = "";
	            for(var i =startBtn;i<=endBtn;i++){
	                if(i == currPage){
	                    innerHtml += "<div class=\"singlePager\"><span>"+i+"</span></div>"; 
	                }else{
	                    innerHtml += "<div class=\"singlePager\"> <a href=\""+currUrlNoPage+ppp+i+"\">"+i+"</a></div>";
	                };
	            };
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
			
			
			
			var html = "";
			$.each(data.result, function(k, v) {
				html += "<tr>"
				html += "<td>" + v.id + "</td><td>" + v.name + "</td>" + "<td>" + '<a href="./departDetailManage.jsp?deptId='+v.id +'" target="_blank">'+"编辑" +'</a>'+ "</td>";
				html += "</tr>";
			});
			$('.main .showDepart table tbody').append(html);
			if($('.main .showDepart table tbody tr').length < size){
				$(".prevpage").hide();
			}
            if($('.main .showDepart table tbody tr').length <= 0){
                $(".pager").html('没有了 <a href="javascript:history.go(-1)">后退</a>');
            }
		}
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
			<li><a href="${contextPath}/admin/departAdd.jsp">添加新部门</a></li>
			<li><a href="${contextPath}/admin/departManage.jsp">管理已有部门</a></li>
			<li><a href="${contextPath}/admin/adminCenter.jsp">回到后台首页</a></li>
			<li><a href="${contextPath}/admin.html">退出</a></li>

		</ul>



	</div>
	<div class="main">
	   <div class="showDepart">
			<table>
				<thead>
					<tr>
						<th>部门编号</th>
						<th>部门名称</th>
						<th>编辑</th>
					</tr>
				</thead>
				<tbody>
	
				</tbody>
			</table>
		</div>
        <div class="pager"></div>
	</div>
	<div class="footer">&copy;过客小站 版权所有</div>
</div>
</body>

</html>