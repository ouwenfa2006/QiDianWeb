package com.foshan.listener;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 * @WebListener注解不用再在web.xml中配置
 * @author Administrator
 *
 */
@WebListener
public class StartupListener implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent arg0)  { 
  
    
    }
	public void contextInitialized(ServletContextEvent arg0)  { 
    	System.out.println("初始化容器...............................");
    	
    }

}
