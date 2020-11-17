package com.acc.dao;

import java.util.List;

import com.acc.pojo.Order;
import com.acc.pojo.Sort;
import com.acc.pojo.Supply;

public interface SupplyDao {

	List<Supply> GetHot();

	List<Supply> GetNew();

	List<Supply> GetSupply();
	//���ط���
	List<Sort> GetSort();

	List<Supply> GetAll();

	List<Supply> GetByClass(String supply_type);

	List<Supply> GetByKey(String supply_name);

	Supply GetById(Integer supply_id);

	List<Supply> GetByUsernaem(String user_name);

	Integer AddSupply(Supply supply);
	
	Integer DeleteSupply(Integer supply_id);

	List<Supply> GetClass();
	//�޸�ũ��Ʒ��Ϣ
	Integer UpdateSupply(Supply supply);
	

}
