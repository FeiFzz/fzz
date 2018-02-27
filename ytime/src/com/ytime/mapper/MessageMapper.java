package com.ytime.mapper;

import java.util.List;

import com.ytime.po.Subinfo;

public interface MessageMapper {
	
	public List<Subinfo> selectMessageList() throws Exception;

}
