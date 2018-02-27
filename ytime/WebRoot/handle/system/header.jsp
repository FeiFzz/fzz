<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="navbar">
	<div class="navbar-inner">
	    <div class="container-fluid">
	        <!-- Logo -->
	        <a class="brand" href="main.jsp"> 
	            <span style="font-family:黑体; width:220px;">${applicationScope.company}</span>
	        </a>
	        <!-- 用户信息 -->
	        <div class="btn-group pull-right" >
	            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
	                <i class="icon-user"></i><span class="hidden-phone">${sessionScope.online.username}</span>
	                   <span class="caret"></span>
	               </a>
	               <ul class="dropdown-menu">
	                   <li><a href="../../handle/system/changePassword.jsp">修改密码</a></li>
	                   <li class="divider"></li>
	                   <li><a href="../../handle/logoff.action">注销</a></li>
	               </ul>
	           </div>    
	       </div>
	 </div>
</div>

