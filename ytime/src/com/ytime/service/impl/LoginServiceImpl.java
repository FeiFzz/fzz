package com.ytime.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytime.mapper.LoginMapper;
import com.ytime.po.Userinfo;
import com.ytime.service.LoginService;
import com.ytime.vo.LoginVO;
import com.ytime.vo.UserinfoVO;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	private LoginMapper lm;
	
	public Userinfo selectUser(LoginVO vo)
			throws Exception {
		Userinfo u = new Userinfo();
		u.setLoginname(vo.getLoginname());
		u.setLoginpass(vo.getLoginpass());
		u = lm.selectUser(u);
		return u;
	}

	public void updateMyInfo(UserinfoVO vo) throws Exception {
		lm.updateMyInfo(vo);
		return;
	}

	public void updatePassword(String newpass, int userid) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("newpass", newpass);
		param.put("userid", userid);
		lm.updatePassword(param);
		return;
	}

}
