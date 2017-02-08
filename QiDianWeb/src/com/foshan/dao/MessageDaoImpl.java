package com.foshan.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.Message;
import com.foshan.entity.User;
import com.foshan.mapper.MessageMapper;
@Repository(value="messageDao")
public class MessageDaoImpl extends BaseDaoSupport<Message> implements MessageDao{
	@Resource(name="messageMapper")
	private MessageMapper messageMapper;
	@Override
	public int addMessage(Message message) {
		// TODO Auto-generated method stub
		return messageMapper.addMessage(message);
	}
	@Override
	public int addMessage_Parent_User(Message message) {
		// TODO Auto-generated method stub
		List<User> users=message.getToUsers();
		int n=0;
		for (User user : users) {
			n=messageMapper.addMessage_Parent_User(message.getMessageId(), user.getUserId());
		}
		return n;
	}
	@Override
	public Integer findMaxId() {
		// TODO Auto-generated method stub
		return messageMapper.findMaxId();
	}
	@Override
	public List<Message> findAllNewMessages() {
		// TODO Auto-generated method stub
		return messageMapper.findAllNewMessages();
	}

}
