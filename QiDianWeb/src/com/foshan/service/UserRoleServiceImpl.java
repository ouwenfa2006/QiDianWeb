package com.foshan.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foshan.dao.UserRoleDao;

@Service(value="userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	@Resource(name="userRoleDao")
	private UserRoleDao userRoleDao;
	@Override
	public void add(int userId, int roleId) {
		// TODO Auto-generated method stub
		userRoleDao.add(userId, roleId);
	}

}
