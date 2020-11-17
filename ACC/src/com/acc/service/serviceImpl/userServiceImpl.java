package com.acc.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.acc.dao.UserDao;
import com.acc.pojo.Message;
import com.acc.pojo.User;
import com.acc.service.UserService;

@Service("userService")
@Transactional
public class userServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;
	@Override
	public User findByUsername(String username) {
		// TODO Auto-generated method stub
		return userDao.findByUsername(username);
	}
	@Override
	public Integer AddUser(User user) {
		// TODO Auto-generated method stub
		return userDao.AddUser(user);
	}
	@Override
	public User GetUser(User user) {
		// TODO Auto-generated method stub
		return userDao.GetUser(user);
	}
	@Override
	public Integer Update(User user) {
		// TODO Auto-generated method stub
		return userDao.Update(user);
	}
	//���������¼
	@Override
	public List<Message> GetMsg(Message msg) {
		// TODO Auto-generated method stub
		return userDao.GetMsg(msg);
	}
	//��ȡͷ��
	@Override
	public String GetUserHead(String user_name) {
		// TODO Auto-generated method stub
		return userDao.GetUserHead(user_name);
	}
	//������� ��¼
	@Override
	public Integer AddMessage(Message msg) {
		// TODO Auto-generated method stub
		return userDao.AddMessage(msg);
	}
	//ũ�����һظ��б�
	@Override
	public List<Message> FGetMsgs(String user_name) {
		// TODO Auto-generated method stub
		return userDao.FGetMsgs(user_name);
	}
	//���̲��һظ��б�
	@Override
	public List<Message> BGetMsgs(String buser_name) {
		// TODO Auto-generated method stub
		return userDao.BGetMsgs(buser_name);
	}
	@Override
	public Integer DelUser(Integer user_id) {
		// TODO Auto-generated method stub
		Integer state1 = userDao.DelUser(user_id);
		User state2 = userDao.findByUid(user_id);
		Integer state = 0;
			if(state1 >= 1&& state2 == null ){
				state = 1;
			}else{
				state = 0;
			}
		return state;
	}
}
