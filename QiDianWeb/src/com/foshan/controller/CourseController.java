package com.foshan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.text.html.FormSubmitEvent.MethodType;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.foshan.entity.Course;



@Controller
@RequestMapping("/course")
public class CourseController extends BaseController{
	public static Logger logger=Logger.getLogger(CourseController.class);
	private static Integer pageSize=5;
	@RequestMapping(value="/search")
	public String search(HttpServletRequest request,String grade,String courseName){
		if(grade!=null&&grade.equals("全部")){
			grade=null;
		}
		if(courseName!=null&&courseName.equals("全部")){
			courseName=null;
		}
		
		List<Course> courses = getModelService().getCourseService().findCourses(grade, courseName, 1, 1500);
		if(courses!=null&&courses.size()>0){
			savePageInfos(request, courses, pageSize);
		}
		return "/classes/class_1";
	}
	@RequestMapping(value="/getCoursesFromList",method=RequestMethod.GET)
	public String getCoursesFromList(HttpServletRequest request){
		getInfosFromList(request, pageSize);
		return "/classes/class_1";
	}
}
