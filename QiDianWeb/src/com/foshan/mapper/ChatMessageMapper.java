package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import com.foshan.entity.ChatMessage;

public interface ChatMessageMapper {
	void addChatMessage(ChatMessage chatMessage);
	List<ChatMessage> findMessageFromClient(@Param("sessionId") String sessionId, @Param("token")Integer token,@Param("toChaterId") Integer toChaterId);
	List<ChatMessage> findMessageFromAdmin(@Param("sessionId")String sessionId,@Param("token") Integer token,@Param("toChaterId")Integer toChaterId);
	void updateMessageFromAdmin(@Param("sessionId")String sessionId,@Param("token") Integer token,@Param("toChaterId")Integer toChaterId);
	void updateMessageFromClient(@Param("sessionId")String sessionId,@Param("token") Integer token,@Param("toChaterId")Integer toChaterId);
}
