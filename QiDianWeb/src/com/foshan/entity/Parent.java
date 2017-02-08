package com.foshan.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * 家长
 * @author Administrator
 *
 */
public class Parent implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer parentId;
	private String parentName;
	private Long parentPhone;
	private Date  createDate;
	private List<Student> childrens;
	
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
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
}
