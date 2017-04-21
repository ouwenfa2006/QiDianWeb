package com.foshan.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextTest {
	private static ApplicationContext applicationContext;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	public static void main(String[] args) {
		
	}
}
