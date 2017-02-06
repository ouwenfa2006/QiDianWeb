package com.foshan.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.foshan.entity.Parent;
import com.foshan.mapper.ParentMapper;
import com.foshan.mapper.UserMapper;
@Repository(value="parentDao")
public class ParentDaoImpl implements ParentDao{
	@Resource(name="parentMapper")
	private ParentMapper parentMapper;
	@Override
	public void addParent(Parent parent) {
		// TODO Auto-generated method stub
		parentMapper.addParent(parent);
	}

}
