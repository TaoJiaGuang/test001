package com.acc.service;

import java.util.List;

import com.acc.pojo.Need;
import com.acc.pojo.Sort;
import com.acc.pojo.Supply;

public interface SupplyService {

	List<Supply> GetHot();

	List<Supply> GetNew();

	List<Supply> GetSupply();

	List<Sort> GetSort();

	List<Supply> GetALL();

	List<Supply> GetByClass(String supply_type);

	List<Supply> GetByKey(String supply_name);

	Supply GetById(Integer supply_id);
	//���û�������
	List<Supply> GetByUsernaem(String user_name);
	//���
	Integer AddSupply(Supply supply);
	//ɾ��
	Integer DeleteSupply(Integer supply_id);
	//��ѯũ��Ʒ���д��ڵ����
	List<Supply> GetClass();
	//�޸�ũ��Ʒ��Ϣ
	Integer UpdateSupply(Supply supply);

}
