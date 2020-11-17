package com.acc.service;

import java.util.Date;
import java.util.List;

import com.acc.pojo.Contract;
import com.acc.pojo.Policy;

public interface PovertyService {
	
	//农户获取合同
	List<Contract> GetAllFC(String user_name);
	//客商获取合同
	List<Contract> GetAllBC(String user_name);
	//查找合同
	Contract GetByCid(Integer cid);
	//获取扶贫政策	
	List<Policy> GetPolicy();
	//获取某一政策
	com.acc.pojo.Policy GetByPid(Integer pid);
	//增加合同
	Integer AddContract(Contract contract);
	//续签合同
	Integer UpDate(Contract contract);
	//修改合同
	Integer UpTime(Contract con);
	//农户同意与拒绝
	Integer UdtState(Contract con);

}
