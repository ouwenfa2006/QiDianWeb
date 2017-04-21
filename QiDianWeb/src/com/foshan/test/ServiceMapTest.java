package com.foshan.test;

import java.util.Map;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.service.UserService;

public class ServiceMapTest {
	public static ApplicationContext context;
	public static Map serviceMap;
	static{
		context=new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
		serviceMap=(Map) context.getBean("serviceMap");
	}
	public static void main(String[] args) {
		System.out.println(serviceMap);
		UserService userService=(UserService) serviceMap.get("userService");
		System.out.println(userService);
	}
}
