package com.ojpms.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ojpms.common.MyUtils;
import com.ojpms.dto.User;
import com.ojpms.service.UserService;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserService userService;

	@RequestMapping("/login")
	@ResponseBody
	public Object login(String jsonString){
		System.out.println(jsonString);
		String str = MyUtils.decoder(jsonString);
		System.out.println("解析过后:" + str);
		JSONObject jsonObject = JSONObject.fromObject(str);
		User user = userService.query(jsonObject.getString("name"), jsonObject.getString("pswd"));
		JSONObject res = new JSONObject();
		System.out.println(user);
		if(user == null){
			res.put("result", "failed");
			return res;
		}
		res.put("result", "success");
		return res;
	}
	@RequestMapping("/register")
	@ResponseBody
	public Object register(String jsonString){
		JSONObject res = new JSONObject();
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		String name = jsonObject.getString("name");
		String pswd = jsonObject.getString("pswd"); 
		
		if(userService.existsUser(name)){
			res.put("result", "failed");
			res.put("msg", "已经存在的用户名");
			return res;
		}
		User user = new User();
		user.setName(name);
		user.setPswd(pswd);
		if(userService.addUser(user) > 0){
			res.put("result", "success");
			return res;
		}
		res.put("result", "failed");
		res.put("msg", "注册失败:内部错误");
		return res;
	}
	@RequestMapping("/resetPswd")
	@ResponseBody
	public Object resetPswd(String jsonString){
		JSONObject res = new JSONObject();
		String str = MyUtils.decoder(jsonString);
		JSONObject jsonObject = JSONObject.fromObject(str);
		String name = jsonObject.getString("name");
		String newPass = jsonObject.getString("new_pass"); 
		if(userService.resetPass(name, newPass) > 0){
			res.put("result", "success");
			return res;
		}
		res.put("result", "failed");
		return res;
	}
	
}
