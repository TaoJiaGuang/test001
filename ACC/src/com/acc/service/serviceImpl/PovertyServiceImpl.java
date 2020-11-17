package com.acc.service.serviceImpl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.PovertyDao;
import com.acc.pojo.Contract;
import com.acc.pojo.Policy;
import com.acc.service.PovertyService;
@Service("PovertyService")
public class PovertyServiceImpl implements PovertyService{

	@Autowired
	private PovertyDao pd;	

	//农户获取合同
	@Override
	public List<Contract> GetAllFC(String user_name) {
		// TODO Auto-generated method stub
		return pd.GetAllFC(user_name);
	}
	//客商获取合同
	@Override
	public List<Contract> GetAllBC(String user_name) {
		// TODO Auto-generated method stub
		return pd.GetAllBC(user_name);
	}
	//查找合同
	@Override
	public Contract GetByCid(Integer cid) {
		// TODO Auto-generated method stub
		return pd.GetByCid(cid);
	}
	@Override
	public List<Policy> GetPolicy() {
		// TODO Auto-generated method stub
		return pd.GetPolicy();
	}
	
	@Override
	public Policy GetByPid(Integer pid) {
		// TODO Auto-generated method stub
		return pd.GetByPid(pid);
	}
	@Override
	public Integer AddContract(Contract contract) {
		// TODO Auto-generated method stub
		return pd.AddContract(contract);
	}
	@Override
	public Integer UpDate(Contract contract) {
		// TODO Auto-generated method stub
		return pd.UpDate(contract);
	}
	@Override
	public Integer UpTime(Contract con) {
		// TODO Auto-generated method stub
		return pd.UpTime(con);
	}
	@Override
	public Integer UdtState(Contract con) {
		// TODO Auto-generated method stub
		return pd.UdtState(con);
	}

}
