package com.acc.service;

import java.util.List;

import com.acc.pojo.Cart;
import com.acc.pojo.Order;

public interface OrderService {
	//�͡��̲������ж���
	List<Order> GetAll(String user_name);
	//ũ�����¶���״̬
	Integer FUpdateSate(Integer order_id);
	//�͡��̻�ɾ��
	Integer BDeleteOrder(Integer order_id);
	//��Ӷ���
	Integer AddOrder(Order order,String password);
	//ũ���������ж���
	List<Order> FindAll(String user_name);
	//ũ��ɾ��
	Integer FDeleteOrder(Integer order_id);
	//�̿͸��¶���״̬
	Integer BUpdateSate(Integer order_id);
	//��ѯĳ�û����ﳵ��������
	List<Cart> GetCart(String user_name);
	//���ﳵ��������
	Integer SubCount(Integer cart_id);
	//���ﳵ��������
	Integer AddCount(Integer cart_id);
	//�ӹ�����ɾ��
	Integer DelCart(Integer cart_id);
	//�¼��빺�ﳵ
	Integer AddCart(Cart cart);
	
}
