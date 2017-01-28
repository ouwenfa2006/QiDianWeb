package com.foshan.mapper;

import com.foshan.entity.User;

public interface UserMapper {
	User findUserById(Integer id);
	int addUser(User user);
	User findUserByUserName(String userName);
	void deleteUserById(Integer id);
	User findUserAndMaterialsById(Integer id);
	User findUserAndRolesById(Integer id);
}
