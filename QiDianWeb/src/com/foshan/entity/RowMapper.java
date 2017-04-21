package com.foshan.entity;

import java.sql.ResultSet;

public interface RowMapper<T> {
	T getObject(ResultSet resultSet);
}
