package com.foshan.entity;

import java.io.Serializable;

/**
 * 权限类
 * @author Administrator
 *
 */
public class Action implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer actionId;
	private String name;
	private Integer parent_Id;
	private String description;
	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}
	public Integer getActionId() {
		return actionId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParent_Id() {
		return parent_Id;
	}
	public void setParent_Id(Integer parent_Id) {
		this.parent_Id = parent_Id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
