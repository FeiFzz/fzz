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
<title>文件上传演示</title>
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
	$(window).load(function (){
		var code = <%=code%>;
		if(code == 2){
			$("#info").show();
			setTimeout(function (){
				$("#info").fadeOut(2000);
			},5000);
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
                    <li>上传示例演示</li>
                </ul>
            </div>
            <div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title style="cursor:default;">
						<h2><i class="icon-edit"></i> 演示信息
                        (带有<span style="color:red">*</span>为必填项)</h2>
					</div>
					<div class="box-content">
						<form enctype="multipart/form-data" action="../../uploadDemo.action" method="post" class="form-horizontal">
							<fieldset>
							  <div id="div1" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 文本域</label>
								<div class="controls">
								  <input id="text1" name="text1" type="text" placeholder="请输入文本信息">
								  <span id="tooltip1" class="help-inline">请文本内容</span>
                                </div>
							  </div>
                              <div id="div5" class="control-group">
                                <label class="control-label"><span style="color:red">*</span> 文件域</label>
								<div class="controls">
								  <input id="file1" name="file1" type="file" placeholder="请选择文件">
								  <span id="tooltip5" class="help-inline">请选择上传文件</span>
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
			         <h4 class="alert-heading">文件已上传</h4>
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