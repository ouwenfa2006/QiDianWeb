package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foshan.entity.Course;

public interface CourseMapper {
	List<Course> findCourses(@Param("grade")String grade,@Param("courseName") String courseName, @Param("start")int start,@Param("size")int size);
	Course findCourse(@Param("grade")String grade,@Param("courseName")String courseName);
}
