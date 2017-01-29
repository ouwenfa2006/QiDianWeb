package com.foshan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foshan.entity.User;
import com.foshan.util.PageUtil;

@Controller
@RequestMapping(value="/teacherInfoController")
public class TeacherInfoController extends BaseController{
	private int pageSize=16;
	/**
	 * 进入教师信息页面
	 * @return
	 */
	@RequestMapping("/getTeachersInfo")
	public String getTeachersInfo(HttpServletRequest request){
		//搜索所有结果
		List<User> teachers=getUserService().findUsersAndImagesfindUsersAndImages(1, 1500, null, null, "teacher");
		//保存页面参数
		//savePageInfos(request, teachers);
		PageUtil.savePageInfos(request, teachers, pageSize);
		return "/teachers/teachersInfo";
	}
	/**
	 * 根据搜索的结果集进页显示
	 * @param request
	 * @param teachers
	 *//*
	private void savePageInfos(HttpServletRequest request, List<User> teachers) {
		request.getSession().removeAttribute("list");
		request.getSession().setAttribute("list", teachers);
		if(teachers!=null&&teachers.size()>0){
			//第一页的结果
			List<User> page_list=PageUtil.getShow(teachers,1,pageSize);
			request.setAttribute("page_list", page_list);
			for (User user : page_list) {
				System.out.println("ID:"+user.getUserId());
				System.out.println("nickNme:"+user.getNickName());
				System.out.println("courseName:"+user.getCourseName());
				System.out.println("imgeURL:"+user.getImages().get(0).getRelativePath());
				System.out.println("================================================================================");
			}
		}
		//保存页面参数
		request.setAttribute("page",1);
		getSession().removeAttribute("totalPage");
		int result=teachers.size()%pageSize;
		if(result==0){
			getSession().setAttribute("totalPage", teachers.size()/pageSize);
		}else{
			getSession().setAttribute("totalPage", teachers.size()/pageSize+1);
		}
		
	}*/
	
}
