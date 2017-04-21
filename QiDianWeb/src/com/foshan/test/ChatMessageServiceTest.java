package com.foshan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.ChatMessage;
import com.foshan.service.ChatMessageService;
import com.foshan.service.CourseService;

public class ChatMessageServiceTest {
	private static ApplicationContext applicationContext;
	private static ChatMessageService chatMessageService;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		chatMessageService=applicationContext.getBean("chatMessageService",ChatMessageService.class);
	}
	public  static void test_findBysessionId(){
		List<ChatMessage> lis=chatMessageService.findMessageFromClient("FFD696F2FC10DC2D9A94B8D86B0CF928",0,1);
		for (ChatMessage chatMessage : lis) {
			System.out.println(chatMessage);
		}
	}
	public static void main(String[] args) {
		test_findBysessionId();
	}
}
