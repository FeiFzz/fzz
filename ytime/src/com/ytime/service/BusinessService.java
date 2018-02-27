package com.ytime.service;

import java.util.List;

import com.ytime.po.Business;
import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.vo.BusinessVO;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface BusinessService {
	
	public List<Business> selectBusinessList(BusinessVO vo) throws Exception;
	
	public int selectBusinessCount(BusinessVO vo) throws Exception;
//	
//	public boolean findLoginname(String loginname) throws Exception;
//	
	public Business selectBusinessByID(int busid) throws Exception;
//	
//	public void insertUser(UserinfoVO vo) throws Exception;
//
//	public void updateUserFlag(int userid, int uflag) throws Exception;
//	
//	public void updatePassword(int userid) throws Exception;
//	
//	public void updateUser(UserinfoVO vo) throws Exception;

}
