package com.foshan.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Parent implements Serializable{
	private static final long serialVersionUID = 1L;
	private String parentId;
	private String parentName;
	private Long parentPhone;
	private Date  createDate;
	private List<Student> childrens;
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public List<Student> getChildrens() {
		return childrens;
	}
	public void setChildrens(List<Student> childrens) {
		this.childrens = childrens;
	}
	public Long getParentPhone() {
		return parentPhone;
	}
	public void setParentPhone(Long parentPhone) {
		this.parentPhone = parentPhone;
	}
	
}
