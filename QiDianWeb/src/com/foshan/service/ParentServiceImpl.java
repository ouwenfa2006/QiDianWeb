package com.foshan.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.ParentDao;
import com.foshan.entity.Parent;
@Service(value="parentService")
@Transactional(value="dataSourceTransactionManager",rollbackFor=Exception.class)
public class ParentServiceImpl implements ParentService{
	@Resource(name="parentDao")
	private ParentDao parentDao;
	@Override
	public void addParent(Parent parent) {
		parentDao.addParent(parent);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public Integer findMaxId() {
		
		return parentDao.findMaxId("select max(parentId) from parent");
	}

}
