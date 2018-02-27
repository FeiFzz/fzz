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
<title>修改密码</title>
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
	/**
	 * 检查密码强度
	 * 0: 长度小于6的密码(禁止)
	 * 1: 纯数字密码(弱)
	 * 2: 单纯小写英文或大写英文的密码, 长度小于8的任意密码(弱)
	 * 3: 包含一种英文和数字的密码或纯特殊字符的密码(中)
	 * 4: 只包含大小写英文混合的密码或只包含特殊文字与数字混合的密码(中)
	 * >=5: 复杂度较高的密码(强)
	 * 
	 * @param {Object} password
	 * @return {TypeName} 
	 */
	function checkRank(password){
		if(password.length < 6 ){
		     return 0;
		}
		var ls = 0;
		if (password.match(/[a-z]/g)){ 
		 	ls += 2;
		}
		if (password.match(/[A-Z]/g)){
		 	ls += 2;
		} 
		if (password.match(/[0-9]/g)){
		 	ls++; 
		}
		if (password.match(/[^a-zA-Z0-9]/g)){ 
			ls += 3;
		}
		if (password.length < 8 && ls > 2){
			ls = 2;
		} 
		return ls; 
    }
	 
	function vPass0(){
		$("#info").hide();
		var opass = $("#opass").val();
		if(opass == ""){
			$("#div1").addClass("error");
			$("#tooltip1").html("请输入当前密码");
			return false;
		}else{
			$("#div1").removeClass("error");
			$("#tooltip1").html("请输入当前密码");
			return true;
		}
		
	}

	
	function vPass1(){
		$("#info").hide();
		var loginpass = $("#loginpass").val();
		var rank = checkRank(loginpass);
		if(rank == 0){
			$("#div3").addClass("error");
			$("#div3").removeClass("success");
			$("#div3").removeClass("warn");
			$("#tooltip3").html("密码的长度不能低于6");
			return false;
		}else if(rank == 1 || rank == 2){
			$("#div3").addClass("warning");
			$("#div3").removeClass("error");
			$("#div3").removeClass("success");
			$("#tooltip3").html("为了安全,应设置较为复杂的密码");
			return true;
		}else if(rank == 3 || rank == 4){
			$("#div3").removeClass("success");
			$("#div3").removeClass("warning");
			$("#div3").removeClass("error");
			$("#tooltip3").html("");
			return true;
		}else{
			$("#div3").addClass("success");
			$("#div3").removeClass("warning");
			$("#div3").removeClass("error");
			$("#tooltip3").html("良好的密码安全性");
		}
	}
	function vPass2(){
		$("#info").hide();
		var lp1 = $("#loginpass").val();
		var lp2 = $("#loginpass2").val();
		if(lp1 != lp2){
			$("#div4").addClass("error");
			$("#tooltip4").html("两次输入的新密码不一致");
			return false;
		}else{
			$("#div4").removeClass("error");
			$("#tooltip4").html("请再输入一次新密码");
			return true;
		}
	}
	

	function vform(){
		$("#info").hide();
		var flag = true;
		if(!vPass0()){
			flag = false;
		}
		if(!vPass1()){
			flag = false;
		}
		if(!vPass2()){
			flag = false;
		}
		return flag;
	}
	
	$(window).load(function (){
		var c = <%=code%>;
		if(Number(c) == 1){
			$("#info").show();
			$("#info").html("<h4 class=\"alert-heading\">修改失败</h4>");
		}else if(Number(c) == 2){
			$("#info").show();
			$("#info").html("<h4 class=\"alert-heading\">当前密码输入错误</h4>");
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
                    <li>修改密码</li>
                </ul>
            </div>
            <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title style="cursor:default;">
						<h2><i class="icon-edit"></i> 密码信息
                        (带有<span style="color:red">*</span>为必填项)</h2>
					</div>
					<div class="box-content">
						<form action="../../handle/changePassword.action" onsubmit="return vform();" name="sform" method="post" class="form-horizontal">
							<fieldset>
							 
							  <div id="div1" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 当前密码</label>
								<div class="controls">
								  <input autofocus id="opass" name="opass" type="text" placeholder="请输入当前密码" oninput="vPass0();" onblur="vPass0();">
								  <span id="tooltip1" class="help-inline">请输入当前密码</span>
                                </div>
							  </div>
                              <div id="div3" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 新密码</label>
								<div class="controls">
								  <input id="loginpass" name="loginpass" type="password" placeholder="请输入新密码" oninput="vPass1();" onblur="vPass1();">
								  <span id="tooltip3" class="help-inline">请输入新密码</span>
                                </div>
							  </div>
                              <div id="div4" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 确认新密码</label>
								<div class="controls">
								  <input id="loginpass2" name="loginpass2" type="password" placeholder="请输入新密码" oninput="vPass2();" onblur="vPass2();">
								  <span id="tooltip4" class="help-inline">请再输入一次新密码</span>
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
				 <div class="alert alert-error alert-block span10"  id="info" style="display: none" >
			         <h4 class="alert-heading">当前密码输入错误</h4>
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