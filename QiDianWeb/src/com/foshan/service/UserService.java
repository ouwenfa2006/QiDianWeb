package com.foshan.service;

import com.foshan.entity.User;
/**
 * 用户业务类
 * @author Administrator
 *
 */
public interface UserService {
	public User findUserById(Integer id);
	public void addUser(User user);
	public User findUserByUserName(String userName);
	public User login(User user);
	public void delteUserById(Integer...ids);
	User findUserAndMaterialsById(Integer id);
	User findUserAndRolesById(Integer id);
}
