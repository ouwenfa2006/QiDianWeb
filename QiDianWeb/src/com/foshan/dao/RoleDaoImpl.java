package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.Role;
import com.foshan.mapper.RoleMapper;
@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoSupport<Role> implements RoleDao{
	@Resource(name="roleMapper")
	private RoleMapper roleMapper;
	@Override
	public List<Role> findRolesByUserId(Integer id) {
		// TODO Auto-generated method stub
		return roleMapper.findRolesByUserId(id);
	}
	
}
