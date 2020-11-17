package com.acc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acc.pojo.Cart;
import com.acc.pojo.Order;
import com.acc.pojo.Supply;
import com.acc.pojo.User;
import com.acc.service.OrderService;
import com.acc.service.UserService;

@Controller
@RequestMapping("order")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;
	
	//客户或商户进入订单
	@RequestMapping("toorder")
	public String ToOrder(Model model,String user_name){
		List<Order> orders = orderService.GetAll(user_name);
		Integer totalpage = orders.size();
		Integer page = 1;
		List<Order> temp = new ArrayList<Order>();
		for(int i = (page - 1) * 15,j=0 ; i <page * 15 && i < totalpage; i++,j++){
			temp.add(j, orders.get(i));
		}
		model.addAttribute("count", totalpage);
		model.addAttribute("items", temp);
		System.out.println(user_name);
		return "Order/border";
	}
	//农户进入订单
	@RequestMapping("goorder")
	public String GoOrder(Model model,String user_name){
		List<Order> orders = orderService.FindAll(user_name);
		Integer totalpage = orders.size();
		Integer page = 1;
		List<Order> temp = new ArrayList<Order>();
		for(int i = (page - 1) * 15,j=0 ; i <page * 15 && i < totalpage; i++,j++){
			temp.add(j, orders.get(i));
		}
		model.addAttribute("count", totalpage);
		model.addAttribute("items", temp);
		return "Order/forder";
	}
	//商户、客户查询按页查询订单
	@RequestMapping("getmore")
	@ResponseBody
	public List<Order> FindBOrder(String user_name, Integer page) {
		List<Order> orders = orderService.GetAll(user_name);
		Integer totalpage = orders.size();
		List<Order> temp = new ArrayList<Order>();
		for (int i = (page - 1) * 15, j = 0; i < page * 15 && i < totalpage; i++, j++) {
			temp.add(j, orders.get(i));
		}
		return temp;
	}
	//农户按页查询订单
	@RequestMapping("findmore")
	@ResponseBody
	public List<Order> FindFOrder(String user_name, Integer page) {
		List<Order> orders = orderService.FindAll(user_name);
		Integer totalpage = orders.size();
		List<Order> temp = new ArrayList<Order>();
		for (int i = (page - 1) * 15, j = 0; i < page * 15 && i < totalpage; i++, j++) {
			temp.add(j, orders.get(i));
		}
		return temp;
	}
	//增加订单
	@RequestMapping("/addorder")
	@ResponseBody
	public Integer AddOrder(Order order,Integer supply_id,String password,HttpSession session){
		System.out.println("增加订单！");		
		System.out.println(order.getOrder_count());
		System.out.println(order.getOrder_total());
		System.out.println(order.getBuser_name());
		System.out.println(order.getFuser_name());
		System.out.println(order.getOrder_address());
		System.out.println(order.getOrder_telphone());
		System.out.println(supply_id+"\n********");
		order.setOrder_date(new Date());
		Supply supply = new Supply();
		supply.setSupply_id(supply_id);
		order.setSupply(supply);
		System.out.println(order.getSupply().getSupply_id());
		order.setOrder_state(-1);
		Integer state = orderService.AddOrder(order,password);
		System.out.println(state);
		User user = userService.findByUsername(order.getBuser_name());
		session.removeAttribute("user");
		session.setAttribute("user", user);
		session.setMaxInactiveInterval(-1);
		return state;
	}
	//客户、商户删除订单
	@RequestMapping("/bdelete")
	@ResponseBody
	public Integer BDeleteOrder(Integer order_id){
		System.out.println("客户、商户删除！");
		Integer state = orderService.BDeleteOrder(order_id);
		return state;
	}
	//农户删除订单
	@RequestMapping("/fdelete")
	@ResponseBody
	public Integer FDeleteOrder(Integer order_id){
		System.out.println("农户删除！");
		Integer state = orderService.FDeleteOrder(order_id);
		return state;
	}
	//农户修改订单
	@RequestMapping("/fupdate")
	@ResponseBody
	public Integer UpdateOrder(Integer order_id){
		Integer state = orderService.FUpdateSate(order_id);
		System.out.println(state);
		return state;
	}
	//商户、客户修改订单
	@RequestMapping("/bupdate")
	@ResponseBody
	public Integer BUpdateOrder(Integer order_id){
		Integer state = orderService.BUpdateSate(order_id);
		System.out.println(state);
		return state;		
	}
	//购物车查询	
	@RequestMapping("/tocart")
	public String ToCart(Model model,String user_name){
		List<Cart> carts = orderService.GetCart(user_name);
		List<Cart> temp = new ArrayList<Cart>();
		Integer pages = carts.size();
		Integer page = 1;
		for(int i = (page - 1) * 9,j=0 ; i <page * 9 && i < carts.size(); i++,j++){
			temp.add(j, carts.get(i));
		}
		System.out.println(pages);
		model.addAttribute("pages", pages);
		model.addAttribute("carts", temp);
		return "Cart";
	}
	
	//购物车减少数量
	@RequestMapping("/subcount")
	@ResponseBody
	public Integer SubCount(Integer cart_id){
		Integer state = orderService.SubCount(cart_id);
		return state;
	}
	//购物车增加数量
	@RequestMapping("/addcount")
	@ResponseBody
	public Integer AddCount(Integer cart_id){
		Integer state = orderService.AddCount(cart_id);
		return state;
	}
	//删除购物车中某一农产品
	@RequestMapping("/delcart")
	@ResponseBody
	public Integer DelCart(Integer cart_id){
		Integer state = orderService.DelCart(cart_id);
		return state;
	}
	//按页显示购物车中的内容
	@RequestMapping("/findbycpage")
	@ResponseBody
	public List<Cart> FindbyCartId(String user_name,Integer page){
		System.out.println(page);
		List<Cart> carts = orderService.GetCart(user_name);
		List<Cart> temp = new ArrayList<Cart>();
		Integer pages = carts.size();
		for(int i = (page - 1) * 9,j=0 ; i <page * 9 && i < carts.size(); i++,j++){
			temp.add(j, carts.get(i));
		}		
		return temp;
	}
	//增加入购物车
	@RequestMapping("/addcart")
	@ResponseBody
	public Integer AddCart(String user_name,Integer supply_id,Integer cart_count){
		Cart cart = new Cart();
		Supply supply = new Supply();
		System.out.println(user_name+supply_id+cart_count);
		cart.setCart_count(cart_count);
		supply.setSupply_id(supply_id);
		cart.setSupply(supply);
		cart.setUser_name(user_name);		
		return orderService.AddCart(cart);
	}
	
}
