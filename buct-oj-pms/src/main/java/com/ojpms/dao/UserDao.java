package com.ojpms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ojpms.dto.User;

@Repository("userDao")
public interface UserDao {
	public List<User> getAllUser();
	public User getUserByNameAndPass(@Param("name") String name,@Param("pass") String pass);
	public User getById(@Param("id") long id);
	public int insertUser(User user);
	public User getByName(@Param("name")String name);
	public int updatePass(@Param("name")String name,@Param("pass")String pass);
}
