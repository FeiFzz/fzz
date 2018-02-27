package com.ytime.mapper;

import java.util.Map;

import com.ytime.po.Userinfo;
import com.ytime.vo.UserinfoVO;

public interface LoginMapper {
	
	public Userinfo selectUser(Userinfo u) throws Exception;
	
	public void updateMyInfo(UserinfoVO vo) throws Exception;
	
	public void updatePassword(Map<String, Object> param) throws Exception;

}
