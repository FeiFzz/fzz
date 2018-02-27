package com.ytime.vo;

import com.ytime.util.PageUtil;

public class UserSearchVO {
	
	private String username;
	
	private String loginname;
	
	private String email;
	
	private int power;
	
	private int uflag;
	
	private int pagenum;
	
	private int itemIndex;
	
	private final int pageItems = PageUtil.PAGE_ITEM_COUNT;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPower() {
		return power;
	}

	public void setPower(int power) {
		this.power = power;
	}

	public int getUflag() {
		return uflag;
	}

	public void setUflag(int uflag) {
		this.uflag = uflag;
	}

	public int getPagenum() {
		return pagenum;
	}

	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
		this.itemIndex = (pagenum - 1) * pageItems;
	}

	public int getItemIndex() {
		return itemIndex;
	}

	public int getPageItems() {
		return pageItems;
	}

}
