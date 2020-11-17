package com.acc.dao;

import java.util.List;

import com.acc.pojo.Message;
import com.acc.pojo.Order;
import com.acc.pojo.User;

public interface UserDao {

	User findByUsername(String username);

	Integer AddUser(User user);

	User GetUser(User user);

	Integer Update(User user);
	//查找聊天记录
	List<Message> GetMsg(Message msg);
	//获取头像
	String GetUserHead(String user_name);
	//添加聊天记录
	Integer AddMessage(Message msg);
	//农户查找回复列表
	List<Message> FGetMsgs(String fuser_name);
	//客商查找回复列表
	List<Message> BGetMsgs(String buser_name);

	Integer DelUser(Integer user_id);

	User findByUid(Integer user_id);
	//扣除金额
	Integer SubCharge(User temp1);
	//农户入账
	Integer AddCharge(User temp2);

}
