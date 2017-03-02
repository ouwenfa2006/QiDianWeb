package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.foshan.dao.CourseDao;
import com.foshan.entity.Course;
@Service(value="courseService")
public class CourseServiceImpl implements CourseService{
	@Resource(name="courseDao")
	private CourseDao courseDao;
	/**
	 * 取得所有的销售课程
	 */
	@Override
	public List<Course> findCourses(String grade,String courseName,int start, int size) {
		start=(start-1)*size;
		List<Course> courses = courseDao.findCourses(grade,courseName,start,size);
		if(courses!=null&courses.size()>0){
			return courses;
		}
		return null;
	}

	@Override
	public Course findCourse(String grade, String courseName) {
		// TODO Auto-generated method stub
		return courseDao.findCourse(grade, courseName);
	}

}
