package com.foshan.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 学习资料类
 * @author Administrator
 *
 */
public class LearningMaterials implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String courseName;//科目名称
	private String grade;//年级
	private String path;//文件保存路径
	private String absoulteFileName;//真实保存的文件名
	private String fileName;//文件名
	private Date uploadTime;
	private User uploadUser;
	private int downloadCount;
	public String getAbsoulteFileName() {
		return absoulteFileName;
	}
	public void setAbsoulteFileName(String absoulteFileName) {
		this.absoulteFileName = absoulteFileName;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Date getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}
	public User getUploadUser() {
		return uploadUser;
	}
	public void setUploadUser(User uploadUser) {
		this.uploadUser = uploadUser;
	}
	public int getDownloadCount() {
		return downloadCount;
	}
	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
