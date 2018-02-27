<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String su = request.getParameter("su");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="${applicationScope.company}">
<meta name="author" content="Spark Yang">
<title>${applicationScope.company}</title>
<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
<style type="text/css">
  body {
	padding-bottom: 40px;
  }
  .sidebar-nav {
	padding: 9px 0;
  }
</style>
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/charisma-app.css" rel="stylesheet">
<!-- jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!-- The fav icon -->
<link rel="shortcut icon" href="images/favicon.ico">

<script>
	$(document).ready(function(e) {
        $("#loginForm").submit(function(){
			var n = $("#loginname").val();
			if(n == ""){
				$("#tooltip").html("请输入用户名");
				return false;
			}
			var p = $("#loginpass").val();
			if(p == ""){
				$("#tooltip").html("请输入密码");
				return false;
			}
			return true;
		});
        var su = <%=su%>;
        if(su == 1){
        	$("#tooltip").html("用户名或密码不正确");
        }else if(su == 2){
        	$("#tooltip").html("密码修改成功，您需要重新进行登录");
        }
        
    });
</script>	
</head>

<body>
	<div class="container-fluid">
		<div class="row-fluid">
		
			<div class="row-fluid">
				<div class="span12 center login-header">
					<h2>${applicationScope.company}</h2>
				</div>
			</div>
			
			<div class="row-fluid">
				<div class="well span5 center login-box">
					<div id="tooltip" class="alert alert-info">
						请输入用户名和密码进行登录
					</div>
					<form class="form-horizontal" id="loginForm" action="login.action" method="post">
						<fieldset>
							<div class="input-prepend" data-rel="tooltip">
								<span class="add-on">
                                	<i class="icon-user"></i>
                                </span>
                              	<input autofocus class="input-large span10" placeholder="请输入用户名" name="loginname" id="loginname" type="text"/>
							</div>
							<div class="clearfix"></div>

							<div class="input-prepend" data-rel="tooltip">
								<span class="add-on">
                                	<i class="icon-lock"></i>
                                </span>
                                <input class="input-large span10" placeholder="请输入密码" name="loginpass" id="loginpass" type="password"/>
							</div>
							<div class="clearfix"></div>
							<!--
							<div class="input-prepend">
								<label class="remember" for="remember">
                                <input type="checkbox" id="remember" />记住我</label>
							</div>
                            -->
							<div class="clearfix"></div>

							<p class="center span5">
								<button type="submit" class="btn btn-primary">登录</button>
							</p>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
        <div class="row-fluid center">
        	<small>Copyright &copy; 2014-2015.${applicationScope.company} All rights reserved.</small>
        </div>	
	</div>
</body>
</html>
