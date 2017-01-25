package com.foshan.mapper;

import com.foshan.entity.User;

public interface UserMapper {
	User findUserById(int id);
	int addUser(User user);
	User findUserByUserName(String userName);
	void deleteUserById(int id);
	User findUserAndMaterialsById(int id);
	User findUserAndRolesById(int id);
}
