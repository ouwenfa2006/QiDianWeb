package com.foshan.entity;

import java.io.Serializable;
import java.util.List;

public class Student implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer studentId;
	private String studentName;
	private Parent parent;
	private String school;
	private String grade;
	private Long studentPhone;
	private List<Course> courses;
	public Integer getStudentId() {
		return studentId;
	}
	public void setStudentId(Integer studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Parent getParent() {
		return parent;
	}
	public void setParent(Parent parent) {
		this.parent = parent;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public List<Course> getCourses() {
		return courses;
	}
	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}
	public Long getStudentPhone() {
		return studentPhone;
	}
	public void setStudentPhone(Long studentPhone) {
		this.studentPhone = studentPhone;
	}
}
