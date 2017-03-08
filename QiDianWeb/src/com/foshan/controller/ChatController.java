package com.foshan.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foshan.entity.Role;
import com.foshan.entity.User;
import com.foshan.service.RoleSerivce;
import com.foshan.util.Constant;

@Controller
@RequestMapping(value="/chat")
public class ChatController extends BaseController{
	public static Logger logger=Logger.getLogger(ChatController.class);
	private static Set<String> set=new HashSet<String>();//用于管理聊天的对象
	private static Integer size=0;
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
		set.add(sessionId);
		request.removeAttribute("chat_admin_text");
		request.setAttribute("chat_admin_text", "管理员：你好！请问有什么可以帮到你的了?");
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
	/**
	 * 监听临时会话
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/checkSet",method=RequestMethod.GET)
	@ResponseBody
	public String checkSetAndOpenChat(HttpServletRequest request){
		User user=(User) request.getSession().getAttribute(Constant.SESSION_USER);
		if(size<set.size()){
			size=set.size();
			return "1";//1打开会话窗口
		}
		return "-1";
	}
	

}
