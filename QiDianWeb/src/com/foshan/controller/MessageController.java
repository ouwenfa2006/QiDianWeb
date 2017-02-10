package com.foshan.controller;

import java.text.SimpleDateFormat;
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
	/**
	 * 添加家长咨询信息
	 * @param request
	 * @return
	 */
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
	/**
	 * 查找所有新咨询的信息
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping(value="/findNewAllMessages")
	@ResponseBody
	public String findNewAllMessages() throws JSONException{
		List<Message> messages=getModelService().getMessageService().findAllNewMessages();
		JSONArray jsonArray=new JSONArray();
		for (Message message : messages) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("messageId", message.getMessageId());
			jsonObject.put("text", message.getText());
			jsonObject.put("createTime",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(message.getCreateDate()));
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
	}
	/**
	 * 查的最后一条咨询信息
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping(value="/findLastNewMessage")
	@ResponseBody
	public String findLastNewMessage() throws JSONException{
		System.out.println(123);
		Message message=getModelService().getMessageService().findLastNewMessage();
		JSONArray jsonArray=new JSONArray();
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("messageId", message.getMessageId());
		jsonObject.put("text", message.getText());
		jsonObject.put("createTime",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(message.getCreateDate()));
		jsonArray.put(jsonObject);
		return jsonArray.toString();
	}

}
