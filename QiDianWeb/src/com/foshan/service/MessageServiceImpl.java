package com.foshan.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.MessageDao;
import com.foshan.entity.Message;
@Service(value="messageService")
@Transactional(value="dataSourceTransactionManager")
public class MessageServiceImpl implements MessageService{
	@Resource(name="messageDao")
	private MessageDao messageDao;
	@Override
	public int addMessageFromParentToUser(Message message) {
		Integer maxId=messageDao.findMaxId();
		System.out.println(maxId);
		if(maxId==null){
			message.setMessageId(1);
		}else{
			message.setMessageId(maxId+1);
		}
		messageDao.addMessage(message);
		int n=messageDao.addMessage_Parent_User(message);
		return n;
	}

}
