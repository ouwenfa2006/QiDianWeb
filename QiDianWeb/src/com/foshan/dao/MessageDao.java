package com.foshan.dao;

import java.util.List;

import com.foshan.entity.Message;

public interface MessageDao extends BaseDao<Message>{
	int addMessage(Message message);
	/**
	 * 家长给管员发信息,关联添加
	 * @param message
	 * @return
	 */
	int addMessage_Parent_User(Message message);
	Integer findMaxId();
	List<Message> findAllNewMessages();
}
