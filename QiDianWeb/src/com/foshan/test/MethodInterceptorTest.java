package com.foshan.test;

import org.junit.Test;

import com.foshan.aop.CglibProxyBeanFactory;
import com.foshan.service.UserService;
import com.foshan.service.UserServiceImpl;

public class MethodInterceptorTest {
	@Test
	public void test_proxy(){
		UserService service=(UserService) new CglibProxyBeanFactory().createProxy(new UserServiceImpl());
		
	}
}
