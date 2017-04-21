package com.foshan.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.ChatMessageDao;
import com.foshan.entity.ChatMessage;

@Service(value="chatMessageService")
@Transactional(rollbackFor=Exception.class)
public class ChatMessageServiceImpl implements ChatMessageService {
	@Resource(name="chatMessageDao")
	private ChatMessageDao chatMessageDao;

	@Override
	public void addChatMessage(ChatMessage chatMessage) {
		// TODO Auto-generated method stub
		if(chatMessage.getCreateTime()==null){
			chatMessage.setCreateTime(new Date());
		}
		chatMessageDao.addChatMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> findMessageFromClient(String sessionId, Integer token,
			Integer toChaterId) {
		List<ChatMessage> list=chatMessageDao.findMessageFromClient(sessionId,token,toChaterId);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	@Override
	public List<ChatMessage> findMessageFromAdmin(String sessionId, Integer token,Integer toChaterId) {
		List<ChatMessage> list=chatMessageDao.findMessageFromAdmin(sessionId,token,toChaterId);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}

	@Override
	public void updateMessageFromAdmin(String sessionId, Integer token,Integer toChaterId) {
		// TODO Auto-generated method stub
		chatMessageDao.updateMessageFromAdmin(sessionId,token,toChaterId);
	}

	@Override
	public void updateMessageFromClient(String sessionId, Integer token,
			Integer toChaterId) {
		// TODO Auto-generated method stub
		chatMessageDao.updateMessageFromClient(sessionId,token,toChaterId);
	}
	
	
}
