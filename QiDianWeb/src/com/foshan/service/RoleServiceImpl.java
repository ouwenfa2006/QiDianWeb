package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.RoleDao;
import com.foshan.entity.Role;
@Service(value="roleService")
@Transactional(value="dataSourceTransactionManager",rollbackFor=Exception.class)
public class RoleServiceImpl implements RoleSerivce{
	@Resource(name="roleDao")
	private RoleDao roleDao;
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Role> findRolesByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return roleDao.findRolesByUserId(userId);
	}

}
