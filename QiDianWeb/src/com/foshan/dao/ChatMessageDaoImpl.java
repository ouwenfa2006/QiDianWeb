package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.ChatMessage;
import com.foshan.mapper.ChatMessageMapper;
@Repository(value="chatMessageDao")
public class ChatMessageDaoImpl extends BaseDaoSupport<ChatMessage> implements ChatMessageDao{
	@Resource(name="chatMessageMapper")
	private ChatMessageMapper chatMessageMapper;
	@Override
	public void addChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		chatMessageMapper.addChatMessage(chatMessage);
	}
	@Override
	public List<ChatMessage> findMessageFromClient(String sessionId, Integer token,Integer toChaterId) {
		// TODO Auto-generated method stub
		return (List<ChatMessage>) chatMessageMapper.findMessageFromClient(sessionId, token,toChaterId);
	}
	@Override
	public List<ChatMessage> findMessageFromAdmin(String sessionId, Integer token,Integer toChaterId) {
		// TODO Auto-generated method stub
		return (List<ChatMessage>) chatMessageMapper.findMessageFromAdmin(sessionId, token,toChaterId);
	}
	@Override
	public void updateMessageFromAdmin(String sessionId, Integer token,
			Integer toChaterId) {
		// TODO Auto-generated method stub
		chatMessageMapper.updateMessageFromAdmin(sessionId,token,toChaterId);
	}
	@Override
	public void updateMessageFromClient(String sessionId, Integer token,
			Integer toChaterId) {
		// TODO Auto-generated method stub
		chatMessageMapper.updateMessageFromClient(sessionId,token,toChaterId);
	}
	

}
