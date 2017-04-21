package com.foshan.service;

import java.util.List;

import org.json.JSONArray;

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
	User findUserAndImageById(Integer id);
	List<User> findUsersAndImagesfindUsersAndImages(int page, int pageSize, String grade,String courseName,String roleName,Integer level);
	List<User> findAdminOnline();
	/**
	 * 判断用户是否在别处登陆了
	 * @param user
	 */
	public void updateUserLoginState(User user);
	
}
