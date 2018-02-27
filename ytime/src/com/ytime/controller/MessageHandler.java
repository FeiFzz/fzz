package com.ytime.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ytime.po.Subinfo;
import com.ytime.service.MessageService;

@Controller
public class MessageHandler {
	
	@Autowired
	private MessageService ms;
	
	@RequestMapping(value="/handle/message/entrylist", method={RequestMethod.POST, RequestMethod.GET})
	public String entryMessageList(HttpServletRequest request) throws Exception{
		List<Subinfo> slist = ms.selectMessageList();
		request.setAttribute("slist", slist);
		return "forward:/handle/message/messagelist.jsp";
	}

}















