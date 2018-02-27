package com.ytime.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ytime.po.Business;
import com.ytime.po.Bussiness;
import com.ytime.po.Slider;
import com.ytime.service.SystemService;
import com.ytime.vo.ProjectVO;

/**
 * 该类主要完成服务器启动时工程的一些初始化操作
 * @author Administrator
 *
 */
@Component
public class Initialization {
	
	private Logger logger = Logger.getLogger(this.getClass().getName());
	
	@Autowired
	private SystemService ss;
	
	public static List<Slider> slist = new ArrayList<Slider>();
	
	public static List<Bussiness> blist = new ArrayList<Bussiness>();
	
	public static List<ProjectVO> plist = new ArrayList<ProjectVO>();
	
	public static List<String> tels = new ArrayList<String>();
	
	public static List<String> adresses = new ArrayList<String>();
	
	public static List<String> emails = new ArrayList<String>();
	
	public static String company = null;

	/**
	 * 初始化各项内容
	 * @param application
	 */
	public void initContent(ServletContext application){
		reloadSlider(application);
		reloadIntroduce(application);
		reloadProjects(application);		
	}
	
	/**
	 * 初始化各项基本信息
	 * @param application
	 */
	public void initBase(ServletContext application){
		reloadCompanyName(application);
		reloadTelNumber(application);
		reloadEmail(application);
		//reloadAdress(application);	
	}
	
	/**
	 * 刷新轮播内容
	 * @param application
	 */
	public void reloadSlider(ServletContext application){
		try {
			slist = ss.getSliderList();
			application.setAttribute("sliders", slist);
			logger.info("已加载轮播内容:"+slist.size());
		} catch (Exception e) {
			logger.error("加载轮播内容时出错");
		}	
	}
	
	/**
	 * 刷新企业介绍内容
	 * @param application
	 */
	public void reloadIntroduce(ServletContext application){
		try {
			blist = ss.getBussinessList();
			application.setAttribute("bussinesses", blist);
			logger.info("已加载企业介绍:"+blist.size());
		} catch (Exception e) {
			logger.error("加载企业介绍时出错");
		}
	}
	
	/**
	 * 刷新项目内容
	 * @param application
	 */
	public void reloadProjects(ServletContext application){
		try {
			plist = ss.getProjectVOList();
			for(ProjectVO vo : plist){
				System.out.println(vo.getPimg());
			}
			application.setAttribute("projects", plist);
			logger.info("已加载项目列表:"+plist.size());
		} catch (Exception e) {
			logger.error("加载项目列表时出错");
		}	
	}
	
	/**
	 * 刷新公司名称
	 * @param application
	 */
	public void reloadCompanyName(ServletContext application){
		try {
			company = ss.getCompany();
			application.setAttribute("company", company);
			logger.info("已加载基本信息-公司名称:"+company);
		} catch (Exception e) {
			logger.error("加载基本信息-公司名称时出错");
		}
	}
	
	/**
	 * 刷新联系电话
	 * @param application
	 */
	public void reloadTelNumber(ServletContext application){
		try {
			tels = ss.getTelNumber();
			application.setAttribute("tels", tels);
			logger.info("已加载基本信息-电话号码:"+tels.size());
		} catch (Exception e) {
			logger.error("加载基本信息-电话号码时出错");
		}
	}
	
	/**
	 * 刷新公司邮箱
	 * @param application
	 */
	public void reloadEmail(ServletContext application){
		try {
			emails = ss.getEmail();
			application.setAttribute("emails", emails);
			logger.info("已加载基本信息-Email:"+emails.size());
		} catch (Exception e) {
			logger.error("加载基本信息-Email时出错");
		}
	}
	
	/**
	 * 刷新公司地址
	 * @param application
	 */
	public void reloadAdress(ServletContext application){
		try {
			adresses = ss.getAdress();	
			application.setAttribute("adresses", adresses);
			logger.info("已加载基本信息-公司地址:"+adresses.size());
		} catch (Exception e) {
			logger.error("加载基本信息-公司地址时出错");
		}
	}
	
}
