package com.ytime.mapper;

import java.util.List;
import java.util.Map;

import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

public interface ProjectsMapper {
	
	public List<Projects> selectProjectsList(ProjectVO vo) throws Exception;
	
	public int selectProjectCount(ProjectVO vo) throws Exception;
//	
//	public int findLoginname(String loginname) throws Exception;
//	
	public void insertProject(ProjectVO vo) throws Exception;
//	
//	public void updateUserFlag(Map<String, Integer> param) throws Exception;
//	
//	public void updatePassword(Map<String, Object> param) throws Exception;
//	
	public Projects selectProjectByID(int projid) throws Exception;
//	
//	public void updateUser(UserinfoVO vo) throws Exception;

}
