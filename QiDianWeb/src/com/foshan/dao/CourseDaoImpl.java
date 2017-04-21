package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.Course;
import com.foshan.mapper.CourseMapper;
import com.foshan.mapper.MessageMapper;
@Repository(value="courseDao")
public class CourseDaoImpl extends BaseDaoSupport<Course> implements CourseDao{
	@Resource(name="courseMapper")
	private CourseMapper courseMapper;
	@Override
	public List<Course> findCourses(String grade,String courseName,int start,int size) {
		// TODO Auto-generated method stub
		return courseMapper.findCourses(grade,courseName,start,size);
	}
	
	@Override
	public Course findCourse(String grade, String courseName) {
		// TODO Auto-generated method stub
		return courseMapper.findCourse(grade, courseName);
	}

}
