package com.ytime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ytime.util.CommonUtil;

@Controller
public class DemoHandler {
	
	/**
	 * �ϴ��ļ�Ҫ��
	 * 1.ҳ������ύ��ʽ��post
	 * 2.ҳ�����enctype="multipart/form-data"
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadDemo", method={RequestMethod.POST})
	public String uploadDemo(HttpServletRequest request, String text1) throws Exception{
		//�����ı����ֵ
		System.out.println(text1);
		
		//�����ļ���󣬵õ����ϴ������ļ���,�˴����ϴ��ļ�������tomcat������images�ļ��µ�haha��Ŀ¼��
		List<String> flist = CommonUtil.getUploadFiles(request,"haha");
		//�����ļ��������ļ���һ�����������ݿ���,�˴�������
		for(String fname : flist){
			System.out.println(fname);
		}
		return "redirect:/handle/system/demo.jsp?code=2";
	}

}
