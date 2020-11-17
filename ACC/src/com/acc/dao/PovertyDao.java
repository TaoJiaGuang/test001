package com.acc.dao;

import java.util.Date;
import java.util.List;

import com.acc.pojo.Contract;
import com.acc.pojo.Policy;

public interface PovertyDao {
	//ũ����ȡ��ͬ
	List<Contract> GetAllFC(String user_name);
	//���̻�ȡ��ͬ
	List<Contract> GetAllBC(String user_name);
	//���Һ�ͬ
	Contract GetByCid(Integer cid);
	//��ȡ��ƶ����
	List<Policy> GetPolicy();
	//��ID��ȡĳһ����
	Policy GetByPid(Integer pid);
	Integer AddContract(Contract contract);
	//��ǩ
	Integer UpDate(Contract contract);
	//�޸ĺ���ʱ��
	Integer UpTime(Contract con);
	//ũ��ͬ����ܾ�
	Integer UdtState(Contract con);
	
}
