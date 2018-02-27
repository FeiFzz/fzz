package com.ytime.controller;

import java.sql.Timestamp;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ytime.po.Subinfo;
import com.ytime.service.SystemService;

@Controller
public class SubmitHandler {
	
	@Autowired
	private SystemService ss;
	
	private boolean validateSubInfo(Subinfo s){
		if(s == null){
			return false;
		}
		if(s.getSname() == null || s.getSname().isEmpty()){
			return false;
		}
		if(s.getEmail() == null || s.getEmail().isEmpty()){
			return false;
		}
		if(s.getSsubject() == null || s.getSsubject().isEmpty()){
			return false;
		}
		if(s.getSdesc() == null || s.getSdesc().isEmpty()){
			return false;
		}
		return true;
	}
	
	@RequestMapping(value="/subinfo", method={RequestMethod.POST})
	public @ResponseBody boolean subInfo(Subinfo s) throws Exception{
		if(validateSubInfo(s)){
			s.setCtime(new Timestamp(Calendar.getInstance().getTimeInMillis()));
			ss.insertSubmit(s);
			return true;
		}
		return false;
	}
	

}
