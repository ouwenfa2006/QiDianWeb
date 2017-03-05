package com.foshan.controller;

import java.util.Date;

import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/chat")
public class ChatController extends BaseController{
	public static Logger logger=Logger.getLogger(ChatController.class);
	@RequestMapping(value="/{teacherId}",method=RequestMethod.GET)
	public String chat(HttpServletRequest request,@PathVariable String teacherId){
		request.setAttribute("chatTime", new Date());
		
		return "/teachers/chat";
	}
}
