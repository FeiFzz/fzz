package com.ytime.service;

import java.util.List;

import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface ProjectsService {
	
	public List<Projects> selectProjectList(ProjectVO vo) throws Exception;
	
	public int selectProjectCount(ProjectVO vo) throws Exception;
//	
//	public boolean findLoginname(String loginname) throws Exception;
//	
	public Projects selectProjectByID(int projid) throws Exception;
//	
	public void insertUser(ProjectVO vo) throws Exception;
//
//	public void updateUserFlag(int userid, int uflag) throws Exception;
//	
//	public void updatePassword(int userid) throws Exception;
//	
//	public void updateUser(UserinfoVO vo) throws Exception;

}
