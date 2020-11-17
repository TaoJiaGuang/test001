package com.acc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acc.pojo.Sort;
import com.acc.pojo.Supply;
import com.acc.pojo.User;
import com.acc.service.SupplyService;

@Controller
@RequestMapping("supply")
public class SupplyController {
	@Autowired
	private SupplyService supplyService;
	
	//查询更多农产品供应信息
	@RequestMapping("moresupply")
	public String toMoreSupply(Model model){
		List<Sort> supplysorts = supplyService.GetSort();
		List<Supply> supplys = supplyService.GetALL();
		List<Supply> temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size();
		Integer page = 1;
		for (int i = (page - 1) * 12,j=0 ; i <page * 12; i++,j++) {
			temp.add(j, supplys.get(i));
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("items", supplyService.GetSort());
		model.addAttribute("supplys", temp);
		model.addAttribute("searchtype", 0);
		return "MoreSupply";
	}
	//按类查询农产品供应信息
	@RequestMapping("findbyclass")
	public String FindByClassName(Model model, String classname){
		System.out.println(classname);
		List<Sort> supplysorts = supplyService.GetSort();
		List<Supply> supplys = supplyService.GetByClass(classname);	
		List<Supply> temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size(); 
		Integer page = 1;
		for (int i = (page - 1) * 12,j=0 ; i <page * 12&& i < totalpage; i++,j++) {
			temp.add(j, supplys.get(i));
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("supplys", temp);
		model.addAttribute("searchtype", 1);
		model.addAttribute("classkey", classname);
		model.addAttribute("items", supplyService.GetSort());
		return "MoreSupply";
	}
	//按关键字查询供应农产品信息
	@RequestMapping("findbykey")
	//@ResponseBody
	public String FindByKey(Model model, String supply_name){
		System.out.println(supply_name);
		List<Sort> sorts = supplyService.GetSort();
		List<Supply> supplys = supplyService.GetByKey(supply_name);	
		List<Supply> temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size();
		System.out.println(totalpage);
		Integer page = 1;
		for (int i = (page - 1) * 12,j=0 ; i <page * 12 && i < totalpage; i++,j++) {
			temp.add(j, supplys.get(i));
			System.out.println("temp:"+temp.get(j).getSupply_name());
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("items", sorts);
		model.addAttribute("supplys", temp);
		model.addAttribute("searchtype", 2);
		model.addAttribute("items", supplyService.GetSort());
		model.addAttribute("classkey", supply_name);
		return "MoreSupply";
	}
	//分类型查询农产品供应信息
	@RequestMapping("findbypage")
	@ResponseBody
	public List<Supply> FindByPage(Model model,Integer page,Integer searchtype,String classkey){
		System.out.println("分页！" + page);
		System.out.println(searchtype+":"+classkey);
		List<Supply> supplys = new ArrayList<Supply>();
		if(searchtype == 0){
			supplys = supplyService.GetALL();
		}else if(searchtype == 1){
			supplys = supplyService.GetByClass(classkey);
		}else if(searchtype == 2){
			supplys = supplyService.GetByKey(classkey);
		}
		
		List<Supply> temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size();
		System.out.println(totalpage);
		for (int i = (page - 1) * 12,j=0 ; i <page * 12 && i < totalpage; i++,j++) {
			temp.add(j, supplys.get(i));
		}
		return temp;
	}
	//按ID查找供应详细信息
	@RequestMapping("findbyid")
	public String FindById(Model model,Integer supply_id){
		System.out.println(supply_id);
		Supply supply = supplyService.GetById(supply_id);
		model.addAttribute("supply", supply);		
		return "Supply";
	}
	//按ID查找供应详细信息,返回JSON格式
	@RequestMapping("findbysid")
	@ResponseBody
	public Supply FindBysId(Integer supply_id) {
		System.out.println(supply_id);
		Supply supply = supplyService.GetById(supply_id);
		return supply;
	}
	//进入供应管理
	@RequestMapping("management")
	public String ToManage(Model model,String user_name){
		System.out.println(user_name);
		List<Supply>  supplys = supplyService.GetByUsernaem(user_name);
		List<Sort>  sort = supplyService.GetSort();
		List<Supply>  temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size();
		Integer page = 1;
		for (int i = (page - 1) * 11,j=0 ; i <page * 11 && i < totalpage; i++,j++) {
			temp.add(j, supplys.get(i));
			System.out.println("temp:"+temp.get(j).getSupply_name());
		}
		model.addAttribute("count", totalpage);
		model.addAttribute("items", sort);
		model.addAttribute("supplys", temp);
		return "smanage";
	}
	//供应管理分页查询
	@RequestMapping("manage/findbypage")
	@ResponseBody
	public List<Supply> FindByManPage(Model model,Integer page,String user_name){
		System.out.println("分页！" + page+user_name);
		List<Supply>  supplys = supplyService.GetByUsernaem(user_name);	
		List<Sort>  sort = supplyService.GetSort();
		List<Supply> temp = new ArrayList<Supply>();
		Integer totalpage = supplys.size();
		for (int i = (page - 1) * 11,j=0 ; i <page * 11 && i < totalpage; i++,j++) {
			temp.add(j, supplys.get(i));
		}
		model.addAttribute("count", totalpage);
		model.addAttribute("items", sort);
		model.addAttribute("supplys", supplys);
		return temp;
	}
	//增加农产品
	@RequestMapping("addsupply")
	@ResponseBody
	public Integer AddSupply(@RequestParam(value = "file", required = false) MultipartFile file,Supply supply,HttpSession session){
		Integer state = 0;
		Date date = new Date();		
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUser_name());
		supply.setSupply_date(date);
		supply.setUser_name(user.getUser_name());
		supply.setSupply_telphone(user.getTelphone());
		if(!file.isEmpty()){
			String image = file.getOriginalFilename();	
			System.out.println(image);
			String path = "D:/shixun/ACC/WebContent/source/images/supply/"+image;
			supply.setSupply_image(image);			
			state = supplyService.AddSupply(supply);
			System.out.println(state);
			if(state >= 1){
				System.out.println(".................");
				try {
					file.transferTo(new File(path));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				System.out.println("error");
			}		
		}
		return state;		
	}
	//删除农产品
	@RequestMapping("manage/delete")
	@ResponseBody
	public Integer DeleteSupply(Integer supply_id){
		System.out.println(supply_id);		
		Integer state = supplyService.DeleteSupply(supply_id);
		System.out.println("操作状态："+state);
		return state;
	}
	//查找所有分类
	@RequestMapping("/getsort")
	@ResponseBody
	public List<Sort> GetSort(){		
		return supplyService.GetSort();		
	}
	//更新农产品信息
	@RequestMapping("/update")
	@ResponseBody
	public Integer UpdateSupply(@RequestParam(value = "file", required = false) MultipartFile file,Supply supply){
		System.out.println("修改农产品信息！"+supply.getSupply_id()+supply.getSupply_name()+supply.getSupply_price()+supply.getSupply_sales());
		Integer state = 0;
		Supply temp = supplyService.GetById(supply.getSupply_id());
		if(supply.isSupply_cooperation()!=temp.isSupply_cooperation())
			temp.setSupply_cooperation(supply.isSupply_cooperation());
		if(!supply.getSupply_name().equals(temp.getSupply_name()))
			temp.setSupply_name(supply.getSupply_name());
		if(!supply.getSupply_telphone().equals(temp.getSupply_telphone()))
			temp.setSupply_telphone(supply.getSupply_telphone());
		if(!supply.getSupply_type().equals(temp.getSupply_type()))
			temp.setSupply_type(supply.getSupply_type());
		if(!supply.getSupply_text().equals(temp.getSupply_text()))
			temp.setSupply_text(supply.getSupply_text());
		if(supply.getSupply_price() != temp.getSupply_price())
			temp.setSupply_price(supply.getSupply_price());
		if(supply.getSupply_surplus() != temp.getSupply_surplus())
			temp.setSupply_surplus(supply.getSupply_surplus());
		
		System.out.println(state);
		if(!file.isEmpty()){
			String image = file.getOriginalFilename();	
			System.out.println(image);			
			String path =  "D:/shixun/ACC/WebContent/source/images/supply/"+image;
			temp.setSupply_image(image);
			System.out.println(temp.getSupply_image());
			state =  supplyService.UpdateSupply(temp);
			if(state >= 1){
				try {
					file.transferTo(new File(path));
					System.out.println("////");
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				System.out.println("error");
			}		
		}else{
			state =  supplyService.UpdateSupply(temp);
		}
		System.out.println(state);
		return state;
	}
}
