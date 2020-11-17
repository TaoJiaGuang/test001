package com.acc.dao;

import java.util.List;

import com.acc.pojo.Cart;
import com.acc.pojo.Order;

public interface OrderDao {

	List<Order> GetAll();

	List<Order> GetAll(String user_name);

	Integer FUpdateState(Integer order_id);

	Integer BDeleteOrder(Integer order_id);
	
	Order FindbyId(Integer order_id);

	Integer AddOrder(Order order);

	List<Order> FindAll(String user_name);

	Integer FDeleteOrder(Integer order_id);

	Integer BUpdateState(Integer order_id);

	List<Cart> GetCart(String user_name);

	Integer SubCount(Integer cart_id);

	Integer AddCount(Integer cart_id);

	Integer DelCart(Integer cart_id);
	
	Cart FindByCid(Integer cart_id);

	Integer AddCart(Cart cart);
	//购买后减少库存并增加销量
	Integer SubSurplus(Order order);
	
}
