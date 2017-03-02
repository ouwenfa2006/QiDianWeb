package com.foshan.dao;


import java.util.List;

import com.foshan.entity.RowMapper;
public interface Dao<T> {
	int addObject(String sql,Object...objects);
	T findObject(String sql,RowMapper<T> rowMapper,Object...objects);
	int getMaxId(String tableName);
	List<T> findAll(String sql,RowMapper<T> rowMapper,Object...objects);
	void update(String sql,Object...objects);

}
