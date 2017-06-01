package com.ojpms.controller;

import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ojpms.dao.UserDao;
import com.ojpms.dto.User;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/hello")
	public String hello(){
		System.out.println("asd");
		return "hello";
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public Object get(Long id,String name){
		System.out.println(id + " " + name);
		JSONObject res = new JSONObject();
		res.put("result", "hello");
		return res;
	}
	@RequestMapping("/test")
	public Object get(){
		return null;
	}
	
	
}
