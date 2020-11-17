package com.acc.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.OrderDao;
import com.acc.dao.SupplyDao;
import com.acc.dao.UserDao;
import com.acc.pojo.Cart;
import com.acc.pojo.Order;
import com.acc.pojo.User;
import com.acc.service.OrderService;
@Service("OrderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private UserDao userDao;
	//�̿Ͳ��Ҷ���
	@Override
	public List<Order> GetAll(String user_name) {
		// TODO Auto-generated method stub
		return orderDao.GetAll(user_name);
	}
	//ũ���޸Ķ���
	@Override
	public Integer FUpdateSate(Integer order_id) {
		// TODO Auto-generated method stub
		return orderDao.FUpdateState(order_id);
	}
	//�̿�ɾ������
	@Override
	public Integer BDeleteOrder(Integer order_id) {
		// TODO Auto-generated method stub
		return orderDao.BDeleteOrder(order_id);
	}
	//���Ӷ���
	@Override
	public Integer AddOrder(Order order,String password) {
		// TODO Auto-generated method stub
		User temp1 = new User();
		temp1.setUser_name(order.getBuser_name());
		temp1.setPassword(password);
		temp1.setUser_name(order.getBuser_name());
		temp1.setPassword(password);
		User temp2 = new User();
		temp2.setUser_name(order.getFuser_name());
		Integer state = 0;
		User user = userDao.GetUser(temp1);
		if(user == null){
			state = -2;
		}else{
			if(user.getCharge()< order.getOrder_total())
			{
				state = -1;
			}else{
				//�۳����
				temp1.setCharge(order.getOrder_total());
				temp2.setCharge(order.getOrder_total());
				Integer cstate = userDao.SubCharge(temp1);				
				if(cstate >= 1){
					//���ٿ��
					Integer stemp = orderDao.SubSurplus(order);	
					//ũ������
					Integer ftemp = userDao.AddCharge(temp2);
					//���Ӷ���
					Integer astate = orderDao.AddOrder(order);
					if(stemp >= 1 && astate >= 1 && ftemp >= 1)
						state =  1;
					else
						state =  0;
				}				
			}			
		}	
		return state;		
	}
	//ũ�����Ҷ���
	@Override
	public List<Order> FindAll(String user_name) {
		// TODO Auto-generated method stub
		return orderDao.FindAll(user_name);
	}
	//ũ��ɾ��
	@Override
	public Integer FDeleteOrder(Integer order_id) {
		// TODO Auto-generated method stub
		return orderDao.FDeleteOrder(order_id);
	}
	//�̿͸��¶���״̬
	@Override
	public Integer BUpdateSate(Integer order_id) {
		// TODO Auto-generated method stub
		return orderDao.BUpdateState(order_id);
	}
	//���û����ҹ��ﳵ��������
	@Override
	public List<Cart> GetCart(String user_name) {
		// TODO Auto-generated method stub
		return orderDao.GetCart(user_name);
	}
	//���ﳵ��������
	@Override
	public Integer SubCount(Integer cart_id) {
		// TODO Auto-generated method stub
		return orderDao.SubCount(cart_id);
	}
	//���ﳵ��������
	@Override
	public Integer AddCount(Integer cart_id) {
		// TODO Auto-generated method stub
		return orderDao.AddCount(cart_id);
	}
	//�ӹ��ﳵ��ɾ��
	@Override
	public Integer DelCart(Integer cart_id) {
		// TODO Auto-generated method stub
		Integer state =  orderDao.DelCart(cart_id);
		if(state > 0){
			Cart cart = orderDao.FindByCid(cart_id);
			if(cart == null){
				state = 1;
			}else{
				state = 0;
			}
		}
		return state;
	}
	//�¼��빺�ﳵ
	@Override
	public Integer AddCart(Cart cart) {
		// TODO Auto-generated method stub
		return orderDao.AddCart(cart);
	}

	
	
}
