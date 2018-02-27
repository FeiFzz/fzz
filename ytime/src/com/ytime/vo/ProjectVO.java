package com.ytime.vo;



public class ProjectVO {
	
	private int projid;
	
	private String pname;
	
	private int pyear;
	
	private int pcustomer;
	
	private String pimg;
	
	private String pdesc;
	
	private int pflag;
	
	private int porder;
	
	private String cname;
	
	private String curl;

	public int getProjid() {
		return projid;
	}

	public void setProjid(int projid) {
		this.projid = projid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPyear() {
		return pyear;
	}

	public void setPyear(int pyear) {
		this.pyear = pyear;
	}
	
	public int getPcustomer() {
		return pcustomer;
	}

	public void setPcustomer(int pcustomer) {
		this.pcustomer = pcustomer;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCurl() {
		return curl;
	}

	public void setCurl(String curl) {
		this.curl = curl;
	}

	public String getPimg() {
		return pimg;
	}

	public void setPimg(String pimg) {
		this.pimg = pimg;
	}

	public String getPdesc() {
		return pdesc;
	}

	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}

	public int getPflag() {
		return pflag;
	}

	public void setPflag(int pflag) {
		this.pflag = pflag;
	}

	public int getPorder() {
		return porder;
	}

	public void setPorder(int porder) {
		this.porder = porder;
	}

	@Override
	public String toString() {
		return "ProjectVO [cname=" + cname + ", curl=" + curl + ", pimg="
				+ pimg + ", pname=" + pname + ", projid=" + projid + ", pyear="
				+ pyear + "]";
	}

}
