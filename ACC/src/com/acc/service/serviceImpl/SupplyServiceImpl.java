package com.acc.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.SupplyDao;
import com.acc.pojo.Sort;
import com.acc.pojo.Supply;
import com.acc.service.SupplyService;
@Service("SupplyService")
public class SupplyServiceImpl implements SupplyService{
	@Autowired
	private SupplyDao supplyDao;
	@Override
	public List<Supply> GetHot() {
		// TODO Auto-generated method stub
		return supplyDao.GetHot();
	}

	@Override
	public List<Supply> GetNew() {
		// TODO Auto-generated method stub
		return supplyDao.GetNew();
	}

	@Override
	public List<Supply> GetSupply() {
		// TODO Auto-generated method stub
		return supplyDao.GetSupply();
	}

	@Override
	public List<Sort> GetSort() {
		// TODO Auto-generated method stub
		return supplyDao.GetSort();
	}

	@Override
	public List<Supply> GetALL() {
		// TODO Auto-generated method stub
		return supplyDao.GetAll();
	}

	@Override
	public List<Supply> GetByClass(String supply_type) {
		// TODO Auto-generated method stub
		return supplyDao.GetByClass(supply_type);
	}

	@Override
	public List<Supply> GetByKey(String supply_name) {
		// TODO Auto-generated method stub
		return supplyDao.GetByKey(supply_name);
	}

	@Override
	public Supply GetById(Integer supply_id) {
		// TODO Auto-generated method stub
		return supplyDao.GetById(supply_id);
	}

	@Override
	public List<Supply> GetByUsernaem(String user_name) {
		// TODO Auto-generated method stub
		return supplyDao.GetByUsernaem(user_name);
	}

	@Override
	public Integer AddSupply(Supply supply) {
		// TODO Auto-generated method stub
		return supplyDao.AddSupply(supply);
	}
	//删除
	@Override
	public Integer DeleteSupply(Integer supply_id) {
		// TODO Auto-generated method stub  按删除ID查询一次保证删除状态，
		Integer state = supplyDao.DeleteSupply(supply_id);
		if(state > 0){
			state = 1;
		}else{
			if(supplyDao.GetById(supply_id) != null){
				state = 1;
			}
		}
		return state;
	}

	@Override
	public List<Supply> GetClass() {
		// TODO Auto-generated method stub
		return supplyDao.GetClass();
	}

	@Override
	public Integer UpdateSupply(Supply supply) {
		// TODO Auto-generated method stub
		return supplyDao.UpdateSupply(supply);
	}

}
