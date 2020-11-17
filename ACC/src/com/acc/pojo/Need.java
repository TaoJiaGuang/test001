package com.acc.pojo;

import java.util.Date;

public class Need {
	private Integer need_id;
	private String need_name;
	private Date need_date;
	private String need_price;
	private String need_address;
	private String need_type;
	private String need_content;
	private boolean need_coor;
	private String need_image;
	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public Integer getNeed_id() {
		return need_id;
	}
	public void setNeed_id(Integer need_id) {
		this.need_id = need_id;
	}
	public String getNeed_name() {
		return need_name;
	}
	public void setNeed_name(String need_name) {
		this.need_name = need_name;
	}
	public Date getNeed_date() {
		return need_date;
	}
	public void setNeed_date(Date need_date) {
		this.need_date = need_date;
	}
	public String getNeed_price() {
		return need_price;
	}
	public void setNeed_price(String need_price) {
		this.need_price = need_price;
	}
	public String getNeed_address() {
		return need_address;
	}
	public void setNeed_address(String need_address) {
		this.need_address = need_address;
	}
	public String getNeed_type() {
		return need_type;
	}
	public void setNeed_type(String need_type) {
		this.need_type = need_type;
	}
	public String getNeed_content() {
		return need_content;
	}
	public void setNeed_content(String need_content) {
		this.need_content = need_content;
	}
	public boolean isNeed_coor() {
		return need_coor;
	}
	public void setNeed_coor(boolean need_coor) {
		this.need_coor = need_coor;
	}
	public String getNeed_image() {
		return need_image;
	}
	public void setNeed_image(String need_image) {
		this.need_image = need_image;
	}
	
	
}
