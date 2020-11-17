package com.acc.pojo;

public class Cart {
	private Integer cart_id;
	private Integer cart_count;
	private Supply supply;	
	private String user_name;
	public Integer getCart_id() {
		return cart_id;
	}
	public void setCart_id(Integer cart_id) {
		this.cart_id = cart_id;
	}
	public Integer getCart_count() {
		return cart_count;
	}
	public void setCart_count(Integer cart_count) {
		this.cart_count = cart_count;
	}
	public Supply getSupply() {
		return supply;
	}
	public void setSupply(Supply supply) {
		this.supply = supply;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
