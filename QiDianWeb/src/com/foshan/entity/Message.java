package com.foshan.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * 消息类
 * @author Administrator
 *
 */
public class Message implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer messageId;
	private String text;
	private Date createDate;
	private User fromUser;
	private Parent fromParent;
	private Student fromStudent;
	private List<User> toUsers;
	private List<Parent> toParents;
	private List<Student> toStudents;
	private Integer isNewMessage;
	public Integer getMessageId() {
		return messageId;
	}
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public User getFromUser() {
		return fromUser;
	}
	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}
	public Parent getFromParent() {
		return fromParent;
	}
	public void setFromParent(Parent fromParent) {
		this.fromParent = fromParent;
	}
	public Student getFromStudent() {
		return fromStudent;
	}
	public void setFromStudent(Student fromStudent) {
		this.fromStudent = fromStudent;
	}
	public List<User> getToUsers() {
		return toUsers;
	}
	public void setToUsers(List<User> toUsers) {
		this.toUsers = toUsers;
	}
	public List<Parent> getToParents() {
		return toParents;
	}
	public void setToParents(List<Parent> toParents) {
		this.toParents = toParents;
	}
	public List<Student> getToStudents() {
		return toStudents;
	}
	public void setToStudents(List<Student> toStudents) {
		this.toStudents = toStudents;
	}
	public Integer getIsNewMessage() {
		return isNewMessage;
	}
	public void setIsNewMessage(Integer isNewMessage) {
		this.isNewMessage = isNewMessage;
	}
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", text=" + text
				+ ", createDate=" + createDate + "]";
	}
	
}
