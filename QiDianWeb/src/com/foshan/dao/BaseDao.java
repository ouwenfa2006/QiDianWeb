package com.foshan.dao;

import java.util.List;

public interface BaseDao<T> {
	public List<T> find(String sql, Object[] parameters, Class<T> cl);
	public int addOrUpdateOrDelete(String sql, final Object[] parameters,Class<T> cl);
}
