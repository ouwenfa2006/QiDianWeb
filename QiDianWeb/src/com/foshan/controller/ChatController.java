package com.foshan.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.TypeMismatchException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foshan.entity.ChatMessage;
import com.foshan.entity.Role;
import com.foshan.entity.User;
import com.foshan.entityVO.ChatMessageVO;
import com.foshan.service.ChatMessageService;
import com.foshan.service.RoleSerivce;
import com.foshan.util.Constant;
import com.foshan.util.JsonUtil;
import com.foshan.util.SessionManager;

@Controller
@RequestMapping(value="/chat",produces="text/html;charset=UTF-8")
public class ChatController extends BaseController{
	public static Logger logger=Logger.getLogger(ChatController.class);
	public static Integer size=0;
	/**
	 * 打开与管理员的聊天窗口
	 * @param request
	 * @param teacherId
	 * @return
	 */
	@RequestMapping(value="/newAdmin/{teacherId}",method=RequestMethod.GET)
	public String chat(HttpServletRequest request,@PathVariable String teacherId){
		//查找在线管理员
		//User user=getModelService().getUserService().findAdminOnline().get(0);
		//如果管理员不在线
		request.setAttribute("chatTime", new Date());
		request.setAttribute("toChaterId", 1);
		HttpSession session = request.getSession();
		String sessionId=session.getId();
		SessionManager.addSessionId(sessionId);
		request.setAttribute("client_sessionId", sessionId);
		
		request.setAttribute("chat_admin_text", "管理员：你好！请问有什么可以帮到你的了?");
		return "/teachers/chat0";
	}
	/**
	 * 对管理员传递消息
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/message/admin",method=RequestMethod.POST)
	@ResponseBody
	public String chatToAdmin(@ModelAttribute("cmsg") ChatMessage chatMessage) throws ParseException{
		chatMessage.setChatKey(0);
		getModelService().getChatMessageService().addChatMessage(chatMessage);
		return "1";
	}
	/**
	 * 对游客传递消息
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/message/client",method=RequestMethod.POST)
	@ResponseBody
	public String chatToClient(@ModelAttribute("cmsg") ChatMessage chatMessage) throws ParseException{
		chatMessage.setChatKey(1);
		getModelService().getChatMessageService().addChatMessage(chatMessage);
		return "1";
	}
	/**
	 * 取得发给游客的最新消息
	 * @param sessionId
	 * @param toChaterId
	 * @return
	 * @throws JSONException 
	 */
	@RequestMapping(value="/clientMsg",method=RequestMethod.GET)
	@ResponseBody
	public String adminMsg(String sessionId,Integer toChaterId) throws JSONException{
		List<ChatMessage> chatMessages=getModelService().getChatMessageService().findMessageFromAdmin(sessionId,0,toChaterId);
		if(chatMessages!=null&&chatMessages.size()>0){
			JSONArray array=new JSONArray();
			/*System.out.println("****************发给游客的最新消息********************");*/
			for (ChatMessage chatMessage : chatMessages) {
				array.put(JsonUtil.getJsonObject(chatMessage));
				getModelService().getChatMessageService().updateMessageFromAdmin(sessionId,0,toChaterId);
			}
		/*	System.out.println("给游客的信息"+array.toString());*/
			return array.toString();
		}
		return "-1";
	}
	/**
	 * 取得发给管理员的最新消息
	 * @param sessionId
	 * @param toChaterId
	 * @return
	 * @throws JSONException 
	 */
	@RequestMapping(value="/adminMsg",method=RequestMethod.GET)
	@ResponseBody
	public String clientMsg(String sessionId,Integer toChaterId) throws JSONException{
		List<ChatMessage> chatMessages=getModelService().getChatMessageService().findMessageFromClient(sessionId,0,toChaterId);
		if(chatMessages!=null&&chatMessages.size()>0){
			JSONArray array=new JSONArray();
			/*System.out.println("****************发给管理员的最新消息******************");*/
			for (ChatMessage chatMessage : chatMessages) {
				array.put(JsonUtil.getJsonObject(chatMessage));
				getModelService().getChatMessageService().updateMessageFromClient(sessionId,0,toChaterId);
			}
			/*System.out.println("给管理员的管理员"+array.toString());*/
			return array.toString();
		}
		return "-1";
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
		if(size<SessionManager.getSessionSize()){
			int count=SessionManager.getSessionSize()-size;
			JSONArray jsonArray=new JSONArray();
			for(int i=1;i<=count;i++){
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("client_sessionId", SessionManager.getSessionId(SessionManager.getSessionSize()-i));
				jsonArray.put(jsonObject);
			}
			size=SessionManager.getSessionSize();
			if(size==10){
				size=0;
				SessionManager.removeAll();
			}
			return jsonArray.toString();//1打开会话窗口
		}
		return "-1";
	}
	/**
	 * 打开与游客的聊天窗口
	 * @param request
	 * @param client_sessionId
	 * @return
	 */
	@RequestMapping(value="/newClient/{client_sessionId}",method=RequestMethod.GET)
	public String chatToClient(HttpServletRequest request,@PathVariable String client_sessionId){
		request.setAttribute("chatTime", new Date());
		request.setAttribute("client_sessionId", client_sessionId);
		User user=(User) request.getSession().getAttribute(Constant.SESSION_USER);
		request.setAttribute("toChaterId", user.getUserId());
		request.setAttribute("chat_admin_text", "管理员：你好！请问有什么可以帮到你的了?");
		return "/teachers/chat1";
	}
	
	

}
