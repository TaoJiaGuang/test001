package com.acc.service;

import java.util.List;

import com.acc.pojo.Message;
import com.acc.pojo.User;

public interface UserService {

	User findByUsername(String username);

	Integer AddUser(User user);

	User GetUser(User user);

	Integer Update(User user);
	//���������¼
	List<Message> GetMsg(Message msg);
	//��ȡͷ��
	String GetUserHead(String user_name);
	//��������¼
	Integer AddMessage(Message msg);
	//ũ�����һظ��б�
	List<Message> FGetMsgs(String user_name);
	//���̲��һظ��б�
	List<Message> BGetMsgs(String buser_name);

	Integer DelUser(Integer user_id);
}
