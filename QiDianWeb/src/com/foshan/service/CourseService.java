package com.foshan.service;

import java.util.List;

import com.foshan.entity.Course;

public interface CourseService {
	List<Course> findCourses(String grade,String courseName,int start,int size);
	Course findCourse(String grade,String courseName);
}
