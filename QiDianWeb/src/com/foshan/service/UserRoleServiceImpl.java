package com.foshan.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.UserRoleDao;

@Service(value="userRoleService")
@Transactional(value="dataSourceTransactionManager")
public class UserRoleServiceImpl implements UserRoleService {
	@Resource(name="userRoleDao")
	private UserRoleDao userRoleDao;
	@Override
	public void add(Integer userId, Integer roleId) {
		// TODO Auto-generated method stub
		userRoleDao.add(userId, roleId);
	}

}
