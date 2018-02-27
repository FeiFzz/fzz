<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>请求的页面不存在</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<!----font-Awesome----->
   	<link rel="stylesheet" href="fonts/css/font-awesome.min.css">
<!----font-Awesome----->
<!--
<link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,700italic,800italic,400,300,700,800,600' rel='stylesheet' type='text/css'>
-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<!-- start plugins -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<div class="header_bg" id="home"><!-- start header -->
<div class="container">
	<div class="header">
		<div class="logo navbar-left">
			<h1>
			<a href="index.jsp">
			<img src="images/logo.jpg" class="img-responsive" />
			</a>
			</h1>				
		</div>
		<div class="h_menu navbar-right">
			<nav class="navbar navbar-default" role="navigation">
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			      <ul class="nav navbar-nav">
			        <li><a href="#about">企业简介</a></li>
			        <li><a href="#client">项目展示</a></li>
			        <li><a href="#contact">联系我们</a></li>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			</nav>
			<div class="clearfix"></div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>
</div><!-- end header -->
<div class="content_bg"><!-- start main -->
<div class="container">
	<div class="main"><!-- start work -->
		<div class="works_list">
			<h3 class="style">404 请求的网页不存在</h3>
			<img src="images/work_pic1.jpg" alt="" class="img-responsive"/>
		</div>
	<div class="works_main">
		<div class="col-md-6 work_left">
			<div class="f_left">
				<div class="col-md-3 f_list">
					<span>网站首页:</span>
				</div>
				<div class="col-md-9 f_list1">
					 <a href="index.jsp" style="color:#ffffff;">${applicationScope.company}</a>
				</div>
				<div class="clearfix"></div>
			</div>
			
		</div>	
		<div class="col-md-6 work_left">
			<div class="f_left">
				<div class="col-md-3 f_list">
					<span>联系电话:</span>
				</div>
				<div class="col-md-9 f_list1">
					<c:forEach items="${applicationScope.tels}" var="tel">
						<p>${tel}</p>
					</c:forEach>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="f_left">
				<div class="col-md-3 f_list">
					<span>电子邮箱:</span>
				</div>
				<div class="col-md-9 f_list1">
					<c:forEach items="${applicationScope.emails}" var="email">
						<p><a href="mailto:${email}">${email}</a></p>
					</c:forEach>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="clearfix"></div>	
	</div>
	</div>
</div>
</div>
<div class="footer1_bg"><!-- start footer1 -->
<div class="container">
	<div class="footer1">
		<div class="copy pull-left">
			<p class="link">Copyright &copy; 2014-2015.${applicationScope.company} All rights reserved.</p>
			<a href="#home" id="toTop" style="display: block;">
            	<span id="toTopHover" style="opacity: 1;"> </span>
            </a>
		</div>
		<div class="clearfix"></div>
		<script type="text/javascript">
				$(function() {
				  $('a[href*=#]:not([href=#])').click(function() {
				    if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
			
				      var target = $(this.hash);
				      target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
				      if (target.length) {
				        $('html,body').animate({
				          scrollTop: target.offset().top
				        }, 1000);
				        return false;
				      }
				    }
				  });
				});
		</script>
	</div>
</div>
</div>

</body>
</html>