package com.foshan.entity;

import java.io.Serializable;

public class Image implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer imageId;
	private User user;
	private String savePath;
	private String relativePath;
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public Integer getImageId() {
		return imageId;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User getUser() {
		return user;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getRelativePath() {
		return relativePath;
	}
	public void setRelativePath(String relativePath) {
		this.relativePath = relativePath;
	}
}
