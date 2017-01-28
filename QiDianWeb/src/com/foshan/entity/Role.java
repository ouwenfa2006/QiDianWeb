package com.foshan.entity;

import java.io.Serializable;
import java.util.List;


/**
 * 用户角色类
 * @author Administrator
 *
 */
public class Role implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String roleName;
	private String description;
	private List<User> users;
	private List<Action> privileges;
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public List<Action> getPrivileges() {
		return privileges;
	}
	public void setPrivileges(List<Action> privileges) {
		this.privileges = privileges;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
