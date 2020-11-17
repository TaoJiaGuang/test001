package com.acc.service;

import java.util.List;

import com.acc.pojo.Cart;
import com.acc.pojo.Order;

public interface OrderService {
	//客、商查找所有订单
	List<Order> GetAll(String user_name);
	//农户更新订单状态
	Integer FUpdateSate(Integer order_id);
	//客、商户删除
	Integer BDeleteOrder(Integer order_id);
	//添加订单
	Integer AddOrder(Order order,String password);
	//农户查找所有订单
	List<Order> FindAll(String user_name);
	//农户删除
	Integer FDeleteOrder(Integer order_id);
	//商客更新订单状态
	Integer BUpdateSate(Integer order_id);
	//查询某用户购物车所有内容
	List<Cart> GetCart(String user_name);
	//购物车减少数量
	Integer SubCount(Integer cart_id);
	//购物车增加数量
	Integer AddCount(Integer cart_id);
	//从购物中删除
	Integer DelCart(Integer cart_id);
	//新加入购物车
	Integer AddCart(Cart cart);
	
}
