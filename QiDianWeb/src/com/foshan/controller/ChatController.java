package com.foshan.controller;

import java.util.Date;

import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/chat")
public class ChatController extends BaseController{
	public static Logger logger=Logger.getLogger(ChatController.class);
	/**
	 * 打开聊天窗口
	 * @param request
	 * @param teacherId
	 * @return
	 */
	@RequestMapping(value="/{teacherId}",method=RequestMethod.GET)
	public String chat(HttpServletRequest request,@PathVariable String teacherId){
		request.setAttribute("chatTime", new Date());
		HttpSession session = request.getSession();
		String sessionId=session.getId();
		session.removeAttribute("chat_admin_text");
		session.setAttribute("chat_admin_text", "管理员：你好！请问有什么可以帮到你的了?");
		return "/teachers/chat";
	}
	/**
	 * 客户对管理员的聊天
	 * @return
	 */
	@RequestMapping(value="/admin",method=RequestMethod.POST)
	@ResponseBody
	public String chatToAdmin(HttpServletRequest request){
		
		return null;
	}
}
