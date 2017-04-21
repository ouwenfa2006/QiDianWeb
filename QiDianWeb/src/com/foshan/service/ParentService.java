package com.foshan.service;

import com.foshan.entity.Parent;

public interface ParentService {
	void addParent(Parent parent);
	Integer findMaxId();
}
