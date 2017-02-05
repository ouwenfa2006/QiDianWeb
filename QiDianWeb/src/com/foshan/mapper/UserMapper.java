package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foshan.entity.User;

public interface UserMapper {
	User findUserById(Integer id);
	int addUser(User user);
	User findUserByUserName(String userName);
	void deleteUserById(Integer id);
	User findUserAndMaterialsById(Integer id);
	User findUserAndRolesById(Integer id);
	User findUserAndImageById(Integer id);
	List<User> findUsersAndImages(@Param("start")int start,@Param("pageSize") int pageSize,@Param("grade") String grade,@Param("courseName")String courseName,@Param("roleName")String roleName,@Param("level")Integer level);
}
