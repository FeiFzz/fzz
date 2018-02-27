package com.ytime.service;

import com.ytime.po.Userinfo;
import com.ytime.vo.LoginVO;
import com.ytime.vo.UserinfoVO;

public interface LoginService {
	
	public Userinfo selectUser(LoginVO vo) throws Exception;
	
	public void updateMyInfo(UserinfoVO vo) throws Exception;
	
	public void updatePassword(String newpass, int userid) throws Exception;
}
