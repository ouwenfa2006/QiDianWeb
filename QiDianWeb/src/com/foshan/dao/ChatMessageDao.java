package com.foshan.dao;

import java.util.List;

import com.foshan.entity.ChatMessage;

public interface ChatMessageDao extends BaseDao<ChatMessage>{
	void addChatMessage(ChatMessage chatMessage);
	List<ChatMessage> findMessageFromClient(String sessionId, Integer token, Integer toChaterId);
	List<ChatMessage> findMessageFromAdmin(String sessionId, Integer token,Integer toChaterId);
	void updateMessageFromAdmin(String sessionId, Integer token,Integer toChaterId);
	void updateMessageFromClient(String sessionId, Integer token,Integer toChaterId);
	
}
