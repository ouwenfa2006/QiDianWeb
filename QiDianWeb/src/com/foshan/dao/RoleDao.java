package com.foshan.dao;

import java.util.List;

import com.foshan.entity.Role;

public interface RoleDao extends BaseDao<Role> {
	List<Role> findRolesByUserId(Integer id);
}
