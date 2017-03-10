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
	private static Integer limit=1000000;
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
	@RequestMapping(value="findNewAllMessages")
	@ResponseBody
	public String findNewAllMessages() throws JSONException{
		List<Message> messages=getModelService().getMessageService().findAllNewMessages();
		if(messages!=null&&messages.size()>0){
			JSONArray jsonArray=new JSONArray();
			for (Message message : messages) {
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("messageId", message.getMessageId());
				jsonObject.put("text", message.getText());
				jsonObject.put("createTime",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(message.getCreateDate()));
				jsonArray.put(jsonObject);
				getModelService().getMessageService().clearNewMessageById(message.getMessageId());
			}
			return jsonArray.toString();
		}
		return "-1";
	}
	/**
	 * 查的最后一条咨询信息
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping(value="findLastNewMessage")
	@ResponseBody
	public String findLastNewMessage() throws JSONException{
		Message message=getModelService().getMessageService().findLastNewMessage();
		if(message!=null){
			JSONArray jsonArray=new JSONArray();
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("messageId", message.getMessageId());
			jsonObject.put("text", message.getText());
			jsonObject.put("createTime",new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(message.getCreateDate()));
			jsonArray.put(jsonObject);
			getModelService().getMessageService().clearNewMessageById(message.getMessageId());
			return jsonArray.toString();
		}
		return "-1";
	}
	/**
	 * 清除看过的信息
	 * @param request
	 * @param params
	 * @return
	 */
	@RequestMapping(value="clearNewMessages")
	@ResponseBody
	public String clearNewMessages(HttpServletRequest request,String params){
		String[] arrays=params.split(",");
		for (String string : arrays) {
			if(string!=""){
				getModelService().getMessageService().clearNewMessageById(Integer.parseInt(string));
			}
		}
		return "success";
	}

}
