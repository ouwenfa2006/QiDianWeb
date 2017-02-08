package com.foshan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foshan.entity.Message;
import com.foshan.entity.Parent;
import com.foshan.util.JsonUtil;

@Controller
@RequestMapping(value="/messageController",produces="text/html;charset=UTF-8")
public class MessageController extends BaseController{
	public static Logger logger=Logger.getLogger(MessageController.class);
	@RequestMapping(value="addMessage")
	@ResponseBody
	public String addMessage(HttpServletRequest request){
		String parentName=request.getParameter("parentName");
		String parentPhone=request.getParameter("parentPhone");
		String grade=request.getParameter("grade");
		String courseName=request.getParameter("courseName");
		int n=getModelService().addParent(parentName,parentPhone,grade,courseName);
		if(n==1){
			return "success";
		}
		return "fail";
	}
	@RequestMapping(value="/findNewAllMessages")
	@ResponseBody
	public String findNewAllMessages() throws JSONException{
		List<Message> messages=getModelService().getMessageService().findAllNewMessages();
		JSONArray jsonArray=new JSONArray();
		for (Message message : messages) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("messageId", message.getMessageId());
			jsonObject.put("text", message.getText());
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	
}
