<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<div class="span2 main-menu-span" >
    <div class="well nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
        	<li class="nav-header hidden-tablet">系统菜单</li>
        	<li>
            	<a class="ajax-link" href="../../handle/system/main.jsp">
                    <i class="icon-home"></i>
                    <span class="hidden-tablet">首页</span>
                </a>
            </li>
            <li>
            	<a class="ajax-link" href="../../handle/system/modifyMyinfo.jsp">
                    <i class="icon-tag"></i>
                    <span class="hidden-tablet">修改个人信息</span>
                </a>
            </li>
            <li>
            	<a class="ajax-link" href="../../handle/system/demo.jsp">
                    <i class="icon-tag"></i>
                    <span class="hidden-tablet">文件上传演示示例</span>
                </a>
            </li>
           <c:choose>
            	<c:when test="${sessionScope.online.power == 1 || sessionScope.online.power == 99}">
		            <li class="nav-header hidden-tablet">网站内容维护</li>
		            <li>
		            	<a class="ajax-link" href="#">
		                	<i class="icon-briefcase"></i>
		                    <span class="hidden-tablet">基础信息管理</span>
		                </a>
		            </li> 
		            <c:choose>
            			<c:when test="${sessionScope.online.power == 99}">
				            <li>
				            	<a class="ajax-link" href="../../handle/user/getUserList.action">
				                    <i class="icon-user"></i>
				                    <span class="hidden-tablet">用户信息管理</span>
				                </a>
				            </li>
				        </c:when>
		            </c:choose>
		            <li>
		            	<a class="ajax-link" href="#">
		                	<i class="icon-picture"></i>
		                    <span class="hidden-tablet">轮播信息管理</span>
		                </a>
		            </li>   
		            <li>
		            	<a class="ajax-link" href="../../handle/business/getBusinesslist.action">
		                    <i class="icon-flag"></i>
		                    <span class="hidden-tablet">企业介绍管理</span>
		                </a>
		            </li>   
		            <li>
		            	<a class="ajax-link" href="../../handle/projects/getProjectlist.action">
		                	<i class="icon-road"></i>
		                    <span class="hidden-tablet">项目介绍管理</span>
		              	</a>
		           	</li> 
		           	<li>
		            	<a class="ajax-link" href="#">
		                	<i class="icon-plane"></i>
		                    <span class="hidden-tablet">客户信息管理</span>
		              	</a>
		           	</li>
		           	<li>
		            	<a class="ajax-link" href="../../handle/message/entrylist.action">
		                	<i class="icon-envelope"></i>
		                    <span class="hidden-tablet">网站收信管理</span>
		              	</a>
		           	</li> 
		        </c:when>
		    </c:choose>    	      
        </ul>
    </div>
</div>

