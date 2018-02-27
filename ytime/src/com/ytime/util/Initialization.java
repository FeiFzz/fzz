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
 * ������Ҫ��ɷ���������ʱ���̵�һЩ��ʼ������
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
	 * ��ʼ����������
	 * @param application
	 */
	public void initContent(ServletContext application){
		reloadSlider(application);
		reloadIntroduce(application);
		reloadProjects(application);		
	}
	
	/**
	 * ��ʼ�����������Ϣ
	 * @param application
	 */
	public void initBase(ServletContext application){
		reloadCompanyName(application);
		reloadTelNumber(application);
		reloadEmail(application);
		//reloadAdress(application);	
	}
	
	/**
	 * ˢ���ֲ�����
	 * @param application
	 */
	public void reloadSlider(ServletContext application){
		try {
			slist = ss.getSliderList();
			application.setAttribute("sliders", slist);
			logger.info("�Ѽ����ֲ�����:"+slist.size());
		} catch (Exception e) {
			logger.error("�����ֲ�����ʱ����");
		}	
	}
	
	/**
	 * ˢ����ҵ��������
	 * @param application
	 */
	public void reloadIntroduce(ServletContext application){
		try {
			blist = ss.getBussinessList();
			application.setAttribute("bussinesses", blist);
			logger.info("�Ѽ�����ҵ����:"+blist.size());
		} catch (Exception e) {
			logger.error("������ҵ����ʱ����");
		}
	}
	
	/**
	 * ˢ����Ŀ����
	 * @param application
	 */
	public void reloadProjects(ServletContext application){
		try {
			plist = ss.getProjectVOList();
			for(ProjectVO vo : plist){
				System.out.println(vo.getPimg());
			}
			application.setAttribute("projects", plist);
			logger.info("�Ѽ�����Ŀ�б�:"+plist.size());
		} catch (Exception e) {
			logger.error("������Ŀ�б�ʱ����");
		}	
	}
	
	/**
	 * ˢ�¹�˾����
	 * @param application
	 */
	public void reloadCompanyName(ServletContext application){
		try {
			company = ss.getCompany();
			application.setAttribute("company", company);
			logger.info("�Ѽ��ػ�����Ϣ-��˾����:"+company);
		} catch (Exception e) {
			logger.error("���ػ�����Ϣ-��˾����ʱ����");
		}
	}
	
	/**
	 * ˢ����ϵ�绰
	 * @param application
	 */
	public void reloadTelNumber(ServletContext application){
		try {
			tels = ss.getTelNumber();
			application.setAttribute("tels", tels);
			logger.info("�Ѽ��ػ�����Ϣ-�绰����:"+tels.size());
		} catch (Exception e) {
			logger.error("���ػ�����Ϣ-�绰����ʱ����");
		}
	}
	
	/**
	 * ˢ�¹�˾����
	 * @param application
	 */
	public void reloadEmail(ServletContext application){
		try {
			emails = ss.getEmail();
			application.setAttribute("emails", emails);
			logger.info("�Ѽ��ػ�����Ϣ-Email:"+emails.size());
		} catch (Exception e) {
			logger.error("���ػ�����Ϣ-Emailʱ����");
		}
	}
	
	/**
	 * ˢ�¹�˾��ַ
	 * @param application
	 */
	public void reloadAdress(ServletContext application){
		try {
			adresses = ss.getAdress();	
			application.setAttribute("adresses", adresses);
			logger.info("�Ѽ��ػ�����Ϣ-��˾��ַ:"+adresses.size());
		} catch (Exception e) {
			logger.error("���ػ�����Ϣ-��˾��ַʱ����");
		}
	}
	
}
