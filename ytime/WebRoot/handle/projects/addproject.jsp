<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
	String code = request.getParameter("code");
	code = code == null ? "0" : code.trim();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Spark Yang">
<title>新增项目</title>
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

<!-- The fav icon -->
<link rel="shortcut icon" href="../../images/favicon.ico">
<script type="text/javascript">
	function vEname(){
		$("#info").hide();
		var ename = $("#pname").val();
		if(ename == null || ename == ""){
			$("#div1").addClass("error");
			$("#tooltip1").html("请填写项目名称");
			return false;
		}else{
			$("#div1").removeClass("error");
			$("#tooltip1").html("请输入项目名称");
			return true;
		}
	}

	function vlname(){
		$("#info").hide();
		var loginname = $("#pname").val();
		if(loginname == null || loginname == ""){
			$("#div2").addClass("error");
			$("#tooltip2").html("请填写用户登录账号");
			return false;
		}else{
			$("#div2").removeClass("error");
			$("#tooltip2").html("请输入用户登录本系统的账号");
			return true;
		}
	}	
	
$(window).load(function (){
		var c = <%=code%>;
		if(c == 1){
			$("#info").show();
			$("#info").removeClass("alert-success");
			$("#info").addClass("alert-error");
			$("#info").html("<h4 class=\"alert-heading\">项目新增失败</h4>");
		}else if(c == 2){
			$("#info").show();
			$("#info").removeClass("alert-error");
			$("#info").addClass("alert-success");
			$("#info").html("<h4 class=\"alert-heading\">项目新增成功</h4>");
		}
	});
</script>
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
                    <li>
						<a href="../../handle/projects/getProjectlist.action">项目管理</a>
                        <span class="divider">/</span>
					</li>
                    <li>新增项目</li>
                </ul>
            </div>
            <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title style="cursor:default;">
						<h2><i class="icon-edit"></i> 项目信息
                        (带有<span style="color:red">*</span>为必填项)</h2>
					</div>
					<div class="box-content">
						<form enctype="multipart/form-data" action="../../handle/projects/addProject.action" name="sform" method="post" class="form-horizontal">
							<fieldset>
							 
							  <div id="div1" class="control-group">
                                <label class="control-label"><span style="color:red">*</span>项目名称</label>
								<div class="controls">
								  <input autofocus id="pname" name="pname" type="text" placeholder="请输入项目名称" oninput="vEname();" onblur="vEname();">
								  <span id="tooltip1" class="help-inline">请输入项目名称</span>
                                </div>
							  </div>
                              
                              <div id="div2" class="control-group">
                                <label class="control-label"><span style="color:red">*</span>开展年份</label>
								<div class="controls">
								  <input id="pyear" name="pyear" type="number"  onblur="vlname();">
								  <span id="tooltip2" class="help-inline">请选择年月日</span>
                                </div>
							  </div>
                              <div id="div3" class="control-group">
                                <label class="control-label"><span style="color:red">*</span>客户名称</label>
								<div class="controls">
								<!-- 
								  <input id="loginpass" name="loginpass" type="password" placeholder="请输入客户名称" oninput="vPass1();" onblur="vPass1();">
								  -->
								   <input id="pcustomer" name="pcustomer" type="text" placeholder="请输入客户名称">
								  <span id="tooltip3" class="help-inline">请输入客户名称</span>
                                </div>
							  </div>
                             
							  <div id="div4" class="control-group">
                                <label class="control-label">项目描述</label>
								<div class="controls">
								<textarea  rows="3" cols="5" id="pdesc" name="pdesc" placeholder="请输入项目描述"></textarea>
								  
								  <span id="tooltip5" class="help-inline"></span>
                                </div>
							  </div>
							  <!-- 以下是文件上传 -->
							  
						
							  <div id="div6" class="control-group">
                                <label class="control-label"><span style="color:red">*</span>文本域</label>
								<div class="controls">
								  <input id="text1" name="text1" type="text" placeholder="请输入文本信息">
								  <span id="tooltip1" class="help-inline">请文本内容</span>
                                </div>
							  </div>
                              <div id="div5" class="control-group">
                                <label class="control-label"><span style="color:red">*</span>文件域</label>
								<div class="controls">
								  <input id="file1" name="file1" type="file" placeholder="请选择文件">
								  <span id="tooltip5" class="help-inline">请选择上传文件</span>
                                </div>
							  </div>
							  
						  
					
							  <!-- 以上是文件上传 -->	  
							  <div style="width:500px;text-align: center;">
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-primary">重置</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
				 <div class="alert alert-success alert-block span10"  id="info" style="display: none" >
			         <h4 class="alert-heading">项目新增成功</h4>
			     </div>
			</div><!--/row-->
        </div>
    </div>
        
<hr>
<!-- 底部footer部分 -->
<jsp:include page="/handle/system/footer.jsp"></jsp:include>

</body>
</html>