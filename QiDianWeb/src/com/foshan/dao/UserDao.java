package com.foshan.dao;

import java.util.List;

import com.foshan.entity.User;

public interface UserDao extends BaseDao<User>{
	User findUserById(Integer id);
	int addUser(User user);
	User findUserByUserName(String userName);
	void deleteUserById(Integer id);
	/**
	 * 根据id找用户及上传的辅导资料
	 * @param id
	 * @return
	 */
	User findUserAndMaterialsById(Integer id);
	User findUserAndRolesById(Integer id);
	/**
	 * 查找用户及与其关联的头像
	 * @param start
	 * @param pageSize
	 * @param grade 可为空
	 * @param courseName 可为空
	 * @param roleName 可为空
	 * @return
	 */
	List<User> findUsersAndImages(int start,int pageSize,String grade,String courseName,String roleName,Integer level);
	User findUserAndImageById(Integer id);
	void updateUserLoginState(User user);
	
}
