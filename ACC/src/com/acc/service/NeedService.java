package com.acc.service;

import java.util.List;

import com.acc.pojo.Need;
import com.acc.pojo.Supply;

public interface NeedService {

	List<Need> GetNeed();

	List<Need> GetNeedSort();

	List<Need> GetNeedALL();

	List<Need> GetByClass(String need_type);

	List<Need> GetByKey(String classkey);

	Need GetById(Integer need_id);

	List<Need> GetByUsername(String user_name);

	Integer AddNeed(Need need);

	Integer UpdateNeed(Need need);

	Integer DelNeed(Integer need_id);

	List<Need> GetOld();

	List<Need> GetNew();

}
