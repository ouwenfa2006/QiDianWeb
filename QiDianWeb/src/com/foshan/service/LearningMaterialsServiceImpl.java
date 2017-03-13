package com.foshan.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.foshan.dao.LearningMaterialsDao;
import com.foshan.entity.LearningMaterials;
@Service(value="learningMaterialsService")
@Transactional(value="dataSourceTransactionManager",rollbackFor=Exception.class)
public class LearningMaterialsServiceImpl implements LearningMaterialsService{
	@Resource(name="learningMaterialsDao")
	private LearningMaterialsDao learningMaterialsDao;
	@Override
	public void addLearningMaterials(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsDao.addLearningMaterials(learningMaterials);
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public LearningMaterials findById(Integer id) {
		// TODO Auto-generated method stub
		return learningMaterialsDao.findById(id);
		
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public List<LearningMaterials> findAllLearningMaterials(int page,int pageSize,String grade,String courseName) {
		// TODO Auto-generated method stub
		int start=(page-1)*pageSize;
		if(grade!=null&&courseName!=null){
			return learningMaterialsDao.findLearningMaterials(grade,courseName,start,pageSize);
		}
		return learningMaterialsDao.findAllLearningMaterials(start,pageSize);
	}
	
	@Override
	public void deleteByIds(Integer... ids) {
		// TODO Auto-generated method stub
		for (int id : ids) {
			learningMaterialsDao.deleteByIds(id);
		}
	}
	@Transactional(propagation=Propagation.NOT_SUPPORTED)
	@Override
	public List<LearningMaterials> findLearningMaterialsByFileName(
			String fileName) {
		// TODO Auto-generated method stub
		return learningMaterialsDao.findLearningMaterialsByFileName(fileName);
	}

	@Override
	public void update(LearningMaterials learningMaterials) {
		// TODO Auto-generated method stub
		learningMaterialsDao.update(learningMaterials);
	}

}
