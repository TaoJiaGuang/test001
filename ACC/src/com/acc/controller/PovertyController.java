package com.acc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acc.pojo.Contract;
import com.acc.pojo.User;
import com.acc.pojo.Policy;
import com.acc.pojo.Supply;
import com.acc.service.PovertyService;

@Controller
public class PovertyController {
	
	@Autowired
	private PovertyService ps;
	//进入合同管理
	@RequestMapping("/tocontract")
	public String ToContract(HttpSession session,Model model,String user_name){
		System.out.println(user_name);
		List<Contract> temps = new ArrayList<Contract>();
		User user = (User) session.getAttribute("user");
		if(user.getUser_type().equals("农户"))
			temps = ps.GetAllFC(user_name);
		else
			temps = ps.GetAllBC(user_name);
		for(Integer i = 0; i < temps.size(); i++){
			Calendar calendar = new GregorianCalendar();			
			Date date = temps.get(i).getCdate();
			calendar.setTime(date);
			Integer time = temps.get(i).getCtime();
			calendar.add(calendar.MONTH, time);	
			temps.get(i).setCdate(calendar.getTime());
		}
		model.addAttribute("temps", temps);
		return "allcct";
	}
	//增加合同
	@RequestMapping("/addContract")
	@ResponseBody
	public Integer AddContract(String buser_name,String fuser_name,Integer supply_id,String cdate,Integer ctime){
		Contract contract = new Contract();
		contract.setBuser_name(buser_name);
		contract.setFuser_name(fuser_name);
		contract.setCtime(ctime);
		Supply supply = new Supply();
		supply.setSupply_id(supply_id);
		contract.setSupply(supply);
		SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日");//设置一个时间转换器
		Date d = null;
		try {
			d = sf.parse(cdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(d);
		contract.setCdate(d);
		System.out.println(buser_name+fuser_name+supply_id+cdate+ctime);
		return ps.AddContract(contract);
		
	}
	//续签合同
	@RequestMapping("/updatedate")
	@ResponseBody
	public Integer UpDate(Integer cid){
		Date date = new Date();
		Contract con = new Contract();
		con.setCdate(date);
		con.setCid(cid);
		Integer state = ps.UpDate(con);
		return state;
	}
	//修改合同
	@RequestMapping("/updatetime")
	@ResponseBody
	public Integer UpDate(Integer cid,Integer ctime){
		Contract con = new Contract();
		con.setCtime(ctime);
		con.setCid(cid);
		Integer state = ps.UpTime(con);
		return state;
	}
	//查看合同详情
	@RequestMapping("/detail")
	public String ToDetail(Model model,Integer cid){
		System.out.println(cid);
		Contract temp = ps.GetByCid(cid);
		Calendar calendar = new GregorianCalendar();
		Date date = temp.getCdate();
		calendar.setTime(date);
		Integer time = temp.getCtime();
		calendar.add(calendar.MONTH, time);	
		System.out.println(temp.getCdate());
		model.addAttribute("item", temp);
		model.addAttribute("endtime", calendar.getTime());
		return "dtlcct";
	}
	//农户同意
	@RequestMapping("/agree")
	@ResponseBody
	public Integer Agree(Integer id,Integer state){
		System.out.println(id+":"+state);
		Contract con = new Contract();
		con.setCid(id);
		con.setCstate(1);
		//
		if(state == -2){
			
		}
		Integer temp = ps.UdtState(con);		
		return temp;		
	}
	//农户拒绝
	@RequestMapping("/defeat")
	@ResponseBody
	public Integer Defeat(Integer id,Integer state){
		System.out.println(id+":"+state);
		Contract con = new Contract();
		con.setCid(id);
		con.setCstate(2);
		Integer temp = ps.UdtState(con);		
		return temp;		
	}
	//按扶贫政策ID号查询扶贫政策详详情
	@RequestMapping("/policy")
	public String Policy(Model model,Integer pid){
		System.out.println("test!");
		Policy policy = ps.GetByPid(pid);
		String content = policy.getContent();
		
		policy.setContent(content.replace("\n","<br>"));
		model.addAttribute("policy", policy);
		return "policy";
	}
	//分页查询扶贫政策
	@RequestMapping("/findpolicy")
	@ResponseBody
	public List<Policy> FindbyPage(Integer page){
		List<Policy> policys = ps.GetPolicy();
		Integer pages = policys.size();
		List<Policy> temp = new ArrayList<Policy>();
		for(int i = (page - 1) * 10,j=0 ; i <page * 10 && i < pages; i++,j++){
			temp.add(j, policys.get(i));
		}
		return temp;
	}
}
