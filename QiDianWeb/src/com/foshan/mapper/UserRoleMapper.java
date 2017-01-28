package com.foshan.mapper;

import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper {
	void add(@Param("userId") Integer userId,@Param("roleId") Integer roleId);
}
