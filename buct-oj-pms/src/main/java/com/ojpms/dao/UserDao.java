package com.ojpms.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ojpms.dto.User;

@Repository("userDao")
public interface UserDao {
	public List<User> getAllUser();
}
