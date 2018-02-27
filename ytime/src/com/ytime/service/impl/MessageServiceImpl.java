package com.ytime.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ytime.mapper.MessageMapper;
import com.ytime.po.Subinfo;
import com.ytime.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	private MessageMapper mm;


	public List<Subinfo> selectMessageList() throws Exception {
		return mm.selectMessageList();
	}

}
