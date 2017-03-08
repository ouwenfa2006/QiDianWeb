package com.foshan.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ejb.FinderException;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.entity.Message;
import com.foshan.entity.Parent;
import com.foshan.entity.User;
import com.foshan.util.Constant;
/**
 * 综合业务类
 * @author Administrator
 *
 */
@Service(value="modelService")
@Transactional(value="dataSourceTransactionManager")
public class ModelService {
	@Resource(name="serviceMap")
	private Map serviceMap;//封装service
	public RoleSerivce getRoleSerivce() {
		return (RoleSerivce) serviceMap.get(Constant.ROLE_SERVICE);
	}
	public CourseService getCourseService() {
		return (CourseService) serviceMap.get(Constant.COURSE_SERVICE);
	}
	public ParentService getParentService() {
		return (ParentService) serviceMap.get(Constant.PARENT_SERVICE);
	}
	public UserRoleService getUserRoleService() {
		return (UserRoleService) serviceMap.get(Constant.USER_ROLE_SERVICE);
	}
	public UserService getUserService() {
		return (UserService) serviceMap.get(Constant.USER_SERVICE);
	}
	
	public MessageService getMessageService() {
		return (MessageService) serviceMap.get(Constant.MESSAGE_SERVICE);
	}
	public LearningMaterialsService getLearningMaterialsService() {
		return (LearningMaterialsService) serviceMap.get(Constant.LEARNINGMATERIALS_SERVICCE);
	}
	/**添加咨询家长
	 * @param parentName
	 * @param parentPhone
	 * @param courseName 
	 * @param grade 
	 */
	public int addParent(String parentName, String parentPhone, String grade, String courseName) {
		// TODO Auto-generated method stub
		Parent parent=new Parent();
		Integer maxId=getParentService().findMaxId();
		if(maxId==null){
			maxId=1;
		}
		parent.setParentId(maxId+1);
		parent.setParentName(parentName);
		parent.setParentPhone(Long.parseLong(parentPhone));
		parent.setCreateDate(new Date());
		getParentService().addParent(parent);//添加家长
		Message message=new Message();
		message.setCreateDate(new Date());
		message.setFromParent(parent);
		List<User> toUsers=getUserService().findUsersAndImagesfindUsersAndImages(1, 20, null, null, "admin", null);
		message.setText("新家长注册!//家长姓名:"+parentName+"//家长联系方式:"+parentPhone+"//报读科目:"+grade+courseName+"!");
		message.setToUsers(toUsers);
		int n=getMessageService().addMessageFromParentToUser(message);//添加家长的注册信息
		return n;
	}
	/**
	 * 更新在线人数
	 * @param size
	 */
	public void updateChatPersons(int size) {
		// TODO Auto-generated method stub
		
	}
	
}
