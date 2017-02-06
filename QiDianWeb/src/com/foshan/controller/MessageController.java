package com.foshan.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foshan.entity.Parent;

@Controller
@RequestMapping(value="/messageController",produces="text/html;charset=UTF-8")
public class MessageController extends BaseController{
	public static Logger logger=Logger.getLogger(MessageController.class);
	@RequestMapping(value="addMessage")
	@ResponseBody
	public String addMessage(HttpServletRequest request){
		String parentName=request.getParameter("parentName");
		String parentPhone=request.getParameter("parentPhone");
		getModelService().addParent(parentName,parentPhone);
		return "success";
	}
}
