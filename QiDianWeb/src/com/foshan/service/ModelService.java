package com.foshan.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.entity.Parent;
/**
 * 综合业务类
 * @author Administrator
 *
 */
@Service(value="modelService")
@Transactional(value="dataSourceTransactionManager")
public class ModelService {
	@Resource(name="parentService")
	private ParentService parentService;
	@Resource(name="userRoleService")
	private UserRoleService userRoleService;
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="learningMaterialsService")
	private LearningMaterialsService learningMaterialsService;
	public void addParent(String parentName, String parentPhone) {
		// TODO Auto-generated method stub
		Parent parent=new Parent();
		parent.setParentName(parentName);
		parent.setParentPhone(Long.parseLong(parentPhone));
		parent.setCreateDate(new Date());
		parentService.addParent(parent);
	}
}
