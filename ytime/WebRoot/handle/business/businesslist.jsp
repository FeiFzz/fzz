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
<title>项目管理</title>
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
                    <li>企业业务管理</li>
                </ul>
            </div>
            <div class="row-fluid" style="font-size:14px;">
               <form action="../../handle/business/getBusinesslist.action" method="post" name="searchForm">
               		<input type="hidden" id="pnum" name="pnum" value="${pnum}"/>
	            	<table>
	                	<tr>
	                	 
	                    	<td align="right" >业务名称：</td>
	                        <td>
	                        	<input type="text" id="pname" name="pname" value="${vo.bname}" style="width:160px;"/>
	                        	
	                        </td>
	                        <td align="right" style="padding-left:10px;">业务标题：</td>
	                        <td>
	                        	<input type="text" id="Pyear" name="loginname" value="${vo.bsubject}" style="width:160px;"/>
	                        </td>
	                        <%--
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
	                         --%>
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
            		 <a class="btn btn-success" href="addproject.jsp">
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
						<h4>项目信息</h4>
					</div>
					<div class="box-content" style="font-size:14px;">
						<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>业务名称</th>
									  <th>业务标题</th>
									  <th>业务描述</th>
                                      <th>图片链接</th>  
                                      <th>有效标识位</th>
                                      <th>展示顺序</th>  
                                      <th>操作</th>                                      
								  </tr>
							  </thead>   
							  <tbody>
							  	  <c:forEach items="${blist}" var="b">
							  	  	<tr>
                    					<td>${b.bname}</td>
                    					<td>${b.bsubject}</td>
                    					                   					
                    					<td>
                    						<a class="btn btn-info" href="../../handle/business/entryEditBusiness.action?busid=${b.busid}">
	                                            <i class="icon-edit icon-white"></i>  
	                                            	项目描述                                           
	                                        </a>
                    					</td>
                    					<td>${b.bimg}</td>
                    					<td>${b.bflag}</td>
                    					<td>${b.border}</td> 
                    					<td>
	                                        <a class="btn btn-info" href="../../handle/business/entryEditBusiness.action?busid=${b.busid}">
	                                            <i class="icon-edit icon-white"></i>  
	                                            	编辑                                           
	                                        </a>
	                                        <c:choose>
												<c:when test="${b.bflag == 1}">
													<a class="btn btn-danger" href="../../handle/user/resetUserFlag.action?userid=${b.busid}&uflag=2">
			                                            <i class="icon-trash icon-white"></i> 
			                                           		 删除
			                                        </a>
												</c:when>
												<c:otherwise>
													<a class="btn btn-success" href="../../handle/user/resetUserFlag.action?userid=${b.busid}&uflag=1">
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