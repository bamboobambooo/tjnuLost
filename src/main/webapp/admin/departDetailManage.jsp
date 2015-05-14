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
<script src="${contextPath}/js/tjnulost_init.jsp" type="text/javascript" charset="utf-8"></script>
<script>
var deptId = 0;
if(currUrlNoPage.indexOf("deptId")>0){  
	deptId = currUrlNoPage.substring(currUrlNoPage.indexOf("deptId")+7, currUrlNoPage.length);  
}
jQuery(document).ready(function($) {
	//获取该部门的管理员列表
	$.ajax({
		type: "post",
		url: "./getAdminJSON",
		data:{
			p:currPage,
			deptId:deptId,
			size:10
		},
		dataType: "json",
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
	                    $('#editAdmin').append("<div class=\"pager\"></div>");//
	                    
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
			
			$('#currDepart').text(data.result[0].department.name);
            var html = "";
            for (var c in data.result) {
                html += "<tr>"
                html += "<td>" + data.result[c].name + "</td><td>" + data.result[c].realname + "</td>" + "<td>" + data.result[c].mobile + "</td>";
                html += "<td>" + data.result[c].email + "</td>";
                html += "<td>" + "<span data-uid=\""+data.result[c].id+"\">删除</span>" + "</td>";
                html += "</tr>";
            }
            html = html.replace(/undefined/g,"");
            $('#editAdmin>table tbody').append(html);
            
            //删除按钮
            $('#editAdmin td span').click(function () {
            	var r=confirm("确定删除？");
				if (r==true){
				  $.ajax({
				    type: "post",
			        url: "./delAdmin",
			        data:{
			           'uid':$(this).attr("data-uid")
			        },
			        dataType: "json",
			        success: function(data) {
			        	 if(data == "success"){
			        		 alert("删除成功");
			        		 window.location.reload();
			        	 }else{
			        		 alert("删除失败，请重试");
			        	 }
			        	 
			        }				  	
				  });
				}
				else{
				  
				}
            	console.log();
            });
            
            //部门名称修改
            $('#departNameChangeLink').click(function(){
            	$('#editAdmin').addClass("hide");
            	$('#departAdminAdd').removeClass('show').addClass('hide');
            	$('#departNameChange').removeClass("hide").addClass("show");
            	$('#departNameChange #deptname').val(data.result[0].department.name);
            	$('#departNameChange #subbtn2').click(function(){
	            	$.ajax({
	                    type: "post",
	                    url: "./depart/departNameChange",
	                    data:{
	                    	'depart.id':deptId,
	                    	'depart.name':$('#departNameChange #deptname').val()+""
	                    },
	                    dataType: "json",
	                    success:function(data){
	                        if(data == "success"){
	                            $('#departNameChange').html("修改成功<br>三秒后自动刷新");
	                        }else{
	                            $('#departNameChange').html("修改失败,请重新添加！<br>三秒后自动刷新");
	                        }
                            setTimeout(function(){
                                window.location.reload();
                            },3000);
	                    }
	            	});
            	});
                if( c = $(".subbtn")){
                	c.each(function(){
                        $(this).css({
                            "position":"relative",
                            "left":($(this).parent().outerWidth()-$(this).outerWidth())/2.0 + "px" 
                        });	
                	});

                }
            });
            
            
		}
	});
	$('#departAdminAddLink').click(function(){
		$('#editAdmin').hide(600);
		$('#departNameChange').removeClass('show').addClass('hide')
		$('#departAdminAdd').removeClass('hide').addClass('show');
		//对按钮的剧中 再次定位 与init.js有重复
        if( c = $(".subbtn")){
            c.css({
                "position":"relative",
                "left":(c.parent().outerWidth()-c.outerWidth())/2.0 + "px" 
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
	            'admin.password':$('#password').val(),
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
#editAdmin td{
text-align: center;
}
#editAdmin td span{
text-decoration: underline;
color:blue;
font-size: 80%;
text-align: center;
cursor:pointer;
}
</style>
</head>

<body>
<div class="container">
	<div class="header">
		<div class="headerwrap">
			<a href="${contextPath}/index.jsp"> <img class="logo"
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
		    <li><a href="javascript:void(0)" id="departNameChangeLink">修改该部门名称</a></li>
			<li><a href="javascript:void(0)" id="departAdminAddLink">添加该部门发布员</a></li>
			<li><a href="${contextPath}/admin/adminCenter.jsp">回到后台首页</a></li>
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
						<th>用户名</th>
						<th>真实姓名</th>
						<th>手机</th>
						<th>邮箱</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>

		</div>
        <div class="login hide" id="departAdminAdd">
                    <form onkeydown="if(event.keyCode==13){return false;}">
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
                        <div class="input-block"><button id="subbtn" class="subbtn" type="button">添加</button></div>
                    </form>
                    
                    
        </div>
        
        <div class="login hide" id="departNameChange">
                    <form onkeydown="if(event.keyCode==13){return false;}">
                        <label class="input-block">
                            <span class="input-tip">部门名称</span>
                            <input class="input-text" placeholder="部门名称" type="text" id="deptname" />
                        </label>
                       
                        <div class="input-block"><button id="subbtn2" class="subbtn" type="button">修改</button></div>
                    </form>
                    
                    
        </div>        
	</div>
	<div class="footer">&copy;LGH 版权所有</div>
</div>
</body>

</html>