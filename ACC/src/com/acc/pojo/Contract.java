package com.acc.pojo;

import java.util.Date;

public class Contract {
	private Integer cid;
	private String fuser_name;
	private String buser_name;
	private Date cdate;
	private Integer ctime;
	private Supply supply;
	private Integer cstate;
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getFuser_name() {
		return fuser_name;
	}
	public void setFuser_name(String fuser_name) {
		this.fuser_name = fuser_name;
	}
	public String getBuser_name() {
		return buser_name;
	}
	public void setBuser_name(String buser_name) {
		this.buser_name = buser_name;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public Integer getCtime() {
		return ctime;
	}
	public void setCtime(Integer ctime) {
		this.ctime = ctime;
	}
	
	public Supply getSupply() {
		return supply;
	}
	public void setSupply(Supply supply) {
		this.supply = supply;
	}
	public Integer getCstate() {
		return cstate;
	}
	public void setCstate(Integer cstate) {
		this.cstate = cstate;
	}
	
}
