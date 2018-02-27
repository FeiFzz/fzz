<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.ytime.util.CommonValues"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
	String def = CommonValues.DEFAULT_PASSWORD;
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Spark Yang">
<title>用户管理</title>
<link id="bs-css" href="../../css/bootstrap-cerulean.css" rel="stylesheet">
<style type="text/css">
  body {
	padding-bottom: 5px;
  }
  .sidebar-nav {
	padding: 9px 0;
  }
</style>
<link href="../../css/bootstrap-responsive.css" rel="stylesheet">
<link href="../../css/charisma-app.css" rel="stylesheet">

<!-- 外部js -->
<!-- jQuery -->
<script src="../../js/jquery-1.7.2.min.js"></script>
<!-- custom dropdown library -->
<script src="../../js/bootstrap-dropdown.js"></script>
<!-- application script for Charisma demo -->
<script src="../../js/charisma.js"></script>
<script type="text/javascript" language="javascript">
	$(window).load(function (){
		var power = ${vo.power};
		var uflag = ${vo.uflag};
		$("#power").val(power);
		$("#uflag").val(uflag);
	});
	
	function resetPassword(userid){
		if(confirm("即将重设用户密码,是否继续?")){
			$.ajax({
				url:"../../handle/user/resetPassword.action",
				type:"post",
				async:false,
				data:{
					userid:userid
				},
				error: function(XMLHttpRequest, textStatus, errorThrown){
					$("#info").show();
					$("#info").removeClass("alert-success");
					$("#info").addClass("alert-error");
					$("#info").html("<h4 class=\"alert-heading\">密码重设失败</h4>");
					$("#info").fadeOut(10000);
				},
				success: function(msg){
					if(msg == true || msg == "true"){
						$("#info").show();
						$("#info").removeClass("alert-error");
						$("#info").addClass("alert-success");
						$("#info").html("<h4 class=\"alert-heading\">用户密码已重设为:<%=def%></h4>");
						$("#info").fadeOut(10000);
					}else{
						$("#info").show();
						$("#info").removeClass("alert-success");
						$("#info").addClass("alert-error");
						$("#info").html("<h4 class=\"alert-heading\">密码重设失败</h4>");
						$("#info").fadeOut(10000);
					}
				},
				dataType:"text"
			});
		}
	}
</script>
<!-- The fav icon -->
<link rel="shortcut icon" href="../../images/favicon.ico">

</head>

<body>
<noscript>
    <div class="alert alert-block span10">
        <h4 class="alert-heading">警告</h4>
        <p>您需要将浏览器的JavaScript设置为启用状态</p>
    </div>
</noscript>
<!-- 上部header区域 -->
<jsp:include page="/handle/system/header.jsp"></jsp:include>

<!-- 核心部分 -->
<div class="container-fluid">
    <div class="row-fluid">
    	<!-- 左侧导航栏 -->
    	<jsp:include page="/handle/system/navi.jsp"></jsp:include>

    	<!-- 右侧内容部分 -->
        <div id="content" class="span10">
            <!-- 导航树banner部分 -->
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="../../handle/system/main.jsp">首页</a>
                        <span class="divider">/</span>
                    </li>
                    <li>用户管理</li>
                </ul>
            </div>
            <div class="row-fluid" style="font-size:14px;">
               <form action="../../handle/user/getUserList.action" method="post" name="searchForm">
               		<input type="hidden" id="pnum" name="pnum" value="${pnum}"/>
	            	<table>
	                	<tr>
	                    	<td align="right" >用户姓名：</td>
	                        <td>
	                        	<input type="text" id="username" name="username" value="${vo.username}" style="width:160px;"/>
	                        	
	                        </td>
	                        <td align="right" style="padding-left:10px;">登录名：</td>
	                        <td>
	                        	<input type="text" id="loginname" name="loginname" value="${vo.loginname}" style="width:160px;"/>
	                        </td>
	                        <td align="right">电子邮箱：</td>
	                        <td>
	                        	<input type="text" id="email" name="email" value="${vo.email}" style="width:160px;"/>
	                        </td>
	                        
	                    </tr>
	                    <tr>
	                    	<td align="right">权限：</td>
	                        <td>
	                        	<select id="power" name="power" style="width:160px;">
	                            	<option value="-1">=请选择=</option>
	                            	<option value="99">超级管理员</option>
	                            	<option value="1">普通管理员</option>
	                            	<option value="2">其他</option>
	                            </select>
	                        </td>
	                       <td align="right" style="padding-left:10px;">状态：</td>
	                        <td>
	                        	<select id="uflag" name="uflag" style="width:160px;">
	                        		<option value="-1">=请选择=</option>
	                                <option value="1">有效</option>
	                                <option value="2">失效</option>
	                            </select>
	                        </td>
	                        <td colspan="2" style="padding-left:10px;" valign="baseline">
	                        	<button type="button" onclick="doSearch(1);" class="btn btn-primary">查询</button>
	                        	<button type="button" onclick="doResetForm();" class="btn btn-primary">重置</button>
	                        </td>
	                    </tr> 
	                </table>
                </form>
            </div>
            <hr>
            <div class="row-fluid" style="height:20px;">	
            	<div style="float: left">
            		 <a class="btn btn-success" href="adduser.jsp">
	                    <i class="icon-plus icon-white"></i> 新增                                          
	                </a>
            	</div>
            	<div class="alert alert-success alert-block span10"  id="info" style="display: none; height:16px; padding-top:2px; line-height:16px;" >
			         <h4 class="alert-heading">密码已重设</h4>
			    </div>
            </div>
            
            <div class="row-fluid">	
				<div class="box span12">
					<div class="box-header well data-original-title" style="cursor:default;">
						<h4>用户信息</h4>
					</div>
					<div class="box-content" style="font-size:14px;">
						<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>用户姓名</th>
									  <th>登录名</th>
									  <th>邮箱</th>
                                      <th>权限</th>  
                                      <th>状态</th>  
                                      <th>操作</th>                                      
								  </tr>
							  </thead>   
							  <tbody>
							  	  <c:forEach items="${ulist}" var="u">
							  	  	<tr>
                    					<td>${u.username}</td>
										<td>${u.loginname}</td>
	                                    <td>${u.email}</td>
	                                    <td>
	                                    	<c:choose>
												<c:when test="${u.power == 99}">
													超级管理员
												</c:when>
												<c:when test="${u.power == 1}">
													普通管理员
												</c:when>
												<c:otherwise>
													其他
												</c:otherwise>
											</c:choose>
										</td>   
	                                    <td>
	                                    	<c:choose>
												<c:when test="${u.uflag == 1}">
													<span class="label label-success">有效</span>
												</c:when>
												<c:otherwise>
													<span class="label label-important">失效</span>
												</c:otherwise>
											</c:choose>
											
										</td>   
	                                    <td>
	                                    	<a class="btn btn-inverse" href="javascript:resetPassword(${u.userid})">
	                                            <i class="icon-zoom-in icon-white"></i>  
	                                           		重设密码
	                                        </a>
	                                        <a class="btn btn-info" href="../../handle/user/entryEditUser.action?userid=${u.userid}">
	                                            <i class="icon-edit icon-white"></i>  
	                                            	编辑                                           
	                                        </a>
	                                        <c:choose>
												<c:when test="${u.uflag == 1}">
													<a class="btn btn-danger" href="../../handle/user/resetUserFlag.action?userid=${u.userid}&uflag=2">
			                                            <i class="icon-trash icon-white"></i> 
			                                           		 删除
			                                        </a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-success" href="../../handle/user/resetUserFlag.action?userid=${u.userid}&uflag=1">
					                                    <i class="icon-retweet icon-white"></i> 
					                                      	 恢复
					                                </a>
												</c:otherwise>
											</c:choose>
	                                      </td>                                    
									 </tr>    
                    			  </c:forEach>                      
							  </tbody>
						 </table>  
						 <div class="pagination pagination-centered">
						 <ul>
						    <li><a href="javascript:doSearch(1);">首页</a></li>
						 <c:forEach begin="${pnum-1 <= 0 ? 1 : pnum-1}" end="${pnum+1 >= mpage ? mpage : pnum+1}" var="pindex">
						 	<c:choose>
						 		<c:when test="${pnum == pindex}">
						 			<li class="active">
									  <a href="#">${pindex}</a>
									</li>
						 		</c:when>
						 		<c:otherwise>
						 			<a href="javascript:doSearch(${pindex});">${pindex}</a>
						 		</c:otherwise>
						 	</c:choose>
						 </c:forEach>
							<li><a href="javascript:doSearch(${mpage});">尾页</a></li>
							<li><a href="#">共${ucount}条${mpage}页</a></li>
						  </ul>
						  <script type="text/javascript">
						  		function doSearch(pnum){
						  			$("#pnum").val(pnum);
						  			document.searchForm.submit();
						  		}
						  		function doResetForm(){
						  			$("#username").val("");
						  			$("#loginname").val("");
						  			$("#email").val("");
						  			$("#power").val(-1);
									$("#uflag").val(-1);
						  		}
						  </script>
						</div>     
					</div>
				</div><!--/span-->
			</div><!--/row-->
        </div>
    </div>
</div>         
<hr>
<!-- 底部footer部分 -->
<jsp:include page="/handle/system/footer.jsp"></jsp:include>

</body>
</html>