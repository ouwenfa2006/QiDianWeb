package com.foshan.service;

import com.foshan.entity.User;
/**
 * 用户业务类
 * @author Administrator
 *
 */
public interface UserService {
	public User findUserById(int id);
	public void addUser(User user);
	public User findUserByUserName(String userName);
	public User login(User user);
	public void delteUserById(int...ids);
	User findUserAndMaterialsById(int id);
	User findUserAndRolesById(int id);
}
