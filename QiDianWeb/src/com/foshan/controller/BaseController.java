package com.foshan.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.foshan.service.ModelService;
import com.foshan.service.UserService;
import com.foshan.util.PageUtil;

public class BaseController{
	@Resource(name="modelService")
	private ModelService modelService;
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
	public void setModelService(ModelService modelService) {
		this.modelService = modelService;
	}
	public ModelService getModelService() {
		return modelService;
	}
	public HttpServletResponse getResponse() {
		return response;
	}
	public HttpSession getSession() {
		return session;
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
	/**
	 * 根据搜索的结果集分页显示,以page_list保存第一页的数据
	 * @param request
	 * @param list 搜索到的全部结果
	 * @param pageSize
	 */
	public void savePageInfos(HttpServletRequest request,List<?> list,int pageSize){
		HttpSession session=request.getSession();
		session.removeAttribute("list");
		session.setAttribute("list", list);
		if(list!=null&&list.size()>0){
			//第一页的结果
			List<?> page_list=PageUtil.getShow(list,1,pageSize);
			request.setAttribute("page_list", page_list);
		}
		//保存页面参数
		request.setAttribute("page",1);
		session.removeAttribute("totalPage");
		int result=list.size()%pageSize;
		if(result==0){
			session.setAttribute("totalPage", list.size()/pageSize);
		}else{
			session.setAttribute("totalPage", list.size()/pageSize+1);
		}
	}
	/**
	 * 获取分页数据并保存
	 * @param request
	 * @param pageSize
	 */
	public void getInfosFromList(HttpServletRequest request,int pageSize){
		String page=request.getParameter("page");
		if(page==null){
			page="1";
		}
		if(page.equals("0")){
			page="1";
		}
		List list=(List) getSession().getAttribute("list");
		List page_list=PageUtil.getShow(list,Integer.parseInt(page),pageSize);
		request.setAttribute("page", Integer.parseInt(page));
		request.setAttribute("page_list", page_list);
	}
	
}
