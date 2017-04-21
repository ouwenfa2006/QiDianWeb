package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foshan.entity.Role;

public interface RoleMapper {
	List<Role> findRolesByUserId(@Param("userId")Integer userId);
	
}
