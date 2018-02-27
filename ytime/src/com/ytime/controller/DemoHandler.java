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
	 * 上传文件要点
	 * 1.页面表单的提交方式是post
	 * 2.页面表单的enctype="multipart/form-data"
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/uploadDemo", method={RequestMethod.POST})
	public String uploadDemo(HttpServletRequest request, String text1) throws Exception{
		//接收文本框的值
		System.out.println(text1);
		
		//处理文件域后，得到已上传的新文件名,此处将上传文件保存在tomcat工程中images文件下的haha子目录中
		List<String> flist = CommonUtil.getUploadFiles(request,"haha");
		//遍历文件名，将文件名一并保存在数据库中,此处代码略
		for(String fname : flist){
			System.out.println(fname);
		}
		return "redirect:/handle/system/demo.jsp?code=2";
	}

}
