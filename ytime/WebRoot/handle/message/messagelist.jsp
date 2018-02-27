<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Spark Yang">
<title>收信管理</title>
<link id="bs-css" href="../../css/bootstrap-cerulean.css" rel="stylesheet">
<link id="bs-css" href="../../css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
<link id="bs-css" href="../../css/jquery.cleditor.css" rel="stylesheet">
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
<script src="../../js/jquery-ui-1.8.21.custom.min.js" charset="utf-8"></script>
<script src="../../js/jquery.cleditor.min.js"></script>
<!-- custom dropdown library -->
<script src="../../js/bootstrap-dropdown.js"></script>
<!-- application script for Charisma demo -->
<script src="../../js/charisma.js"></script>
<script type="text/javascript" language="javascript">
	$(window).load(function (){
		//var sflag = ${vo.sflag};
		//$("#sflag").val(uflag);
	});
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
                    <li>收信管理</li>
                </ul>
            </div>
            <div class="row-fluid" style="font-size:14px;">
               <form action="../../handle/user/getUserList.action" method="post" name="searchForm">
               		<input type="hidden" id="pnum" name="pnum" value="${pnum}"/>
	            	<table>
	                	<tr>
	                    	<td align="right">提交者姓名：</td>
	                        <td>
	                        	<input type="text" id="subname" name="subname" value="" style="width:160px;"/>
	                        	&nbsp;
	                        </td>
	                        <td align="right">提交者Email：</td>
	                        <td>
	                        	<input type="text" id="email" name="email" value="" style="width:160px;"/>
	                        	&nbsp;
	                        </td>
	                        <td align="right" style="padding-left:10px;">标题：</td>
	                        <td>
	                        	<input type="text" id="subject" name="subject" value="" style="width:160px;"/>
	                        </td>   
	                    </tr>
	                    <tr>
	                    	<td align="right" style="padding-left:10px;">状态：</td>
	                        <td>
	                        	<select id="sflag" name="sflag" style="width:160px;">
	                        		<option value="-1">=请选择=</option>
	                                <option value="1">有效</option>
	                                <option value="2">失效</option>
	                            </select>
	                        </td>
	                    	<td align="right" >提交时间：</td>
	                        <td colspan="3">
	                        	<input type="text" class="datepicker" id="stime" name="stime" readonly value="" style="width:160px;"/> ～
	                        	<input type="text" class="datepicker" id="etime" name="etime" readonly value="" style="width:160px;"/>
	                        </td>
	                        <td style="padding-left:10px;" valign="baseline">
	                        	<button type="button" onclick="doSearch(1);" class="btn btn-primary">查询</button>
	                        	<button type="button" onclick="doResetForm();" class="btn btn-primary">重置</button>
	                        </td>
	                    </tr> 
	                </table>
                </form>
            </div>
            <hr>
            <div class="row-fluid" style="height:20px;">	
            	<div class="alert alert-success alert-block span10"  id="info" style="display: none; height:16px; padding-top:2px; line-height:16px;" >
			         <h4 class="alert-heading">操作成功</h4>
			    </div>
            </div>
            
            <div class="row-fluid">	
				<div class="box span12">
					<div class="box-header well data-original-title" style="cursor:default;">
						<h4>信件信息</h4>
					</div>
					<div class="box-content" style="font-size:14px;">
						<table class="table table-bordered table-striped table-condensed">
							  <thead>
								  <tr>
									  <th>提交者姓名</th>
									  <th>提交者Email</th>
									  <th>标题</th>
                                      <th>提交时间</th>  
                                      <th>状态</th>  
                                      <th>操作</th>                                      
								  </tr>
							  </thead>   
							  <tbody>
							  	  <c:forEach items="${slist}" var="s">
							  	  	<tr>
                    					<td>${s.sname}</td>
										<td>${s.email}</td>
	                                    <td>${s.ssubject}</td>
	                                    <td>
	                                    	<fmt:formatDate value="${s.ctime}" pattern="yyyy-MM-dd"/>
										</td>   
	                                    <td>
	                                    	<c:choose>
												<c:when test="${s.sflag == 1}">
													<span class="label label-success">有效</span>
												</c:when>
												<c:otherwise>
													<span class="label label-important">失效</span>
												</c:otherwise>
											</c:choose>
											
										</td>   
	                                    <td>
	                                        <a class="btn btn-info" href="../../handle/user/entryEditUser.action?userid=${u.userid}">
	                                            <i class="icon-edit icon-white"></i>  
	                                            	详细                                       
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
						  			$("#subname").val("");
						  			$("#email").val("");
						  			$("#subject").val("");
						  			$("#stime").val("");
						  			$("#etime").val("");
									$("#sflag").val(-1);
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