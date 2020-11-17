package com.acc.dao;

import java.util.Date;
import java.util.List;

import com.acc.pojo.Contract;
import com.acc.pojo.Policy;

public interface PovertyDao {
	//农户获取合同
	List<Contract> GetAllFC(String user_name);
	//客商获取合同
	List<Contract> GetAllBC(String user_name);
	//查找合同
	Contract GetByCid(Integer cid);
	//获取扶贫政策
	List<Policy> GetPolicy();
	//按ID获取某一政策
	Policy GetByPid(Integer pid);
	Integer AddContract(Contract contract);
	//续签
	Integer UpDate(Contract contract);
	//修改合作时长
	Integer UpTime(Contract con);
	//农户同意与拒绝
	Integer UdtState(Contract con);
	
}
