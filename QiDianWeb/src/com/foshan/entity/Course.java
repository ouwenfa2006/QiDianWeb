package com.foshan.entity;

import java.io.Serializable;
import java.util.List;

public class Course implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer courseId;
	private String grade;
	private String couseName;
	private List<Student> students;//这个课程的报读学生
	public Integer getCourseId() {
		return courseId;
	}
	public void setCourseId(Integer courseId) {
		this.courseId = courseId;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCouseName() {
		return couseName;
	}
	public void setCouseName(String couseName) {
		this.couseName = couseName;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
}
