package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.jasypt.util.password.PasswordEncryptor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.UserDao;
import com.foshan.entity.User;
@Service(value="userService")
@Transactional(value="dataSourceTransactionManager",rollbackFor=Exception.class)
public class UserServiceImpl implements UserService{
	@Resource(name="userDao")
	private UserDao userDao;
	

	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public User findUserById(Integer id) {
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
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
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
	public void delteUserById(Integer...ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			userDao.deleteUserById(id);
		}
	}


	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public User findUserAndMaterialsById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserAndMaterialsById(id);
	}
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public User findUserAndRolesById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserAndRolesById(id);
	}
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public User findUserAndImageById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findUserAndImageById(id);
	}
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<User> findUsersAndImagesfindUsersAndImages(int page,
			int pageSize, String grade, String courseName,String roleName,Integer level) {
		int start=(page-1)*pageSize;
		return userDao.findUsersAndImages(start, pageSize, grade, courseName,roleName,level);
	}
	
}
