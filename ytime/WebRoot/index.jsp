<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<title>${applicationScope.company}</title>
<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<link rel="shortcut icon" href="images/favicon.ico">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="${applicationScope.company}">
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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<!-- start slider -->
<link rel="stylesheet" href="css/fwslider.css" media="all">
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/fwslider.js"></script>

</head>
<body>
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
<div id="fwslider"><!-- start slider -->
        <div class="slider_container">
        	<c:forEach items="${applicationScope.sliders}" var="s">
        		<div class="slide"> 
	                <img src="images/${s.sliderImg}">
	                <div class="slide_content">
	                	<div class="slider_right pull-right">
		                    <div class="slide_content_wrap">
		                        <h4 class="title">${s.sliderName}</h4>
		                        <h5 class="title1">${s.sliderSubject}</h5>
		                        <!-- 
		                        <p class="description">${s.sliderDesc}</p>
		                         -->
		                    </div>
	                    </div>
	                </div>
	                <div class="clearfix"></div>
	            </div>
        	</c:forEach>
            <!--/slide -->
        </div>
        <div class="timers"></div>
        <div class="slidePrev"><span></span></div>
        <div class="slideNext"><span></span></div>
</div><!-- end slider -->
<div class="content_bg"><!-- start main -->
<div class="container">
	<div class="main">
		<div class="about" id="about"><!-- start about -->
			<h3 class="style">企业简介</h3>
			<p class="para">
            	沈阳移云时代科技有限公司成立于2015年,致力于金融,房产,教育行业在互联网+时代与IT技术
                的融合,提供相应的人才派遣服务.
            </p>
            <!-- 
			<span><a href="#" style="color:#FFFFFF;">更多</a></span>
			 -->
			<div class="span_of_3"><!-- start span_of_3 -->
				<c:forEach items="${applicationScope.bussinesses}" var="b" varStatus="i">
					<c:choose>
						<c:when test="${(i.count+1)%5 == 0}">
							<div class="col-md-4 holder1_of_3" style="margin-left: 0px;">
						</c:when>
						<c:when test="${(i.count+1)%4 == 0}">
							<div class="col-md-4 holder1_of_3">
						</c:when>
						<c:otherwise>
							<div class="col-md-4 holder1_of_3">
						</c:otherwise>
					</c:choose>
					
						<div class="holder smooth">
				            <img src="images/${b.bimg}" alt="">
				            <h4>${b.bsubject}</h4>
							<div class="go-top" style="width:100%">
							   <p>${b.bdesc}</p>
							</div>
				        </div>
				     </div>
				</c:forEach>
				<div class="clearfix"></div>
			</div><!-- end span_of_3 -->
			<div class="clearfix"></div>
		</div><!-- end about -->
		<div class="about" id="client"><!-- start work -->
			<span style="border-bottom: 2px solid #FFFFFF;"><p class="line"></p></span>
			<div class="work_top">
			<h3 class="style">项目展示</h3>
			<p class="para">
				填写介绍
			</p>
			<!-- 
			<span><a href="#" style="color:#FFFFFF;">更多</a></span>
			 -->
			<div class="span_1_of_3"><!-- start span_of_3 -->
				<c:forEach items="${applicationScope.projects}" var="p">
					<div class="col-md-4 span1_of_3">
						<div class="holder smooth last">
				            <img src="images/${p.pimg}">
							<div class="go-top work_text">
								<h5>${p.pname}</h5>
								<p>时间: <a href="#">${p.pyear}</a> | 合作企业: <a href="${p.curl}">${p.cname}</a></p>
							</div>
				        </div>
				     </div>
				</c:forEach>		       			       
				<div class="clearfix"></div>
			</div><!-- end span_of_3 -->	
		 </div>
		 <span style="border-bottom: 2px solid #FFFFFF;"><p class="line"></p></span>
		</div><!-- end work -->
	</div>
</div>
</div>
<div class="footer_bg" id="contact"><!-- start footer -->
<div class="container">
	<div class="footer">
		<h3>联系我们</h3>
		<div class="col-md-6 contact_left">
			<p class="btm">
				您可以通过下面的联系方式联系我们<br/>
				或者在右侧填写信息提交给我们。
			</p>
			<div class="f_left">
				<div class="col-md-3 f_list">
					<span>联系电话</span>
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
					<span>电子邮箱</span>
				</div>
				<div class="col-md-9 f_list1">
					<c:forEach items="${applicationScope.emails}" var="email">
						<p><a href="mailto:${email}">${email}</a></p>
					</c:forEach>
					 
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<div class="col-md-6 contact_right">
			<form method="post" action="#" name="subform" onsubmit="return false;">
				<input type="text" id="sname" name="sname" value="姓名" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '姓名';}">
				<input type="text" id="smail" name="smail"  value="电子邮箱" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '电子邮箱';}">
				<input type="text" id="subject" name="subject" value="标题" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '标题';}">
				<textarea id="sct" name="sct" onFocus="if(this.value == '在此填写内容') this.value='';" onBlur="if(this.value == '') this.value='在此填写内容';" >在此填写内容</textarea>
				<span><input type="submit" onclick="vForm();" value="提交"></span>&nbsp;
				<span id="ftip" style="color:#ffffff;"></span>
			</form>
		</div>
		<div class="clearfix"></div>
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
		<script type="text/javascript">
			function vForm(){
				
				var sname = $("#sname").val();
				var smail = $("#smail").val();
				var subject = $("#subject").val();
				var sct = $("#sct").val();
				
				if(sname=="姓名" || sname==""){
					$("#ftip").html("请您填写姓名");
					return;
				}
				
				if(smail=="电子邮箱" || smail=="邮箱" || smail==""){
					$("#ftip").html("请您填写电子邮箱");
					return;
				}
				
				if(subject=="标题" || subject==""){
					$("#ftip").html("请您填写标题");
					return;
				}
				
				if(sct=="在此填写内容" || sct=="内容" || sct==""){
					$("#ftip").html("请您填写内容");
					return;
				}
				$("#ftip").html("");
				
				$.ajax({
					url:"subinfo.action",
					type:"post",
					data:{
						sname:sname,
						email:smail,
						ssubject:subject,
						sdesc:sct
					},
					error: function(XMLHttpRequest, textStatus, errorThrown){
						//alert(XMLHttpRequest.status);
						//alert(XMLHttpRequest.readyState);
						$("#ftip").html("提交失败");
					},
					success: function(msg){
						if(msg == true || msg == "true"){
							$("#ftip").html("提交成功");
							document.subform.reset();
						}else{
							$("#ftip").html("提交失败");
						}
					},
					dataType:"text"
				});
			}
		</script>
	</div>
</div>
</div>

</body>
</html>
