package com.foshan.service;

import java.util.List;

import com.foshan.entity.Role;

public interface RoleSerivce {
	List<Role> findRolesByUserId(Integer userId);
}
