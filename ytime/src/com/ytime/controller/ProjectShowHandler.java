package com.ytime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.ytime.po.Projects;
import com.ytime.service.ProjectsService;
import com.ytime.util.CommonUtil;
import com.ytime.util.PageUtil;
import com.ytime.vo.ProjectVO;

@Controller
public class ProjectShowHandler {
	
	@Autowired
	private ProjectsService ps;
	
	@RequestMapping(value="/handle/projects/getProjectlist", method={RequestMethod.POST,RequestMethod.GET})
	public String getProjectList(Integer pnum, HttpServletRequest request, ProjectVO vo) throws Exception{
		System.out.println("123123");
		pnum = (pnum == null) ? 1 : pnum;
//		
		List<Projects> ulist = ps.selectProjectList(vo);
		int total = ps.selectProjectCount(vo);
		int mpage = PageUtil.getMaxPageNumber(total);
//		
		request.setAttribute("ulist", ulist);
		request.setAttribute("ucount", total);
		request.setAttribute("mpage", mpage);
		request.setAttribute("pnum", pnum);
		request.setAttribute("vo", vo);
		for(Projects l : ulist){
			System.out.println(l.getPname());
		}
		return "forward:/handle/projects/projectlist.jsp";
	}
	
	@RequestMapping(value="/handle/projects/addProject", method={RequestMethod.POST,RequestMethod.GET})
	public String addProject(ProjectVO vo, HttpServletRequest request, String text1) throws Exception{
		if(vo == null){
			return "redirect:/handle/projects/addproject.jsp?code=1";
		}
		vo.setPflag(1);
//		System.out.println("wahaha");
//		System.out.println(vo.toString());
//		String email = vo.getEmail();
//		email = email == null ? "" : email.trim();
//		vo.setEmail(email);
//		
//		String pass = vo.getLoginpass();
//		vo.setLoginpass(CommonUtil.MD5(pass));
//		us.insertUser(vo);
		
		//接收文本框的值
		System.out.println(text1);
		
		//处理文件域后，得到已上传的新文件名,此处将上传文件保存在tomcat工程中images文件下的haha子目录中
		List<String> flist = CommonUtil.getUploadFiles(request);
		//遍历文件名，将文件名一并保存在数据库中,此处代码略
		for(String fname : flist){
			System.out.println(fname);
			vo.setPimg(fname);
		}
		ps.insertUser(vo);
		return "redirect:/handle/projects/addproject.jsp?code=2";
	}
//	
	@RequestMapping(value="/handle/project/entryEditProject", method={RequestMethod.POST,RequestMethod.GET})
	public String entryEditUser(int projid, Integer code, HttpServletRequest request) throws Exception{
		Projects u = ps.selectProjectByID(projid);
		request.setAttribute("editProject", u);
		request.setAttribute("code", code);
		return "forward:/handle/projects/editproject.jsp";
	}
//	
//	@RequestMapping(value="/handle/user/editUser", method={RequestMethod.POST,RequestMethod.GET})
//	public String updateEditUser(int userid,UserinfoVO vo) throws Exception{
//		if(vo == null){
//			return "redirect:/handle/user/entryEditUser.action?userid="+userid+"&code=1";
//		}
//		us.updateUser(vo);
//		return "redirect:/handle/user/entryEditUser.action?userid="+userid+"&code=2";
//	}
//
//	@RequestMapping(value="/handle/user/validateLoginname", method={RequestMethod.POST,RequestMethod.GET})
//	public @ResponseBody boolean validateLoginname(String loginname) throws Exception{
//		boolean b = us.findLoginname(loginname);
//		return b;
//	}
//	
//	@RequestMapping(value="/handle/user/resetUserFlag", method={RequestMethod.POST,RequestMethod.GET})
//	public String resetUserFlag(int userid, int uflag) throws Exception{
//		us.updateUserFlag(userid, uflag);
//		return "redirect:/handle/user/getUserList.action";
//	}
//	@RequestMapping(value="/handle/user/resetPassword", method={RequestMethod.POST,RequestMethod.GET})
//	public @ResponseBody boolean resetPassword(int userid) throws Exception{
//		us.updatePassword(userid);
//		return true;
//	}
}
