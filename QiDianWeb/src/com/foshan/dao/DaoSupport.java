package com.foshan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.foshan.entity.RowMapper;
import com.foshan.util.JdbcUtil;
/**
 * 通用dao
 * @author Administrator
 *
 * @param <T>
 */
public class DaoSupport<T> implements Dao<T>{

	@Override
	public int addObject(String sql, Object... objects) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		int n=0;
		try {

			connection=JdbcUtil.getConnetion();
			preparedStatement=connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}
			n=preparedStatement.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(preparedStatement, null);
		}
		return n;
	}

	@Override
	public T findObject(String sql,RowMapper<T> rowMapper, Object... objects) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		T t=null;
		try {

			connection=JdbcUtil.getConnetion();
			preparedStatement=connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				t=rowMapper.getObject(resultSet);
				return t;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(preparedStatement, resultSet);
		}
		return t;
	}
	@Override
	public int getMaxId(String tableName) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		try {
			connection=JdbcUtil.getConnetion();
			String sql="select max(id) from "+tableName;
			preparedStatement=connection.prepareStatement(sql);
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				return resultSet.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<T> findAll(String sql,RowMapper<T> rowMapper, Object... objects) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		ResultSet resultSet=null;
		List<T> list=new ArrayList<T>();
		try {
			connection=JdbcUtil.getConnetion();
			preparedStatement=connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}
			resultSet=preparedStatement.executeQuery();
			while(resultSet.next()){
				T t=rowMapper.getObject(resultSet);
				list.add(t);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(preparedStatement, resultSet);
		}
		return list;
	}

	@Override
	public void update(String sql, Object... objects) {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		try {
			connection=JdbcUtil.getConnetion();
			preparedStatement=connection.prepareStatement(sql);
			for (int i = 0; i < objects.length; i++) {
				preparedStatement.setObject(i+1, objects[i]);
			}
			int n=preparedStatement.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(preparedStatement, null);
		}
		
	}
	
}
