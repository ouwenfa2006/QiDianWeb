package com.foshan.test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.foshan.entity.Course;
import com.foshan.service.CourseService;
import com.foshan.service.LearningMaterialsService;

public class CoueawServiceTest{
	private static ApplicationContext applicationContext;
	private static CourseService courseService;
	static{
		applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		courseService=applicationContext.getBean("courseService",CourseService.class);
	}
	public static void test_findCourses(){
		List<Course> courses = courseService.findCourses(null,null, 1, 1500);
		System.out.println(courses);
		for (Course course : courses) {
			System.out.println(course.getCourseId()+","+course.getCourseName());
		}
	}
	public static void main(String[] args) {
		test_findCourses();
	}
}