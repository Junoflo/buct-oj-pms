package com.ojpms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ojpms.dao.UserDao;
import com.ojpms.dto.User;

@Service("userService")
public class UserService {
	@Autowired
	UserDao userDao;
	
	public User query(String name,String pswd){
		return userDao.getUserByNameAndPass(name, pswd);
	}
	public User query(long id){
		return userDao.getById(id);
	}
	public int addUser(User user){
		return userDao.insertUser(user);
	}
	public boolean existsUser(String name){
		if(userDao.getByName(name) != null){
			return true;
		}
		return false;
	}
	public int resetPass(String username,String newpass){
		return userDao.updatePass(username, newpass);
	}
}
