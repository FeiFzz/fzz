package com.ytime.mapper;

import java.util.List;
import java.util.Map;

import com.ytime.po.Business;
import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.vo.BusinessVO;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface BusinessMapper {
	
	public List<Business> selectBusinessList(BusinessVO vo) throws Exception;
	
	public int selectBusinessCount(BusinessVO vo) throws Exception;
//	
//	public int findLoginname(String loginname) throws Exception;
//	
//	public void insertUser(UserinfoVO vo) throws Exception;
//	
//	public void updateUserFlag(Map<String, Integer> param) throws Exception;
//	
//	public void updatePassword(Map<String, Object> param) throws Exception;
//	
	public Business selectBusinessByID(int busid) throws Exception;
//	
//	public void updateUser(UserinfoVO vo) throws Exception;

}
