package com.ytime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ytime.po.Business;
import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.service.BusinessService;
import com.ytime.service.ProjectsService;
import com.ytime.service.UserinfoService;
import com.ytime.util.CommonUtil;
import com.ytime.util.PageUtil;
import com.ytime.vo.BusinessVO;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

@Controller
public class BusinessHandler {
	
	@Autowired
	private BusinessService bs;
	
	@RequestMapping(value="/handle/business/getBusinesslist", method={RequestMethod.POST,RequestMethod.GET})
	public String getBusinessList(Integer pnum, HttpServletRequest request, BusinessVO vo) throws Exception{
		System.out.println("123123");
		pnum = (pnum == null) ? 1 : pnum;
////		
		List<Business> blist = bs.selectBusinessList(vo);
		int total = bs.selectBusinessCount(vo);
		int mpage = PageUtil.getMaxPageNumber(total);
////		
		request.setAttribute("blist", blist);
		request.setAttribute("ucount", total);
		request.setAttribute("mpage", mpage);
		request.setAttribute("pnum", pnum);
		request.setAttribute("vo", vo);
		for(Business l : blist){
			System.out.println(l.getBname());
		}
		return "forward:/handle/business/businesslist.jsp";
	}
	
//	@RequestMapping(value="/handle/user/addUser", method={RequestMethod.POST,RequestMethod.GET})
//	public String addNewUser(UserinfoVO vo, HttpServletRequest request) throws Exception{
//		if(vo == null){
//			return "redirect:/handle/user/adduser.jsp?code=1";
//		}
//		String email = vo.getEmail();
//		email = email == null ? "" : email.trim();
//		vo.setEmail(email);
//		
//		String pass = vo.getLoginpass();
//		vo.setLoginpass(CommonUtil.MD5(pass));
//		us.insertUser(vo);
//		return "redirect:/handle/user/adduser.jsp?code=2";
//	}
//	
	@RequestMapping(value="/handle/business/entryEditBusiness", method={RequestMethod.POST,RequestMethod.GET})
	public String entryEditBusiness(int busid, Integer code, HttpServletRequest request) throws Exception{
		Business b = bs.selectBusinessByID(busid);
		request.setAttribute("editProject", b);
		request.setAttribute("code", code);
		return "forward:/handle/business/editbusiness.jsp";
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
