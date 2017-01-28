package com.foshan.entity;



import java.io.Serializable;
import java.util.List;
/**
 * 用户类
 * @author Administrator
 *
 */
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String userName;
	private String password;
	private List<LearningMaterials> learningMaterials_list;//学习资料
	private List<User> students;
	private List<Role> roles;	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<LearningMaterials> getLearningMaterials_list() {
		return learningMaterials_list;
	}
	public void setLearningMaterials_list(
			List<LearningMaterials> learningMaterials_list) {
		this.learningMaterials_list = learningMaterials_list;
	}
	public List<User> getStudents() {
		return students;
	}
	public void setStudents(List<User> students) {
		this.students = students;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
