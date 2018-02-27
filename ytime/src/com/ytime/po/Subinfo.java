package com.ytime.po;

import java.sql.Timestamp;

public class Subinfo {
	
	private int subid;
	
	private String sname;
	
	private String email;
	
	private String ssubject;
	
	private String sdesc;
	
	private Timestamp ctime;
	
	private int sflag;

	public int getSubid() {
		return subid;
	}

	public void setSubid(int subid) {
		this.subid = subid;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSsubject() {
		return ssubject;
	}

	public void setSsubject(String ssubject) {
		this.ssubject = ssubject;
	}

	public String getSdesc() {
		return sdesc;
	}

	public void setSdesc(String sdesc) {
		this.sdesc = sdesc;
	}

	public int getSflag() {
		return sflag;
	}

	public void setSflag(int sflag) {
		this.sflag = sflag;
	}

	public Timestamp getCtime() {
		return ctime;
	}

	public void setCtime(Timestamp ctime) {
		this.ctime = ctime;
	}
	
	

}
