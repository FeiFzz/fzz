package com.ytime.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ytime.util.CommonValues;

/**
 * 该过滤器完成防盗链功能
 * @author Administrator
 *
 */
public class LoginDefanceFilter implements Filter {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());

	@Override
	public void destroy() {
		logger.info(this.getClass().getName()+":登录过滤器销毁");	
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)req;
		HttpSession session = request.getSession();
		if(session.getAttribute(CommonValues.USER_SESSION_NAME) == null){
			HttpServletResponse response = (HttpServletResponse)res;
			response.sendRedirect(request.getContextPath());
		}else{
			chain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println(this.getClass().getName()+":登录过滤器初始化");	
	}

}
