<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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
		<script src="${contextPath}/js/tjnulost_init.js" type="text/javascript" charset="utf-8"></script>

<script>
			jQuery(document).ready(function ($) {
				$.ajax({
					type:"post",
					url:"./depart/getDepartJSON",
					dataType:"json",
					success:function(data){
						var html = "";
						$.each(data, function(k,v) {  
							html+="<tr>"
							html+="<td>"+v.id+"</td><td>"+v.name+"</td>"+"<td>"+"编辑"+"</td>";
							html+="</tr>";
						});
						$('.main>table tbody').append(html);
		        $('.main>table tbody tr').each(function(){
		        	
		        	$(this).find('td:eq(2)').click(function(){
		        		$('#editAdmin>table tbody').empty();
		        		var t = $(this);
		        		$('#editAdmin').removeClass().addClass("show");
		        		console.log(t.siblings().eq(1).text());
		        		$('#editAdmin #currDepart').text(t.siblings().eq(1).text());
		        		
		        		$.ajax({
		        			type:"post",
		        	    url:"./getAdminJSON",
		        	    data:{deptId:t.siblings().eq(0).text()+""},
		        	    dataType:"json",
		        	    success:function(data){
		                   var html = "";
/* 		                    $.each(data, function(k,v) {  

		                    }); */
		                    
		                    for(var c in data){
		                    	
                         html+="<tr>"
                         html+="<td>"+data[c].name+"</td><td>"+data[c].realname+"</td>"+"<td>"+data[c].mobile+"</td>";
                         html+="<td>"+data[c].email+"</td>";
                         html+="</tr>";
		                    }
		                    html = html.replace(/undefined/g, "");
		                    
		                    $('#editAdmin>table tbody').append(html);	        	    	
		        	    }
		        		});
		        		
		        		
		          });
		        }) 
					}
				});
				

				
			});
		</script>
		<style>
		  .hide{
        display:none;
      }
		  .show{
		    display:block;
		  }
		  #editAdmin{
		    border:1px solid black;
		  }

		</style>
	</head>

	<body>
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
          <li><a href="${contextPath}/admin.html">退出</a></li>

				</ul>



			</div>
			<div class="main">
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
        <div id="editAdmin" class="hide">
          <h2><span id="currDepart"></span>部门管理员列表</h2>
        <table>
          <thead>
            <tr>
              <th>姓名</th>
              <th>真实姓名</th>
              <th>手机</th>
              <th>邮箱</th>
            </tr>
          </thead>
          <tbody>

          </tbody>
        </table>

        </div>
			</div>
			<div class="footer">&copy;过客小站 版权所有</div>
		</div>
	</body>

</html>