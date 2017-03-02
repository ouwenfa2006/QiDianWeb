package com.foshan.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.foshan.entity.Message;

public interface MessageMapper {
	int addMessage(Message message);
	int addMessage_Parent_User(@Param("messageId")Integer messageId,@Param("toUserId") Integer toUserId);
	Integer findMaxId();
	List<Message> findAllNewMessages();
	Message findLastNewMessage(@Param("maxId")Integer maxId);
	void clearNewMessageById(@Param("messageId")int id);
}
