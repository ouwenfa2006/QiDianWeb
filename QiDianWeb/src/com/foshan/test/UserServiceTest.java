package com.foshan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.Image;
import com.foshan.entity.LearningMaterials;
import com.foshan.entity.Role;
import com.foshan.entity.User;
import com.foshan.service.UserRoleService;
import com.foshan.service.UserService;
import com.foshan.util.Constant;

public class UserServiceTest {
	private static ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
	private static UserService userService=applicationContext.getBean("userService",UserService.class);
	private static UserRoleService userRoleService=applicationContext.getBean("userRoleService",UserRoleService.class);
	public static void test_addUser(){
		User user=new User();
		user.setUserName("Hello");
		user.setPassword("tiger");
		userService.addUser(user);
		User user2=userService.findUserByUserName("Hello");
		userRoleService.add(user2.getUserId(), 1);
		
		
		
	}
	public static void test_userService_findUserById(){
		User user=userService.findUserById(1);
		System.out.println(user);
		System.out.println(user.getUserName());
		System.out.println(user.getPassword());
		List<LearningMaterials> list=user.getLearningMaterials_list();
		System.out.println(list);
		System.out.println(list.size());
		for (LearningMaterials learningMaterials : list) {
			System.out.println(learningMaterials.getlId());
			System.out.println(learningMaterials.getFileName());
		}
	}
	public static void test_userService_findUserAndMaterialsById(){
		User user=userService.findUserAndMaterialsById(1);
		List<LearningMaterials> list=user.getLearningMaterials_list();
		for (LearningMaterials learningMaterials : list) {
			System.out.println(learningMaterials.getlId());
			System.out.println(learningMaterials.getFileName());
		}
	}
	public static void test_userService_deleteUserById(){
		userService.delteUserById(1);
	}
	public static void test_userService_login(){
		User user=new User();
		user.setUserName("scott");
		user.setPassword("tiger");
		User user0=userService.login(user);
		System.out.println(user0);
		if(user0!=null){
			System.out.println(user0.getUserName());
			System.out.println(user0.getPassword());
		}
	}
	public static void test_userService_findUserByUserName(){
		User user=userService.findUserByUserName("scott");
		System.out.println(user);
		
	}
	public static void test_findUserAndRolesById(){
		User user=userService.findUserAndRolesById(1);
		System.out.println(user);
		System.out.println("userId:"+user.getUserId());
		System.out.println("userName:"+user.getUserName());
		List<Role> list=user.getRoles();
		for (Role role : list) {
			System.out.println("roleId:"+role.getRoleId());
			System.out.println("roleName:"+role.getRoleName());
		}
	}
	public static void test_findUserAndImageById(){
		User user=userService.findUserAndImageById(2);
		System.out.println(user.getUserId());
		System.out.println(user.getUserName());
		List<Image> images=user.getImages();
		if(images!=null&&images.size()>0){
			for (Image image : images) {
				System.out.println(image.getImageId());
				System.out.println(image.getRelativePath());
				System.out.println(image.getUser());
			}
		}
		System.out.println("======================================================");
	};
	public static void test_finadUsersAndImages(){
		List<User> fineTeachers=userService.findUsersAndImagesfindUsersAndImages(1, 1500, null, null, "teacher", 1);
		for (User user : fineTeachers) {
			System.out.println(user.getUserId());
			/*System.out.println(user.getUserName());
			List<Image> images=user.getImages();
			for (Image image : images) {
				System.out.println(image.getImageId());
				System.out.println(image.getRelativePath());
			}
			System.out.println("===========================================");*/
		}
	}
	public static void test_addTeachers(){
		List<User> users=userService.findUsersAndImagesfindUsersAndImages(1, 100, null, null, "teacher", null);
		System.out.println(users.size());
		for(int i=0;i<60000;i++){
			for (User user : users) {
				userService.addUser(user);
			}
		}
	};
	public static void main(String[] agrs){
		//test_userService_findUserAndMaterialsById();
		//test_findUserAndImageById();
		//test_finadUsersAndImages();
		test_addTeachers();
	}

}
