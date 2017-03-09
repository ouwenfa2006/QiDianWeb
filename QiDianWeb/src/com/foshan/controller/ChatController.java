package com.foshan.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.enterprise.inject.New;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
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
	private static List<String> sessions=new ArrayList<String>();//用于管理聊天的对象
	private static Integer size=0;
	/**
	 * 打开聊天窗口
	 * @param request
	 * @param teacherId
	 * @return
	 */
	@RequestMapping(value="/{teacherId}",method=RequestMethod.GET)
	public String chat(HttpServletRequest request,@PathVariable String teacherId){
		//如果管理员在线
		//如果管理员不在线
		request.setAttribute("chatTime", new Date());
		HttpSession session = request.getSession();
		String sessionId=session.getId();
		if(sessions.contains(sessionId)==false){
			sessions.add(sessionId);
		}
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
	 * @throws JSONException 
	 */
	@RequestMapping(value="/checkSet",method=RequestMethod.GET)
	@ResponseBody
	public String checkSetAndOpenChat(HttpServletRequest request) throws JSONException{
		if(size<sessions.size()){
			int count=sessions.size()-size;
			JSONArray jsonArray=new JSONArray();
			for(int i=1;i<=count;i++){
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("sessionId", sessions.get(sessions.size()-i));
				jsonArray.put(jsonObject);
			}
			size=sessions.size();
			return jsonArray.toString();//1打开会话窗口
		}
		return "-1";
	}
	@RequestMapping(value="/new/{sessionId}",method=RequestMethod.GET)
	public String chatToClient(HttpServletRequest request,@PathVariable String sessionId){
		request.removeAttribute("chat_admin_text");
		request.setAttribute("chat_admin_text", "管理员：你好！请问有什么可以帮到你的了?");
		return "/teachers/chat";
	}
	

}
