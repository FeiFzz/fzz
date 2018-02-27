package com.ytime.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytime.mapper.UserMapper;
import com.ytime.po.Userinfo;
import com.ytime.service.UserinfoService;
import com.ytime.util.CommonUtil;
import com.ytime.util.CommonValues;
import com.ytime.vo.UserSearchVO;
import com.ytime.vo.UserinfoVO;

@Service
public class UserinfoServiceImpl implements UserinfoService {
	
	@Autowired
	private UserMapper um;

	public List<Userinfo> selectUserList(UserSearchVO vo) throws Exception {
		return um.selectUserList(vo);
	}

	public int selectUserCount(UserSearchVO vo) throws Exception {
		return um.selectUserCount(vo);
	}

	public void insertUser(UserinfoVO vo) throws Exception {
		um.insertUser(vo);
		return;
	}

	public boolean findLoginname(String loginname) throws Exception {
		int count = um.findLoginname(loginname);
		return count <= 0;
	}

	public void updateUserFlag(int userid, int uflag) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("userid", userid);
		map.put("uflag", uflag);
		um.updateUserFlag(map);
		return;
	}

	public void updatePassword(int userid) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		map.put("password", CommonUtil.MD5(CommonValues.DEFAULT_PASSWORD));
		um.updatePassword(map);
		return;
	}

	public Userinfo selectUserByID(int userid) throws Exception {
		return um.selectUserByID(userid);
	}

	public void updateUser(UserinfoVO vo) throws Exception {
		um.updateUser(vo);
		return;
	}

}
