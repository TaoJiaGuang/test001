package com.acc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.acc.pojo.Need;
import com.acc.pojo.Sort;
import com.acc.pojo.Supply;
import com.acc.pojo.User;
import com.acc.service.NeedService;
import com.acc.service.SupplyService;

@Controller
@RequestMapping("need")
public class NeedController {
	
	@Autowired
	private NeedService needService;
	@Autowired
	private SupplyService supplyService;
	//进入更多农产品需求信息页面
	@RequestMapping("moreneed")
	public String toMoreNeed(Model model){
		List<Sort> sorts = supplyService.GetSort();
		List<Need> needs = needService.GetNeedALL();
		List<Need> temp = new ArrayList<Need>();
		Integer totalpage = needs.size();
		Integer page = 1;
		for (int i = (page - 1) * 12 ; i <page * 12 && i < totalpage; i++) {
			temp.add(i, needs.get(i));
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("sorts", sorts);
		model.addAttribute("needs", temp);	
		model.addAttribute("searchtype", 0);
		return "MoreNeed";		
	}
	//按分类查询农产品需求信息
	@RequestMapping("findbyclass")
	public String GetByClass(Model model,String need_type){
		System.out.println(need_type);
		List<Sort> sorts = supplyService.GetSort();
		List<Need> needs = needService.GetByClass(need_type);
		List<Need> temp = new ArrayList<Need>();
		Integer totalpage = needs.size();
		Integer page = 1;
		for (int i = (page - 1) * 12 ; i <page * 12 && i < totalpage; i++) {
			temp.add(i, needs.get(i));
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("sorts", sorts);
		model.addAttribute("needs", temp);	
		model.addAttribute("searchtype", 1);
		model.addAttribute("classkey", need_type);
		return "MoreNeed";
	}
	//按关键字查询农产品需求信息
	@RequestMapping("findbykey")
	public String GetByKey(Model model,String need_name){
		List<Sort> sorts = supplyService.GetSort();
		List<Need> needs = needService.GetByKey(need_name);
		List<Need> temp = new ArrayList<Need>();
		Integer totalpage = needs.size();
		Integer page = 1;
		for (int i = (page - 1) * 12 ; i <page * 12 && i < totalpage; i++) {
			temp.add(i, needs.get(i));
		}
		model.addAttribute("pages", totalpage);
		model.addAttribute("sorts", sorts);
		model.addAttribute("needs", temp);	
		model.addAttribute("searchtype", 2);
		model.addAttribute("classkey", need_name);
		return "MoreNeed";
	}
	//分类型分布查询农产品需求信息
	@RequestMapping("findbypage")
	@ResponseBody
	public List<Need> FindByPage(Model model,Integer page,Integer searchtype,String classkey){
		System.out.println("分页！" + page);
		System.out.println(searchtype+":"+classkey);
		List<Need> needs = new ArrayList<Need>();
		if(searchtype == 0){
			needs = needService.GetNeedALL();
		}else if(searchtype == 1){
			needs = needService.GetByClass(classkey);
			System.out.println(needs);
		}else if(searchtype == 2){
			needs = needService.GetByKey(classkey);
		}
		
		List<Need> temp = new ArrayList<Need>();
		Integer totalpage = needs.size();
		System.out.println(totalpage);
		for (int i = (page - 1) * 12,j=0 ; i <page * 12 && i < totalpage; i++,j++) {
			temp.add(j, needs.get(i));
		}
		return temp;
	}
	//按需求查询需求信息详情，返回页面
	@RequestMapping("findbyid")
	public String FindById(Model model,Integer need_id){
		System.out.println(need_id);
		Need need = needService.GetById(need_id);
		model.addAttribute("need", need);
		return "Need";
	}
	//按需求查询需求信息详情，返回JSON格式
	@RequestMapping("findbynid")
	@ResponseBody
	public Need FindByNid(Model model,Integer need_id){
		System.out.println(need_id);
		Need need = needService.GetById(need_id);
		return need;
	}
	//进入需求管理
	@RequestMapping("management")
	public String ToManage(Model model, String user_name) {
		System.out.println(user_name);
		List<Need> needs = needService.GetByUsername(user_name);
		Integer totalpage = needs.size();
		Integer page = 1;
		List<Need>  temp = new ArrayList<Need>();
		for (int i = (page - 1) * 11,j=0 ; i <page * 11 && i < totalpage; i++,j++) {
			temp.add(j, needs.get(i));
			System.out.println("temp:"+temp.get(j).getNeed_name());
		}
		model.addAttribute("totalpage", totalpage);
		model.addAttribute("needs", temp);
		return "nmanage";
	}
	//需求管理分页
	@RequestMapping("/manage/findbypage")
	@ResponseBody
	public List<Need> FindByPage(String user_name,Integer page) {
		System.out.println(user_name+page);
		List<Need> needs = needService.GetByUsername(user_name);
		Integer totalpage = needs.size();
		List<Need>  temp = new ArrayList<Need>();
		for (int i = (page - 1) * 11,j=0 ; i <page * 11 && i < totalpage; i++,j++) {
			temp.add(j, needs.get(i));
			System.out.println("temp:"+temp.get(j).getNeed_name());
		}
		return temp;
	}
	//增加农产品需求信息
	@RequestMapping("/add")
	@ResponseBody
	public Integer AddNeed(Need need,MultipartFile upload,HttpSession session) throws IllegalStateException, IOException{
		System.out.println(upload);
		System.out.println("增加需求"+need.getNeed_name()+need.getNeed_type()+need.getNeed_address());
		Date date = new Date();
		need.setNeed_date(date);
		Integer state = null;
		User user = (User) session.getAttribute("user");
		System.out.println(user.getUser_name());
		need.setUser_name(user.getUser_name());;
		if(!upload.isEmpty()){
			String imagename = upload.getOriginalFilename();		
			String path =  "D:/shixun/ACC/WebContent/source/images/need/" + imagename;			
			need.setNeed_image(imagename);	
			state = needService.AddNeed(need);
			if(state > 0){
				upload.transferTo(new File(path));
			}			
		}		
		return state;
	}
	//修改农产品需求信息
	@RequestMapping("/update")
	@ResponseBody
	public Integer UpdateNeed(@RequestParam(value = "upload", required = false) MultipartFile upload,Need temp) throws IllegalStateException, IOException{
		System.out.println("修改需求");
		Integer state = 1;
		System.out.println(temp.getNeed_id()+temp.getNeed_name()+temp.getNeed_content()+temp.getNeed_address()+temp.getNeed_price()+temp.getNeed_type()+temp.isNeed_coor());
		Need need = needService.GetById(temp.getNeed_id());  //查询原来的信息
		if(!temp.getNeed_address().equals(need.getNeed_address())){
			need.setNeed_address(temp.getNeed_address());			
		}
		if(!temp.getNeed_content().equals(need.getNeed_content())){
			need.setNeed_content(temp.getNeed_content());
		}
		if(!temp.getNeed_name().equals(need.getNeed_name())){
			need.setNeed_name(temp.getNeed_name());
		}
		if(!temp.getNeed_type().equals(need.getNeed_type())){
			need.setNeed_type(temp.getNeed_type());
		}
		if(!temp.getNeed_price().equals(need.getNeed_price())){
			need.setNeed_price(temp.getNeed_price());
		}
		if(temp.isNeed_coor() != need.isNeed_coor()){
			need.setNeed_coor(temp.isNeed_coor());
		}		
		if(!upload.isEmpty()){			
			String imagename = upload.getOriginalFilename();	
			System.out.println(imagename);
			String path =  "D:/shixun/ACC/WebContent/source/images/need/" + imagename;	
			if(!imagename.equals(need.getNeed_image())){	
				upload.transferTo(new File(path));
				need.setNeed_image(imagename);
			}
		}				
		state = needService.UpdateNeed(need);
		System.out.println(state);
		return state;
	}
	//删除需求信息
	@RequestMapping("/delete")
	@ResponseBody
	public Integer DelNeed(Integer need_id){
		Integer state = needService.DelNeed(need_id);
		return state;
	}
}

