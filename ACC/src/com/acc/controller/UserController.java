package com.acc.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.env.ISourceMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acc.pojo.Message;
import com.acc.pojo.User;
import com.acc.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private InitController initController;
	@RequestMapping("/findByUsername")
	@ResponseBody
	//按用户名查找用户信息
	public User findByUsername(String username){
		System.out.println("find" +username);	
		User temp = userService.findByUsername(username);	
		System.out.println(temp);
		return userService.findByUsername(username);
		
	}
	//注册用户账号
	@RequestMapping("/register")
	@ResponseBody
	public Integer Register(User user){		
		System.out.println("User:"+user.getUser_name()+user.getPassword());
		Integer temp = userService.AddUser(user);
		System.out.println(temp);
		return temp;
		
	}
	//注册时更新信息
	@RequestMapping("/update")
	@ResponseBody
	public Integer Update(@RequestParam(value = "file", required = false) MultipartFile file,User user) throws IllegalStateException, IOException{	
		System.out.println("修改信息!"+user.getUser_type()+user.getUser_name()+user.getHeadimage()+user.getSex()+user.getTelphone()+user.getBirthday()+user.getEmail()+user.getAddress());
		Integer temp = 0;
		if(!file.isEmpty()){
			String headname = file.getOriginalFilename();			
			user.setHeadimage(headname);			
			String path =  "D:/shixun/ACC/WebContent/source/images/head/"+headname;
			temp = userService.Update(user);
			if(temp >= 1){
				file.transferTo(new File(path));
			}			
		}else{
			temp = userService.Update(user);
		}
		return temp;
		
		
	}
	//修改信息
	@RequestMapping("/upuser")
	public ModelAndView UpUser(@RequestParam(value = "file", required = false) MultipartFile file,User user,HttpSession session,Model model) throws IllegalStateException, IOException{	
		System.out.println("修改信息!"+user.getUser_name()+user.getSex()+user.getTelphone()+user.getBirthday()+user.getEmail()+user.getAddress());
		Integer temp = 0;
		User user1 = userService.findByUsername(user.getUser_name());
		System.out.println(user1.getUser_name());
		if(!user1.getTelphone().equals(user.getTelphone())){
			user1.setTelphone(user.getTelphone());
		}
		if(!user1.getSex().equals(user.getSex())){
			user1.setSex(user.getSex());
		}
		if(!user1.getAddress().equals(user.getAddress())){
			user1.setAddress(user.getAddress());
		}
		if(!user1.getEmail().equals(user.getEmail())){
			user1.setEmail(user.getEmail());
		}	
		if(!file.isEmpty()){
			String headname = file.getOriginalFilename();	
			System.out.println(headname);
			user1.setHeadimage(headname);			
			String path =  "D:/shixun/ACC/WebContent/source/images/head/"+headname;
			temp = userService.Update(user1);
			if(temp >= 1){
				file.transferTo(new File(path));
			}			
		}else{
			temp = userService.Update(user1);
		}
		System.out.println(temp);
		User auser = userService.GetUser(user1);
		System.out.println(auser);
		if(auser != null){
			session.setAttribute("user", auser);
			session.setMaxInactiveInterval(-1);
		}
		 ModelAndView mav = new ModelAndView("contract/mymsg"); 
	      mav.addObject("user", auser); 
	      return mav; 	
	}
	//进入资料详情
	@RequestMapping("/myself")
	public String tomyself(Model model,String user_name){		
		User user = userService.findByUsername(user_name);
		model.addAttribute("user", user);
		return "myself";		
	}
	//进入登录界面
	@RequestMapping("/tologin")
	public String tologin(){		
		return "Login";		
	}
	//登录
	@RequestMapping("/login")
	public String Login(User user,Model model,HttpSession session){	
		System.out.println(user.getUser_name()+user.getPassword());
		User auser = userService.GetUser(user);
		System.out.println(auser);
		if(auser != null){
			session.setAttribute("user", auser);
			session.setMaxInactiveInterval(-1);
			model.addAttribute("auser",auser);
			initController.Init(model);
			return "index";
		}else{
			model.addAttribute("msg", "请检查你的用户名与密码！");
			return "Login";		
		}		
	}
	//注销账号
	@RequestMapping("/deluser")
	public String DelUser(Integer user_id,HttpSession session,Model model){
		System.out.println("注销"+user_id);
		Integer state = userService.DelUser(user_id);
		if(state >= 1){
			session.removeAttribute("user");
		}
		initController.Init(model);
		return "index";
	}
	//退出系统
	@RequestMapping("/quit")
	public String Quit(HttpSession session,Model model){
		session.removeAttribute("user");
		initController.Init(model);
		return "index";
	}
	//查找聊天记录
	@RequestMapping("/getmsg")
	@ResponseBody
	public List<Message> GetMsg(String fuser_name,String buser_name){
		Message msg = new Message();
		msg.setBuser_name(buser_name);
		msg.setFuser_name(fuser_name);
		List<Message> msgs = userService.GetMsg(msg);
		for (Message message : msgs) {
			System.out.println(message.getFhead_image() + ":" + message.getBhead_image());
		}
		return msgs;		
	}
	//发送聊天信息
	@RequestMapping("/message/send")
	@ResponseBody
	public Message SendMsg(Message msg){
		System.out.println(msg.getBuser_name()+msg.getFuser_name()+msg.getMessage()+msg.getWhosend());
		List<Message> msgs = userService.GetMsg(msg);
		Integer msgserial = msgs.size() + 1;
		String fhead_image = userService.GetUserHead(msg.getFuser_name());
		String bhead_image = userService.GetUserHead(msg.getBuser_name());
		Date time = new Date();
		msg.setMsgserial(msgserial);
		msg.setFhead_image(fhead_image);
		msg.setBhead_image(bhead_image);
		msg.setMsgdate(time);
		Integer state = userService.AddMessage(msg);
		System.out.println("插入状态："+state);
		if(state >= 1)
			return msg;
		else
			return null;
	}
	//进入我的消息
	@RequestMapping("/mymessage")
	public String MyMessage(HttpSession session,Model model,String user_name){
		System.out.println(user_name);
		User user = (User) session.getAttribute("user");
		String user_type = user.getUser_type();
		System.out.println(user_type);
		List<Message> msgs = new ArrayList<Message>();
		if(user_type.equals("农户")){
			msgs = userService.FGetMsgs(user_name);
			System.out.println("1");
			for (Message message : msgs) {
				System.out.println(message.getMessage()+message.getBhead_image()+message.getBuser_name());
				System.out.println(message.getFhead_image()+message.getFuser_name()+message.getWhosend());
			}
		}else if(user_type.equals("商户") || user_type.equals("客户")){
			System.out.println("2");
			msgs = userService.BGetMsgs(user_name);
			for (Message message : msgs) {
				System.out.println(message.getMessage()+message.getBhead_image()+message.getBuser_name());
				System.out.println(message.getFhead_image()+message.getFuser_name()+message.getWhosend());
			}
		}		
		model.addAttribute("messages", msgs);
		return "contract/mymsg";
	}
}
