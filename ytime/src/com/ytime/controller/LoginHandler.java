package com.ytime.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ytime.vo.LoginVO;
import com.ytime.vo.UserinfoVO;
import com.ytime.po.Userinfo;
import com.ytime.service.LoginService;
import com.ytime.util.CommonUtil;
import com.ytime.util.CommonValues;

@Controller
public class LoginHandler {
	
	@Autowired
	private LoginService ls;
	
	@RequestMapping(value="/login", method={RequestMethod.POST, RequestMethod.GET})
	public String login(LoginVO vo, HttpSession session) throws Exception{
		if(vo == null){
			return "redirect:/login.jsp";
		}
		vo.setLoginpass(CommonUtil.MD5(vo.getLoginpass()));
		Userinfo u = ls.selectUser(vo);
		if(u != null && u.getUserid() > 0){
			session.setAttribute(CommonValues.USER_SESSION_NAME, u);
			return "redirect:/handle/system/main.jsp";
		}else{
			return "redirect:/login.jsp?su=1";
		}
	}
	
	@RequestMapping(value="/handle/logoff", method={RequestMethod.POST, RequestMethod.GET})
	public String logoff(HttpSession session) throws Exception{
		session.removeAttribute(CommonValues.USER_SESSION_NAME);
		return "redirect:/login.jsp";
	}
	
	@RequestMapping(value="/handle/editMyInfo", method={RequestMethod.POST, RequestMethod.GET})
	public String entryModifyInfo(UserinfoVO vo, HttpSession session) throws Exception{
		if(vo == null){
			return "redirect:/handle/system/modifyMyinfo.jsp?code=1";
		}
		ls.updateMyInfo(vo);
		Userinfo u = (Userinfo) session.getAttribute(CommonValues.USER_SESSION_NAME);
		u.setEmail(vo.getEmail());
		u.setUsername(vo.getUsername());
		session.setAttribute(CommonValues.USER_SESSION_NAME, u);
		return "redirect:/handle/system/modifyMyinfo.jsp?code=2";
	}
	
	@RequestMapping(value="/handle/changePassword", method={RequestMethod.POST, RequestMethod.GET})
	public String changePassword(String opass, String loginpass, HttpSession session) throws Exception{
		if(opass == null || loginpass == null){
			return "redirect:/handle/system/changePassword.jsp?code=1";
		}
		Userinfo u = (Userinfo) session.getAttribute(CommonValues.USER_SESSION_NAME);
		String o = CommonUtil.MD5(opass);
		if(!o.equals(u.getLoginpass())){
			return "redirect:/handle/system/changePassword.jsp?code=2";
		}else{
			ls.updatePassword(CommonUtil.MD5(loginpass), u.getUserid());
			return "redirect:/login.jsp?su=2";
		}
		
		
	}

}
