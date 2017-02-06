package com.foshan.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCallback;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

/**
 * 通用dao
 * @author Administrator
 *
 * @param <T>
 */
@Repository(value="baseDao")
public class BaseDaoSupport<T> implements BaseDao<T> {
	@Resource(name="jdbcTemplate")
	private JdbcTemplate jdbcTemplate;
	public List<T> find(String sql, Object[] parameters, Class<T> cl) {

		List<T> resultList = null;
		try {
			if (parameters != null && parameters.length > 0)
				resultList = jdbcTemplate.query(sql, parameters,
						new BeanPropertyRowMapper<T>(cl));
			else
				// BeanPropertyRowMapper是自动映射实体类的
				resultList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<T>(cl));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	/***
	  * 添加，更新，删除的实现，返回1,0,-1
	  */
	 public int addOrUpdateOrDelete(String sql, final Object[] parameters,
	   Class<T> cl) {

	  int num = 0;
	  try {
	   if (parameters == null || parameters.length == 0)
	    num = jdbcTemplate.update(sql);
	   else
	    num = jdbcTemplate.update(sql, new PreparedStatementSetter() {

	     @Override
	     public void setValues(PreparedStatement ps)
	       throws SQLException {

	      for (int i = 0; i < parameters.length; i++)
	       ps.setObject(i + 1, parameters[i]);
	     }
	    });
	  } catch (Exception e) {
	   e.printStackTrace();
	   num = -1;
	  }
	  return num;
	 }




}
