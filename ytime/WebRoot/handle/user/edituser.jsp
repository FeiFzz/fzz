<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="Spark Yang">
<title>修改用户</title>
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
		var ename = $("#username").val();
		if(ename == null || ename == ""){
			$("#div1").addClass("error");
			$("#tooltip1").html("请填写用户姓名");
			return false;
		}else{
			$("#div1").removeClass("error");
			$("#tooltip1").html("请输入用户姓名");
			return true;
		}
	}

	
	function vPower(){
		$("#info").hide();
		var p = $("#power").val();
		if(p == -1){
			$("#div6").addClass("error");
			$("#tooltip6").html("请为用户选择权限");
			return false;
		}else{
			$("#div6").removeClass("error");
			$("#tooltip6").html("请选择用户的权限");
			return true;
		}
	}
	
	function vform(){	
		$("#info").hide();
		var flag = true;
		if(!vEname()){
			flag = false;
		}	
		if(!vPower()){
			flag = false;
		}
		return flag;
		
	}
	
	$(window).load(function (){
		var p = ${euinfo.power};
		$("#power").val(p);
		var c = "${code}";
		if(Number(c) == 1){
			$("#info").show();
			$("#info").removeClass("alert-success");
			$("#info").addClass("alert-error");
			$("#info").html("<h4 class=\"alert-heading\">修改失败</h4>");
		}else if(Number(c) == 2){
			$("#info").show();
			$("#info").removeClass("alert-error");
			$("#info").addClass("alert-success");
			$("#info").html("<h4 class=\"alert-heading\">修改成功</h4>");
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
						<a href="../../handle/user/getUserList.action">用户管理</a>
                        <span class="divider">/</span>
					</li>
                    <li>编辑用户</li>
                </ul>
            </div>
            <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title style="cursor:default;">
						<h2><i class="icon-edit"></i> 用户信息
                        (带有<span style="color:red">*</span>为必填项)</h2>
					</div>
					<div class="box-content">
						<form action="../../handle/user/editUser.action" onsubmit="return vform();" name="sform" method="post" class="form-horizontal">
							<fieldset>
							  <input type="hidden" name="userid" value="${euinfo.userid}"/>
							  <div id="div1" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 用户姓名</label>
								<div class="controls">
								  <input autofocus value="${euinfo.username}" id="username" name="username" type="text" placeholder="请输入用户姓名" oninput="vEname();" onblur="vEname();">
								  <span id="tooltip1" class="help-inline">请输入用户姓名</span>
                                </div>
							  </div>
                              <div id="div5" class="control-group">
                                <label class="control-label">电子邮箱</label>
								<div class="controls">
								  <input value="${euinfo.email}" id="email" name="email" type="text" placeholder="请输入电子邮箱">
								  <span id="tooltip5" class="help-inline"></span>
                                </div>
							  </div>
                              
                               <div id="div6" class="control-group">
                              	<label class="control-label"><span style="color:red">*</span>权限</label>
                                  <div class="controls">
                                    <select id="power" name="power">
                                        <option value="-1">=请选择=</option>
		                            	<option value="99">超级管理员</option>
		                            	<option value="1">普通管理员</option>
		                            	<option value="2">其他</option>
		                            </select>
                                    <span id="tooltip6" class="help-inline">请选择用户的权限</span>
                                  </div>
							  </div>
							  
							  <div style="width:500px;text-align: center;">
								<button type="submit" class="btn btn-primary">提交</button>
								<button type="reset" class="btn btn-primary">重置</button>
							  </div>
							</fieldset>
						  </form>
					
					</div>
				</div><!--/span-->
				 <div class="alert alert-success alert-block span10"  id="info" style="display: none" >
			         <h4 class="alert-heading">修改成功</h4>
			     </div>
			</div><!--/row-->
        </div>
    </div>
</div>         
<hr>
<!-- 底部footer部分 -->
<jsp:include page="/handle/system/footer.jsp"></jsp:include>

</body>
</html>