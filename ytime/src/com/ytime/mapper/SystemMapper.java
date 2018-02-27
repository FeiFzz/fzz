package com.ytime.mapper;

import java.util.List;

import com.ytime.po.Business;
import com.ytime.po.Bussiness;
import com.ytime.po.Slider;
import com.ytime.po.Subinfo;
import com.ytime.vo.ProjectVO;

public interface SystemMapper {
	
	public List<Slider> getSlidersList() throws Exception;
	
	public List<Bussiness> getBussinessList() throws Exception;
	
	public List<ProjectVO> getProjectVOList() throws Exception;
	
	public List<String> getTelNumber() throws Exception;
	
	public List<String> getAdress() throws Exception;
	
	public List<String> getEmail() throws Exception;
	
	public String getCompany() throws Exception;
	
	public void insertSubmit(Subinfo s)  throws Exception;

}
