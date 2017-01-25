package com.foshan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.foshan.service.LearningMaterialsService;
import com.foshan.service.UserService;

public class BaseController{
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="learningMaterialsService")
	private LearningMaterialsService learningMaterialsService;
	private  HttpServletRequest request; 
	private HttpServletResponse response;
	private HttpSession session;
	/**
	 * 封装request response及session
	 * @param request
	 * @param response
	 */
	@ModelAttribute
	public void setReqAndRes(HttpServletRequest request,HttpServletResponse response){
		this.request=request;
		this.response=response;
		this.session=request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	public HttpSession getSession() {
		return session;
	}
	public UserService getUserService() {
		return userService;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	@InitBinder(value="user")
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	public void getUser(WebDataBinder webDataBinder){
		webDataBinder.setFieldDefaultPrefix("user.");
	}
	@InitBinder
	public void convertDate(WebDataBinder webDataBinder){
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));  //true:允许输入空值，false:不能为空值  
	}
	public LearningMaterialsService getLearningMaterialsService() {
		return learningMaterialsService;
	}
	public void setLearningMaterialsService(
			LearningMaterialsService learningMaterialsService) {
		this.learningMaterialsService = learningMaterialsService;
	}
	
}
