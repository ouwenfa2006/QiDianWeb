package com.foshan.service;

import com.foshan.entity.Message;

public interface MessageService {
	/**
	 * 家长给管理员发信息
	 * @param message
	 * @return
	 */
	int addMessageFromParentToUser(Message message);
}
