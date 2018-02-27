package com.ytime.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytime.mapper.ProjectsMapper;
import com.ytime.mapper.UserMapper;
import com.ytime.po.Projects;
import com.ytime.po.Userinfo;
import com.ytime.service.ProjectsService;
import com.ytime.service.UserinfoService;
import com.ytime.util.CommonUtil;
import com.ytime.util.CommonValues;
import com.ytime.vo.ProjectVO;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

@Service
public class ProjectsServiceImpl implements ProjectsService {
	
	@Autowired
	private ProjectsMapper pm;

	@Override
	public List<Projects> selectProjectList(ProjectVO vo) throws Exception {
		// TODO Auto-generated method stub
		return pm.selectProjectsList(vo);
	}

	public int selectProjectCount(ProjectVO vo) throws Exception {
		return pm.selectProjectCount(vo);
	}
//
	public void insertUser(ProjectVO vo) throws Exception {
		pm.insertProject(vo);
		return;
	}
//
//	public boolean findLoginname(String loginname) throws Exception {
//		int count = um.findLoginname(loginname);
//		return count <= 0;
//	}
//
//	public void updateUserFlag(int userid, int uflag) throws Exception {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("userid", userid);
//		map.put("uflag", uflag);
//		um.updateUserFlag(map);
//		return;
//	}
//
//	public void updatePassword(int userid) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("userid", userid);
//		map.put("password", CommonUtil.MD5(CommonValues.DEFAULT_PASSWORD));
//		um.updatePassword(map);
//		return;
//	}
//
	public Projects selectProjectByID(int projid) throws Exception {
		return pm.selectProjectByID(projid);
	}
//
//	public void updateUser(UserinfoVO vo) throws Exception {
//		um.updateUser(vo);
//		return;
//	}

}
