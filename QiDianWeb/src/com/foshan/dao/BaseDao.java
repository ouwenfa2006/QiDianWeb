package com.foshan.dao;

import java.util.List;

public interface BaseDao<T> {
	public List<T> find(String sql, Class<T> entityClass,Object...parameters);
	public int addOrUpdateOrDelete(String sql,Class<T> cl,final Object...parameters);
	public Integer findMaxId(String sql);
}
