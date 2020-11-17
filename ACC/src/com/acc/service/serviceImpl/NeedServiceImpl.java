package com.acc.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acc.dao.NeedDao;
import com.acc.pojo.Need;
import com.acc.pojo.Supply;
import com.acc.service.NeedService;
@Service("NeedService")
public class NeedServiceImpl implements NeedService{

	@Autowired
	private NeedDao needDao;
	//查询前12条
	@Override
	public List<Need> GetNeed() {
		// TODO Auto-generated method stub
		return needDao.GetNeed();
	}
	//查询需求分类
	@Override
	public List<Need> GetNeedSort() {
		// TODO Auto-generated method stub
		return needDao.GetNeedSort();
	}
	//查询所有需求
	@Override
	public List<Need> GetNeedALL() {
		// TODO Auto-generated method stub
		return needDao.GetNeedAll();
	}
	//按类查询
	@Override
	public List<Need> GetByClass(String need_type) {
		// TODO Auto-generated method stub
		return needDao.GetByClass(need_type);
	}
	@Override
	public List<Need> GetByKey(String classkey) {
		// TODO Auto-generated method stub
		return needDao.GetByKey(classkey);
	}
	@Override
	public Need GetById(Integer need_id) {
		// TODO Auto-generated method stub
		return needDao.GetById(need_id);
	}
	@Override
	public List<Need> GetByUsername(String user_name) {
		// TODO Auto-generated method stub
		return needDao.GetByUsername(user_name);
	}
	@Override
	public Integer AddNeed(Need need) {
		// TODO Auto-generated method stub
		return needDao.AddNeed(need);
	}
	@Override
	public Integer UpdateNeed(Need need) {
		// TODO Auto-generated method stub
		return needDao.UpdateNeed(need);
	}
	@Override
	public Integer DelNeed(Integer need_id) {
		// TODO Auto-generated method stub
		Integer state =  needDao.DelNeed(need_id);
		if(state > 0){
			state = 1;
		}else{
			if(needDao.GetById(need_id) != null){
				state = 1;
			}
		}
		return state;
	}
	//需求信息最早发布
	@Override
	public List<Need> GetOld() {
		// TODO Auto-generated method stub
		return needDao.GetOld();
	}
	//需求信息最新发布
	@Override
	public List<Need> GetNew() {
		// TODO Auto-generated method stub
		return needDao.GetNew();
	}
	

}
