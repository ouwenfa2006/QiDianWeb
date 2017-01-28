package com.foshan.dao;

import java.util.List;

import com.foshan.entity.User;

public interface UserDao {
	User findUserById(Integer id);
	int addUser(User user);
	User findUserByUserName(String userName);
	void deleteUserById(Integer id);
	User findUserAndMaterialsById(Integer id);
	User findUserAndRolesById(Integer id);
	List<User> findUsersAndImages(int page,int pageSize,String grade,String courseName);
	User findUserAndImageById(Integer id);
}
