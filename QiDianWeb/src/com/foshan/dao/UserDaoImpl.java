package com.foshan.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.User;
import com.foshan.mapper.UserMapper;
@Repository(value="userDao")
public class UserDaoImpl implements UserDao{
	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Override
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userMapper.findUserById(id);
	}
	@Override
	public int addUser(User user) {
		
		return userMapper.addUser(user);
	}
	@Override
	public User findUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userMapper.findUserByUserName(userName);
	}
	@Override
	public void deleteUserById(int  id) {
		// TODO Auto-generated method stub
		userMapper.deleteUserById(id);
	}
	@Override
	public User findUserAndMaterialsById(int id) {
		// TODO Auto-generated method stub
		return userMapper.findUserAndMaterialsById(id);
	}
	@Override
	public User findUserAndRolesById(int id) {
		// TODO Auto-generated method stub
		return userMapper.findUserAndRolesById(id);
	}

}
