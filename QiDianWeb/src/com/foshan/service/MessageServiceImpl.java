package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.MessageDao;
import com.foshan.entity.Message;
@Service(value="messageService")
@Transactional(value="dataSourceTransactionManager",rollbackFor=Exception.class)
public class MessageServiceImpl implements MessageService{
	@Resource(name="messageDao")
	private MessageDao messageDao;
	@Override
	public int addMessageFromParentToUser(Message message) {
		Integer maxId=messageDao.findMaxId();
		if(maxId==null){
			message.setMessageId(1);
		}else{
			message.setMessageId(maxId+1);
		}
		message.setType("parentToUser");
		messageDao.addMessage(message);
		int n=messageDao.addMessage_Parent_User(message);
		return n;
	}
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public List<Message> findAllNewMessages() {
		// TODO Auto-generated method stub
		return messageDao.findAllNewMessages();
	}
	@Override
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	public Message findLastNewMessage() {
		// TODO Auto-generated method stub
		Integer maxId=messageDao.findMaxId();
		return messageDao.findLastNewMessage(maxId);
	}
	@Override
	public void clearNewMessageById(int id) {
		// TODO Auto-generated method stub
		 messageDao.clearNewMessageById(id);
	}

}
