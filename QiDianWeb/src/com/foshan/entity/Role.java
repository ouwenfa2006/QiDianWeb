package com.foshan.entity;

import java.util.List;


/**
 * 用户角色类
 * @author Administrator
 *
 */
public class Role {
	private int id;
	private String roleName;
	private List<Action> privileges;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
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
}
