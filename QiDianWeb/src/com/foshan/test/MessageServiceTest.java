package com.foshan.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.Message;
import com.foshan.entity.Parent;
import com.foshan.entity.User;
import com.foshan.service.MessageService;

public class MessageServiceTest {
	private static ApplicationContext applicationContext;
	private static MessageService messageService;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		messageService=applicationContext.getBean("messageService",MessageService.class);
	}
	public static void test_init(){
		System.out.println(messageService);
	}
	public static void test_addMessageFromParentToUser(){
		Message message=new Message();
		message.setText("你好！欧老师");
		Parent fromParent=new Parent();
		fromParent.setParentId(1);
		User user1=new User();
		user1.setUserId(1);
		User user2=new User();
		user2.setUserId(2);
		message.setFromParent(fromParent);
		List<User> toUsers=new ArrayList<User>();
		toUsers.add(user1);
		toUsers.add(user2);
		message.setToUsers(toUsers);
		message.setCreateDate(new Date());
		messageService.addMessageFromParentToUser(message);
	}
	public static void test_findAllNewMessages(){
		List<Message> messages=messageService.findAllNewMessages();
		for (Message message : messages) {
			System.out.println(message);
		}
	}
	public static void main(String[] args) {
		//test_addMessageFromParentToUser();
		test_findAllNewMessages();
	}
}
