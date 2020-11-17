package com.acc.service;

import java.util.Date;
import java.util.List;

import com.acc.pojo.Contract;
import com.acc.pojo.Policy;

public interface PovertyService {
	
	//ũ����ȡ��ͬ
	List<Contract> GetAllFC(String user_name);
	//���̻�ȡ��ͬ
	List<Contract> GetAllBC(String user_name);
	//���Һ�ͬ
	Contract GetByCid(Integer cid);
	//��ȡ��ƶ����	
	List<Policy> GetPolicy();
	//��ȡĳһ����
	com.acc.pojo.Policy GetByPid(Integer pid);
	//���Ӻ�ͬ
	Integer AddContract(Contract contract);
	//��ǩ��ͬ
	Integer UpDate(Contract contract);
	//�޸ĺ�ͬ
	Integer UpTime(Contract con);
	//ũ��ͬ����ܾ�
	Integer UdtState(Contract con);

}
