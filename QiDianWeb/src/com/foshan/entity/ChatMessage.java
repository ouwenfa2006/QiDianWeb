package com.foshan.entity;

import java.io.Serializable;
import java.util.Date;
/**
 * 临时会话信息
 * @author XiaoUS
 *
 */
public class ChatMessage implements Serializable{
	private static final long serialVersionUID = 1L;
	private Integer chatMessageId;
	private Date createTime;
	private String sessionId;
	private Integer token;
	private String text;
	private Integer toChaterId;
	private Integer chatKey;
	public void setChatKey(Integer chatKey) {
		this.chatKey = chatKey;
	}
	public Integer getChatKey() {
		return chatKey;
	}
	public void setToChaterId(Integer toChaterId) {
		this.toChaterId = toChaterId;
	}
	public Integer getToChaterId() {
		return toChaterId;
	}
	public void setChatMessageId(Integer chatMessageId) {
		this.chatMessageId = chatMessageId;
	}
	public Integer getChatMessageId() {
		return chatMessageId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Integer getToken() {
		return token;
	}
	public void setToken(Integer token) {
		this.token = token;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "ChatMessage [chatMessageId=" + chatMessageId + ", createTime="
				+ createTime + ", sessionId=" + sessionId + ", token=" + token
				+ ", text=" + text + ", toChaterId=" + toChaterId + "]";
	}
	

	

}
