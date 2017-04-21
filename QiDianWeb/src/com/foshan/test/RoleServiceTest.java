package com.foshan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.Role;
import com.foshan.service.ParentService;
import com.foshan.service.RoleSerivce;

public class RoleServiceTest {
	private static ApplicationContext applicationContext;
	private static RoleSerivce roleSerivce;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		System.out.println(applicationContext);
		roleSerivce=applicationContext.getBean("roleService",RoleSerivce.class);
		System.out.println(roleSerivce);
	}
	public static void test_findRolesByUserid(){
		List<Role> roles=roleSerivce.findRolesByUserId(1);
		for (Role role : roles) {
			System.out.println(role.getRoleName());
		}
	
	};
	public static void main(String[] args) {
		test_findRolesByUserid();
	}
}
