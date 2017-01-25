package com.foshan.service;

import javax.annotation.Resource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.jasypt.util.password.PasswordEncryptor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.UserDao;
import com.foshan.entity.User;
@Service(value="userService")
@Transactional(value="dataSourceTransactionManager")
public class UserServiceImpl implements UserService{
	@Resource(name="userDao")
	private UserDao userDao;
	

	@Override
	@Transactional(readOnly=true)
	public User findUserById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserById(id);
	}


	@Override
	public void addUser(User user) {
		// TODO Auto-generated method stub
		PasswordEncryptor passwordEncryptor=new BasicPasswordEncryptor();
		String password=passwordEncryptor.encryptPassword(user.getPassword());
		user.setPassword(password);
		userDao.addUser(user);
	}


	@Override
	public User findUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.findUserByUserName(userName);
	}


	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		User user2=findUserByUserName(user.getUserName());
		if(user2!=null){
			BasicPasswordEncryptor encryptor=new BasicPasswordEncryptor();
			boolean ok=encryptor.checkPassword(user.getPassword(), user2.getPassword());
			if(ok==true){
				return user2;
			}
		}
		return null;
	}


	@Override
	public void delteUserById(int...ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			userDao.deleteUserById(id);
		}
	}


	@Override
	public User findUserAndMaterialsById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserAndMaterialsById(id);
	}
	@Override
	public User findUserAndRolesById(int id) {
		// TODO Auto-generated method stub
		return userDao.findUserAndRolesById(id);
	}
	
}
