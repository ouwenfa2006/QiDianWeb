package com.foshan.dao;

import com.foshan.entity.Parent;

public interface ParentDao extends BaseDao<Parent>{
	void addParent(Parent parent);
}
