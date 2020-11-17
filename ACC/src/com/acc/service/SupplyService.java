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
	//按用户名查找
	List<Supply> GetByUsernaem(String user_name);
	//添加
	Integer AddSupply(Supply supply);
	//删除
	Integer DeleteSupply(Integer supply_id);
	//查询农产品表中存在的类别
	List<Supply> GetClass();
	//修改农产品信息
	Integer UpdateSupply(Supply supply);

}
