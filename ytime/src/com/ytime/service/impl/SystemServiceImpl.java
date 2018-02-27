package com.ytime.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytime.mapper.SystemMapper;
import com.ytime.po.Business;
import com.ytime.po.Bussiness;
import com.ytime.po.Slider;
import com.ytime.po.Subinfo;
import com.ytime.service.SystemService;
import com.ytime.vo.ProjectVO;

@Service
public class SystemServiceImpl implements SystemService {
	
	@Autowired
	private SystemMapper smapper;

	@Override
	public List<Slider> getSliderList() throws Exception {
		return smapper.getSlidersList();
	}

	@Override
	public List<Bussiness> getBussinessList() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getBussinessList();
	}

	@Override
	public List<ProjectVO> getProjectVOList() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getProjectVOList();
	}

	@Override
	public List<String> getAdress() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getAdress();
	}

	@Override
	public String getCompany() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getCompany();
	}

	@Override
	public List<String> getTelNumber() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getTelNumber();
	}

	@Override
	public List<String> getEmail() throws Exception {
		// TODO Auto-generated method stub
		return smapper.getEmail();
	}

	@Override
	public void insertSubmit(Subinfo s) throws Exception {
		// TODO Auto-generated method stub
		smapper.insertSubmit(s);
		return;
	}

}
