package com.foshan.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import com.foshan.mapper.UserRoleMapper;
@Repository(value="userRoleDao")
public class UserRoleDaoImpl implements UserRoleDao{
	@Resource(name="userRoleMapper")
	private UserRoleMapper userRoleMapper;
	@Override
	public void add(int userId, int roleId) {
		// TODO Auto-generated method stub
		userRoleMapper.add(userId, roleId);
	}

}
