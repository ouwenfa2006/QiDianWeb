package com.foshan.dao;

import com.foshan.entity.Message;

public interface MessageDao extends BaseDao<Message>{
	int addMessage(Message message);
	int addMessage_Parent_User(Message message);
	Integer findMaxId();
}
