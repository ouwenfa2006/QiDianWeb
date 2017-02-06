package com.foshan.test;

import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.Parent;
import com.foshan.service.LearningMaterialsService;
import com.foshan.service.ParentService;

public class ParentServiceTest {
	private static ApplicationContext applicationContext;
	private static ParentService parentService;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		parentService=applicationContext.getBean("parentService",ParentService.class);
	}
	public static void test_init(){
		System.out.println(parentService);
	}
	public static void test_addParent(){
		Parent parent=new Parent();
		parent.setParentName("陈露");
		parent.setParentPhone(Long.parseLong("13516553143"));
		parent.setCreateDate(new Date());
		parentService.addParent(parent);
	}
	public static void main(String[] args) {
		test_addParent();
	}
}
