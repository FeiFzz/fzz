package com.ytime.service;

import java.util.List;

import com.ytime.po.Userinfo;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface UserinfoService {
	
	public List<Userinfo> selectUserList(UserSearchVO vo) throws Exception;
	
	public int selectUserCount(UserSearchVO vo) throws Exception;
	
	public boolean findLoginname(String loginname) throws Exception;
	
	public Userinfo selectUserByID(int userid) throws Exception;
	
	public void insertUser(UserinfoVO vo) throws Exception;

	public void updateUserFlag(int userid, int uflag) throws Exception;
	
	public void updatePassword(int userid) throws Exception;
	
	public void updateUser(UserinfoVO vo) throws Exception;

}
