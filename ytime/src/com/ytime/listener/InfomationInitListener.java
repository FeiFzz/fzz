package com.ytime.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ytime.util.Initialization;

/**
 * 该监听器完成项目启动时加载基本信息的功能
 * @author Administrator
 *
 */
public class InfomationInitListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent sce) {}

	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		ApplicationContext spring = WebApplicationContextUtils
				.getWebApplicationContext(application);
		Initialization i = (Initialization) spring.getBean("initBean");
		i.initBase(application);
		i.initContent(application);
	}

}
