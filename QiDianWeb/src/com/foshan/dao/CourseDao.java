package com.foshan.dao;

import java.util.List;

import com.foshan.entity.Course;

public interface CourseDao extends BaseDao<Course>{
	List<Course> findCourses(String grade,String courseName,int start,int size);
	Course findCourse(String grade,String courseName);
}
