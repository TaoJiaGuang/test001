package com.acc.pojo;

import java.util.Date;

public class Order {
	private Integer order_id;
	private Date order_date;
	private Integer order_state;
	private Integer order_count;
	private float order_total;
	private String order_telphone;
	private String order_address;
	private String fuser_name; //农户名
	private String buser_name; //商户名或客户名
	private Supply supply;
	private boolean order_fdel;
	private boolean order_bdel;
	private User user;	
	
	public boolean isOrder_fdel() {
		return order_fdel;
	}
	public void setOrder_fdel(boolean order_fdel) {
		this.order_fdel = order_fdel;
	}
	public boolean isOrder_bdel() {
		return order_bdel;
	}
	public void setOrder_bdel(boolean order_bdel) {
		this.order_bdel = order_bdel;
	}
	public String getOrder_telphone() {
		return order_telphone;
	}
	public void setOrder_telphone(String order_telphone) {
		this.order_telphone = order_telphone;
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
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}

	public Integer getOrder_id() {
		return order_id;
	}
	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Integer getOrder_state() {
		return order_state;
	}
	public void setOrder_state(Integer order_state) {
		this.order_state = order_state;
	}
	public Integer getOrder_count() {
		return order_count;
	}
	public void setOrder_count(Integer order_count) {
		this.order_count = order_count;
	}
	public float getOrder_total() {
		return order_total;
	}
	public void setOrder_total(float order_total) {
		this.order_total = order_total;
	}
	public Supply getSupply() {
		return supply;
	}
	public void setSupply(Supply supply) {
		this.supply = supply;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
