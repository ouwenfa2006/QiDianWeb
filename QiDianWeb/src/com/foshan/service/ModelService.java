package com.foshan.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.ejb.FinderException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.entity.Message;
import com.foshan.entity.Parent;
import com.foshan.entity.User;
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
	public RoleSerivce getRoleSerivce() {
		return roleSerivce;
	}
	public void setRoleSerivce(RoleSerivce roleSerivce) {
		this.roleSerivce = roleSerivce;
	}
	@Resource(name="userRoleService")
	private UserRoleService userRoleService;
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="learningMaterialsService")
	private LearningMaterialsService learningMaterialsService;
	@Resource(name="messageService")
	private MessageService messageService;
	@Resource(name="roleService")
	private RoleSerivce roleSerivce;
	public ParentService getParentService() {
		return parentService;
	}
	public void setParentService(ParentService parentService) {
		this.parentService = parentService;
	}
	public UserRoleService getUserRoleService() {
		return userRoleService;
	}
	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public MessageService getMessageService() {
		return messageService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
	public LearningMaterialsService getLearningMaterialsService() {
		return learningMaterialsService;
	}
	public void setLearningMaterialsService(
			LearningMaterialsService learningMaterialsService) {
		this.learningMaterialsService = learningMaterialsService;
	}
	/**
	 * @param parentName
	 * @param parentPhone
	 * @param courseName 
	 * @param grade 
	 */
	public int addParent(String parentName, String parentPhone, String grade, String courseName) {
		// TODO Auto-generated method stub
		Parent parent=new Parent();
		Integer maxId=parentService.findMaxId();
		if(maxId==null){
			maxId=1;
		}
		parent.setParentId(maxId+1);
		parent.setParentName(parentName);
		parent.setParentPhone(Long.parseLong(parentPhone));
		parent.setCreateDate(new Date());
		parentService.addParent(parent);//添加家长
		Message message=new Message();
		message.setCreateDate(new Date());
		message.setFromParent(parent);
		List<User> toUsers=userService.findUsersAndImagesfindUsersAndImages(1, 20, null, null, "admin", null);
		message.setText("新家长注册!//家长姓名:"+parentName+"//家长联系方式:"+parentPhone+"//报读科目:"+grade+courseName+"!");
		message.setToUsers(toUsers);
		int n=messageService.addMessageFromParentToUser(message);//添加家长的注册信息
		return n;
	}
	
}
