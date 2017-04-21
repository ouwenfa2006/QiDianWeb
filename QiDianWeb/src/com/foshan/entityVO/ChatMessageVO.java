package com.foshan.entityVO;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.foshan.entity.ChatMessage;

public class ChatMessageVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String chatMessageId;
	private String createTime;
	private String sessionId;
	private String token;
	private String text;
	public String getChatMessageId() {
		return chatMessageId;
	}
	public void setChatMessageId(String chatMessageId) {
		this.chatMessageId = chatMessageId;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	/**
	 * 将vo转换成entity
	 * @param chatMessageVO
	 * @return
	 * @throws ParseException
	 */
	public static ChatMessage covertToChatMessage(ChatMessageVO chatMessageVO) throws ParseException{
		ChatMessage chatMessage=new ChatMessage();
		if(chatMessageVO.getChatMessageId()!=null){
			chatMessage.setChatMessageId(Integer.parseInt(chatMessageVO.getChatMessageId()));
		}
		if(chatMessageVO.getCreateTime()!=null){
			chatMessage.setCreateTime(new SimpleDateFormat().parse(chatMessageVO.getCreateTime()));
		}
		if(chatMessageVO.getSessionId()!=null){
			chatMessage.setSessionId(chatMessageVO.getSessionId());
		}
		if(chatMessageVO.getText()!=null){
			chatMessage.setText(chatMessageVO.getText());
		}
		if(chatMessageVO.getToken()!=null){
			chatMessage.setToken(Integer.parseInt(chatMessageVO.getToken()));
		}
		return chatMessage;
	}
	@Override
	public String toString() {
		return "ChatMessageVO [chatMessageId=" + chatMessageId
				+ ", createTime=" + createTime + ", sessionId=" + sessionId
				+ ", token=" + token + ", text=" + text + "]";
	};
}
