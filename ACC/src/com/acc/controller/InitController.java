package com.acc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.acc.pojo.Need;
import com.acc.pojo.Order;
import com.acc.pojo.Policy;
import com.acc.pojo.Supply;
import com.acc.service.NeedService;
import com.acc.service.PovertyService;
import com.acc.service.SupplyService;

@Controller
public class InitController {

	@Autowired
	private PovertyService povertyService;
	@Autowired
	private SupplyService supplyService;
	@Autowired
	private NeedService needService;
	//进入系统初始化信息加载
	@RequestMapping("/loading")
	public String Init(Model model){	
		List<Supply> hotsupplys = supplyService.GetHot();
		List<Supply> newsupplys = supplyService.GetNew();
		List<Need> oldneeds = needService.GetOld();
		List<Need> newneeds = needService.GetNew();
		List<Supply> supplys = supplyService.GetSupply();
		List<Policy> policys = povertyService.GetPolicy();
		List<Need> needs = needService.GetNeed();
		Integer pages = policys.size();
		Integer page = 1;
		List<Policy> temp = new ArrayList<Policy>();
		for(int i = (page - 1) * 10,j=0 ; i <page * 10 && i < pages; i++,j++){
			temp.add(j, policys.get(i));
		}
		model.addAttribute("pages", pages);
		model.addAttribute("policys", temp);
		model.addAttribute("hots", hotsupplys);
		model.addAttribute("news", newsupplys);
		model.addAttribute("oldneeds", oldneeds);
		model.addAttribute("newneeds",newneeds);
		model.addAttribute("supplys", supplys);
		model.addAttribute("needs", needs);
		return "index";		
	}
}
