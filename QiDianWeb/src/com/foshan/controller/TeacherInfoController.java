package com.foshan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foshan.entity.User;
import com.foshan.util.JsonUtil;
import com.foshan.util.PageUtil;

@Controller
@RequestMapping(value="/teacherInfoController")
public class TeacherInfoController extends BaseController{
	public static Logger logger=Logger.getLogger(TeacherInfoController.class);
	private int pageSize=16;
	/**
	 * 进入教师信息页面
	 * @return
	 */
	@RequestMapping("/getTeachersInfo")
	public String getTeachersInfo(HttpServletRequest request){
		return "/teachers/teachersInfo";
	}
	/**
	 * 从搜索的结果集中进行分页显示
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/getTeachersFromList")
	public String getTeachersFromList(HttpServletRequest request){
		getInfosFromList(request, pageSize);
		return "/teachers/teachersInfo_list";
	}
	@RequestMapping(value="/getDatas")
	public  String getDatas(HttpServletRequest request){
		//搜索所有结果,以前1500记录作为查询范围
		List<User> teachers=getModelService().getUserService().findUsersAndImagesfindUsersAndImages(1, 1500, null, null, "teacher",null);
		//保存页面参数,以作分页
		savePageInfos(request, teachers, pageSize);
		return "/teachers/teachersInfo_list";
	}
	/**
	 * 查询老师
	 * @param request
	 * @param grade
	 * @return
	 */
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public  String search(HttpServletRequest request){
		//搜索所有结果,以前1500记录作为查询范围
		String grade=request.getParameter("grade");
		String courseName=request.getParameter("courseName");
		if(grade!=null&&grade.equals("全部")){
			grade=null;
		}
		if(courseName!=null&&courseName.equals("全部")){
			courseName=null;
		}
		//查询所有
		List<User> teachers=getModelService().getUserService().findUsersAndImagesfindUsersAndImages(1, 1500, grade, courseName, "teacher",null);

		//保存页面参数,以作分页
		savePageInfos(request, teachers, pageSize);
		return "/teachers/teachersInfo_list";
	}
	/**
	 * 取得优秀老师
	 * @param request
	 * @return
	 * @throws JSONException
	 */
	@RequestMapping(value="/findFineTeachers",produces="text/html;charset=UTF-8")
	@ResponseBody
	public String findFineTeachers(HttpServletRequest request) throws JSONException{
		String grade=request.getParameter("grade");
		String courseName=request.getParameter("courseName");
		if(grade!=null&&grade.equals("全部")){
			grade=null;
		}
		if(courseName!=null&&courseName.equals("全部")){
			courseName=null;
		}
		//查找优秀老师
		List<User> fineTeachers=getModelService().getUserService().findUsersAndImagesfindUsersAndImages(1, 1500, grade, courseName, "teacher", 1);
		JSONArray jsonArray=new JSONArray();
		for (User user : fineTeachers) {
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("nickName", user.getNickName());
			jsonObject.put("relativePath", user.getImages().get(0).getRelativePath());
			jsonObject.put("userId", user.getUserId());
			jsonArray.put(jsonObject);
		}
		return jsonArray.toString();
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
