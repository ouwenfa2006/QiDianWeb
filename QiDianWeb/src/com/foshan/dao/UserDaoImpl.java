package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.User;
import com.foshan.mapper.UserMapper;
@Repository(value="userDao")
public class UserDaoImpl implements UserDao{
	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Override
	public User findUserById(Integer id) {
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
	public void deleteUserById(Integer  id) {
		// TODO Auto-generated method stub
		userMapper.deleteUserById(id);
	}
	@Override
	public User findUserAndMaterialsById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.findUserAndMaterialsById(id);
	}
	@Override
	public User findUserAndRolesById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.findUserAndRolesById(id);
	}
	@Override
	public User findUserAndImageById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.findUserAndImageById(id);
	}
	@Override
	public List<User> findUsersAndImages(int start, int pageSize, String grade,
			String courseName,String roleName,Integer level) {
		// TODO Auto-generated method stub
		return userMapper.findUsersAndImages(start,pageSize,grade,courseName,roleName,level);
	}
	

}
