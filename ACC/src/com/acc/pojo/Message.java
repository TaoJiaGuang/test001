package com.acc.pojo;

import java.util.Date;

public class Message {
	private Integer msgid;
	private Integer msgserial;
	private String fuser_name;
	private String buser_name;
	private String fhead_image;
	private String bhead_image;
	private String whosend;
	private String message;
	private Date msgdate;
	
	public String getFhead_image() {
		return fhead_image;
	}
	public void setFhead_image(String fhead_image) {
		this.fhead_image = fhead_image;
	}
	public String getBhead_image() {
		return bhead_image;
	}
	public void setBhead_image(String bhead_image) {
		this.bhead_image = bhead_image;
	}
	public Date getMsgdate() {
		return msgdate;
	}
	public void setMsgdate(Date msgdate) {
		this.msgdate = msgdate;
	}
	
	public Integer getMsgid() {
		return msgid;
	}
	public void setMsgid(Integer msgid) {
		this.msgid = msgid;
	}
	public Integer getMsgserial() {
		return msgserial;
	}
	public void setMsgserial(Integer msgserial) {
		this.msgserial = msgserial;
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
	public String getWhosend() {
		return whosend;
	}
	public void setWhosend(String whosend) {
		this.whosend = whosend;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
}
