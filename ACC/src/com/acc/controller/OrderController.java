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
	
	//�ͻ����̻����붩��
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
	//ũ�����붩��
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
	//�̻����ͻ���ѯ��ҳ��ѯ����
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
	//ũ����ҳ��ѯ����
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
	//���Ӷ���
	@RequestMapping("/addorder")
	@ResponseBody
	public Integer AddOrder(Order order,Integer supply_id,String password,HttpSession session){
		System.out.println("���Ӷ�����");		
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
	//�ͻ����̻�ɾ������
	@RequestMapping("/bdelete")
	@ResponseBody
	public Integer BDeleteOrder(Integer order_id){
		System.out.println("�ͻ����̻�ɾ����");
		Integer state = orderService.BDeleteOrder(order_id);
		return state;
	}
	//ũ��ɾ������
	@RequestMapping("/fdelete")
	@ResponseBody
	public Integer FDeleteOrder(Integer order_id){
		System.out.println("ũ��ɾ����");
		Integer state = orderService.FDeleteOrder(order_id);
		return state;
	}
	//ũ���޸Ķ���
	@RequestMapping("/fupdate")
	@ResponseBody
	public Integer UpdateOrder(Integer order_id){
		Integer state = orderService.FUpdateSate(order_id);
		System.out.println(state);
		return state;
	}
	//�̻����ͻ��޸Ķ���
	@RequestMapping("/bupdate")
	@ResponseBody
	public Integer BUpdateOrder(Integer order_id){
		Integer state = orderService.BUpdateSate(order_id);
		System.out.println(state);
		return state;		
	}
	//���ﳵ��ѯ	
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
	
	//���ﳵ��������
	@RequestMapping("/subcount")
	@ResponseBody
	public Integer SubCount(Integer cart_id){
		Integer state = orderService.SubCount(cart_id);
		return state;
	}
	//���ﳵ��������
	@RequestMapping("/addcount")
	@ResponseBody
	public Integer AddCount(Integer cart_id){
		Integer state = orderService.AddCount(cart_id);
		return state;
	}
	//ɾ�����ﳵ��ĳһũ��Ʒ
	@RequestMapping("/delcart")
	@ResponseBody
	public Integer DelCart(Integer cart_id){
		Integer state = orderService.DelCart(cart_id);
		return state;
	}
	//��ҳ��ʾ���ﳵ�е�����
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
	//�����빺�ﳵ
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
