package com.ytime.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ytime.util.Initialization;

/**
 * �ü����������Ŀ����ʱ���ػ�����Ϣ�Ĺ���
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
