package com.ytime.mapper;

import java.util.List;
import java.util.Map;

import com.ytime.po.Userinfo;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface UserMapper {
	
	public List<Userinfo> selectUserList(UserSearchVO vo) throws Exception;
	
	public int selectUserCount(UserSearchVO vo) throws Exception;
	
	public int findLoginname(String loginname) throws Exception;
	
	public void insertUser(UserinfoVO vo) throws Exception;
	
	public void updateUserFlag(Map<String, Integer> param) throws Exception;
	
	public void updatePassword(Map<String, Object> param) throws Exception;
	
	public Userinfo selectUserByID(int userid) throws Exception;
	
	public void updateUser(UserinfoVO vo) throws Exception;

}
