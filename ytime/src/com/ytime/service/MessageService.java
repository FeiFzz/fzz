package com.ytime.service;

import java.util.List;

import com.ytime.po.Subinfo;

public interface MessageService {
	
	public List<Subinfo> selectMessageList() throws Exception;

}
