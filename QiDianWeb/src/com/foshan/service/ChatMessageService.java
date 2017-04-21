package com.foshan.service;

import java.util.List;

import com.foshan.dao.BaseDao;
import com.foshan.entity.ChatMessage;

public interface ChatMessageService{
	/**
	 * 增加聊天记录
	 * @param chatMessage
	 */
	void addChatMessage(ChatMessage chatMessage);
	/**
	 * 根据sessionId查找发给管理员的信息数据
	 * @param sessionId
	 * @param token 读取次数
	 * @param toChaterId 消息读取者
	 * @return
	 */
	List<ChatMessage> findMessageFromClient(String sessionId,Integer token,Integer toChaterId);
	/**
	 * 根据sessionId查找发给游客的信息
	 * @param sessionId
	 * @param token
	 * @return
	 */
	List<ChatMessage> findMessageFromAdmin(String sessionId, Integer token,Integer toChaterId);
	/**
	 * 更改信息状态，state  1表示已读
	 * @param sessionId
	 * @param i
	 * @param toChaterId
	 */
	void updateMessageFromAdmin(String sessionId, Integer i, Integer toChaterId);
	/**
	 * 更改信息状态，state  1表示已读
	 * @param sessionId
	 * @param i
	 * @param toChaterId
	 */
	void updateMessageFromClient(String sessionId, Integer token, Integer toChaterId);
}
