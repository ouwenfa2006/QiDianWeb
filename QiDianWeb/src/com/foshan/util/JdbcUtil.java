package com.foshan.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtil {
	private static Properties properties=new Properties();
	private static ThreadLocal<Connection> threadLocal=new ThreadLocal<Connection>();
	
	static{
		try {
			properties.load(JdbcUtil.class.getResourceAsStream("/jdbc.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static String getProperty(String propName){
		return properties.getProperty(propName);
	}
	public static Connection getConnetion(){
		Connection connection=threadLocal.get();
		if(connection==null){
			try {
				Class.forName(getProperty("driverClassName"));
				connection=DriverManager.getConnection(getProperty("url"), getProperty("user"), getProperty("password"));
				threadLocal.set(connection);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return connection;
	}
	public static void commit(){
		try {
			threadLocal.get().commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollBack(){
		try {
			threadLocal.get().rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void closeConnection(){
		try {
			Connection  connection=threadLocal.get();
			if(!(connection==null)){
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void close(PreparedStatement preparedStatement,ResultSet resultSet){
		try {
			if(preparedStatement!=null){
				preparedStatement.close();
			}
			if(resultSet!=null){
				resultSet.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	};
	public static void closeAutoCommit(){
		try {
			threadLocal.get().setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
